import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:googleapis_auth/auth_io.dart' as google_auth;
import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class NitPushNotifications {
  static late final google_auth.AutoRefreshingAuthClient _client;
  static late final String _senderId;

  static Future<bool> initFcmClient({
    required String serviceAccountFile,
    required String senderId,
  }) async {
    final input = await File(serviceAccountFile).readAsString();
    final jsonCredentials = jsonDecode(input);

    final creds =
        google_auth.ServiceAccountCredentials.fromJson(jsonCredentials);

    _client = await google_auth.clientViaServiceAccount(
      creds,
      ['https://www.googleapis.com/auth/cloud-platform'],
    );
    _senderId = senderId;

    return true;
  }

  static Future<bool> sendPushToUsers(
    Session session, {
    required List<int> userIds,
    required String title,
    required String body,
    bool includeBadgeCount = false,
    String? goToPath,
    String? pathQueryParams,
  }) async {
    final fcmTokens = await NitFcmToken.db.find(
      session,
      where: (t) => t.userId.inSet(
        userIds.toSet(),
      ),
    );

    return await sendPushToTokens(
      session,
      tokens: fcmTokens.map((e) => (e.fcmToken, e.userId)).toSet(),
      title: title,
      body: body,
      includeBadgeCount: includeBadgeCount,
      goToPath: goToPath,
      pathQueryParams: pathQueryParams,
    );
  }

  static Future<bool> sendPushToTokens(
    Session session, {
    required Set<(String token, int userId)> tokens,
    required String title,
    required String body,
    bool includeBadgeCount = false,
    String? goToPath,
    String? pathQueryParams,
  }) async {
    for (var token in tokens) {
      final notificationData = {
        'message': {
          'token': token.$1,
          'notification': {
            'title': title,
            'body': body,
          },
          'data': {
            'title': title,
            'body': body,
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            if (goToPath != null) 'goToPath': goToPath,
            if (pathQueryParams != null) 'pathQueryParams': pathQueryParams,
          },
          if (includeBadgeCount)
            'apns': {
              'payload': {
                'aps': {
                  'badge': await getUnreadNotificationCount(session, token.$2),
                }
              }
            },
        },
      };

      final response = await _client.post(
        Uri.parse(
          'https://fcm.googleapis.com/v1/projects/$_senderId/messages:send',
        ),
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode(notificationData),
      );

      log('Push Notification Response body: ${response.body}');
    }

    return true;
  }

  static Future<int> getUnreadNotificationCount(
    Session session,
    int userId,
  ) async {
    return await NitAppNotification.db.count(
      session,
      where: (t) => t.toUserId.equals(userId) & t.isRead.equals(false),
    );
  }
}
