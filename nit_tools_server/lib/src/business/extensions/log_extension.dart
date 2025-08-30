import 'dart:convert';

import 'package:serverpod/serverpod.dart';

extension LogEntity on TableRow {
  /// Логирует модель с учётом лимита телеграм (4096 символов).
  String toLogString() {
    final jsonString = const JsonEncoder.withIndent('  ').convert(toJson());

    // Ограничение Telegram - разумный запас
    const maxLen = 4096 - 200;

    if (jsonString.length <= maxLen) return jsonString;

    // Обрезаем и добавляем хвост
    return '${jsonString.substring(0, maxLen)}\n... [truncated]';
  }
}
