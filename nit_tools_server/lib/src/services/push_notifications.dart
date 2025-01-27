import 'dart:convert';
import 'dart:io';
import 'package:googleapis_auth/auth_io.dart' as google_auth;
import 'dart:developer' as devtools show log;

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
  }) async {
    final fcmTokens = await FcmToken.db.find(
      session,
      where: (t) => t.userId.inSet(
        userIds.toSet(),
      ),
    );

    return await sendPushToTokens(
      tokens: fcmTokens.map((e) => e.fcmToken).toList(),
      title: title,
      body: body,
    );
  }

  static Future<bool> sendPushToTokens({
    required List<String> tokens,
    required String title,
    required String body,
  }) async {
    for (var token in tokens.toSet()) {
      final notificationData = {
        'message': {
          'token': token,
          // 'e0l4epBfLXDATjJheApVMv:APA91bFrWTcuylHjkpViZaEfGrnFVf_FAHveyhwmWKCyhtiaLbfrIMQO1vxdGIH2SMPgQEZKMjrSUmdSZYQEvP0hPasq9sx8XgSNcKh_vHmDNbD8stIaFNqF1EPkLcjZUiYd_2JQfsS5', // recipientToken,
          'notification': {
            'title': title,
            'body': body,
          },
          'data': {
            'title': title,
            'body': body,
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'goToPath': 'robots',
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

      devtools.log(
          'Notification Sending Error Response status: ${response.statusCode}');
      devtools.log('Notification Response body: ${response.body}');
    }

    // _client.close();
    // if (response.statusCode == 200) {
    //   return true; // Success!
    // }
    // "{  "error": {    "code": 403,    "message": "Permission 'cloudmessaging.messages.create' denied on resource '//cloudresourcemanager.googleapis.com/projects/736705283357' (or it may not exist).",    "status": "PERMISSION_DENIED",    "details": [      {        "@type": "type.googleapis.com/google.rpc.ErrorInfo",        "reason": "IAM_PERMISSION_DENIED",        "domain": "cloudresourcemanager.googleapis.com",        "metadata": {          "resource": "projects/736705283357",          "permission": "cloudmessaging.messages.create"        }      }    ]  }}"

    return true;
  }
}
