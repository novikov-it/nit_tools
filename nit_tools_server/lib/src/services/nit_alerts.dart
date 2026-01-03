import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

class NitAlerts {
  static String? _alertsChatId;
  static String? _alertsToken;
  static String? _alertsMessageThreadId;

  /// Инициализация из .env
  static Future<void> init(
    Serverpod serverpod,
  ) async {
    try {
      _alertsChatId = serverpod.server.passwords['nitAlertsChatId'];
      _alertsToken = serverpod.server.passwords['nitAlertsToken'];
      _alertsMessageThreadId =
          serverpod.server.passwords['nitAlertsMessageThreadId'];

      if (_alertsChatId == null || _alertsToken == null) {
        print(
          '⚠️ NitAlerts: ошибка инициализации Chat ID $_alertsChatId или Token $_alertsToken',
        );
      } else {
        sendAlert(
          message: '✅ NitAlerts для ${serverpod.runMode} инициализированы',
        );
      }
    } catch (e) {
      print('⚠️ NitAlerts: Ошибка инициализации: $e');
    }
  }

  /// Отправка уведомления
  static Future<void> sendAlert({
    required String message,
  }) async {
    if (_alertsChatId == null || _alertsToken == null) {
      print(message);
      print(StackTrace.current);
      // debugPrint(
      //     '⚠️ TelegramAlerts: Не настроен токен/чат, сообщение не отправлено.');
      return;
    }

    await _sendMessage(
      message: message,
      chatId: _alertsChatId!,
      token: _alertsToken!,
      messageThreadId: _alertsMessageThreadId,
    );
  }

  static Future<void> _sendMessage({
    required String message,
    required String chatId,
    required String token,
    String? messageThreadId,
  }) async {
    try {
      final url = Uri.parse("https://api.telegram.org/bot$token/sendMessage");

      final body = {
        "chat_id": chatId,
        "text": message,
        if (messageThreadId != null) "message_thread_id": messageThreadId,
      };

      final res = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (res.statusCode != 200) {
        print(
          "⚠️ TelegramAlerts: Ошибка ответа ${res.statusCode}: ${res.body}",
        );
      }
    } catch (e) {
      print(
        "⚠️ TelegramAlerts: Exception при отправке: $e",
      );
    }
  }
}
