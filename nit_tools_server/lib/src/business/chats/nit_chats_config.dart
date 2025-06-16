import 'dart:async';

import 'package:serverpod/serverpod.dart';

class NitChatsConfig {
  static late final Future<List<TableRow>> Function(
          Session session, Set<int> userIds)
      additionalEntitiesLoaderForInitialChatData;

  static late final Function additionalOnMessageSentAction;

  static late final NitChatsPushNotificationConfig pushNotificationConfig;
}

class NitChatsPushNotificationConfig {
  final FutureOr<String?> Function(
      Session session, int userFromId, String? messageText) title;
  final FutureOr<String?> Function(
      Session session, int userFromId, String? messageText) body;
  final String? Function(int channel) goToPath;
  final String? Function(int channel) pathQueryParams;

  NitChatsPushNotificationConfig({
    this.title = _nullThreeArgs,
    this.body = _nullThreeArgs,
    this.goToPath = _nullOneArg,
    this.pathQueryParams = _nullOneArg,
  });

  static FutureOr<String?> _nullThreeArgs(
          Session session, int userFromId, String? messageText) =>
      null;
  static String? _nullOneArg(int channel) => null;
}
