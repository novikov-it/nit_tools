import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nit_tools_flutter/src/dw_bridge/dw_singleton.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nit_push_handler.g.dart';

// Обработчик фоновых сообщений (должен быть top-level функцией)
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('Handling a background message: ${message.messageId}');
}

@Riverpod(keepAlive: true)
class FirebaseNotificationService extends _$FirebaseNotificationService {
  static late final Provider<GoRouter> routerProvider;
  static RemoteMessage? terminatedMessage;
  @override
  Future<void> build() async {
    await _setup();
  }

  Future<void> _setup() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // await _requestPermissions();
    await _setupMessageHandlers();
  }

  // Future<void> _requestPermissions() async {
  //   await FirebaseMessaging.instance.requestPermission();
  // }

  Future<void> _setupMessageHandlers() async {
    //Foreground shows
    FirebaseMessaging.onMessage.listen((message) {
      debugPrint('Foreground message: ${message.data}');

      // ref.notifyUser(
      //   NitNotification.success(
      //     '${message.notification?.title}',
      //     onTap: () => _navigateFromMessage(message),
      //     position: FlashPosition.top,
      //   ),
      // );

      // TODO: add navigation
      dw.notify.info('${message.notification?.title}');
    });

    //Background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint('Background message: ${message.data}');
      _navigateFromMessage(message);
    });

    //Terminated
    terminatedMessage = await FirebaseMessaging.instance.getInitialMessage();
  }

  // Call it when app is ready to handle navigation (e.g HomeScreen)
  void handleTerminatedMessage() {
    debugPrint('Terminated message handle: ${terminatedMessage?.data}');
    if (terminatedMessage != null) {
      _navigateFromMessage(terminatedMessage!);
    }
  }

  void _navigateFromMessage(RemoteMessage message) {
    if (message.data.containsKey('goToPath')) {
      final goRouter = ref.read(routerProvider);

      // final allZones =
      //     routerProvider.navigationZones.expand((zone) => zone).toList();
      final targetPath = message.data['goToPath'] as String?;
      if (targetPath != null) {
        try {
          // final matchedZone = allZones.firstWhere(
          //   (zone) => zone.name.toLowerCase() == targetPath.toLowerCase(),
          // );
          goRouter.push(targetPath);
          //   matchedZone.name,
          //   pathParameters:
          //       (message.data['pathQueryParams'] as String?)
          //           .parsePushPathParameters,
          // );
        } catch (e) {
          // No matching zone found
          debugPrint('No matching navigation zone found for path: $targetPath');
        }
      }
    }
  }
}
