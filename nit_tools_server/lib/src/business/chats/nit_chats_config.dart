import 'dart:async';

import 'package:serverpod/serverpod.dart';

class NitChatsConfig {
  static late final Future<List<TableRow>> Function(
          Session session, Set<int> userIds)
      additionalEntitiesLoaderForInitialChatData;

  static Function? additionalOnMessageSentAction;

  static NitChatsPushNotificationConfig? pushNotificationConfig;
}

class NitChatsPushNotificationConfig {
  final FutureOr<String?> Function(
      Session session, int userFromId, String? messageText) title;
  final FutureOr<String?> Function(
      Session session, int userFromId, String? messageText) body;
  final String? Function(int channel) goToPath;
  final String? Function(int channel) pathQueryParams;
  // Filter userIds that would be allowed to get message
  final FutureOr<List<int>> Function(Session session, List<int> userIds)
      filterMessagePermission;

  NitChatsPushNotificationConfig({
    this.title = _nullThreeArgs,
    this.body = _nullThreeArgs,
    this.goToPath = _nullOneArg,
    this.pathQueryParams = _nullOneArg,
    this.filterMessagePermission = _nullListArg,
  });

  static FutureOr<String?> _nullThreeArgs(
          Session session, int userFromId, String? messageText) =>
      null;
  static String? _nullOneArg(int channel) => null;
  static List<int> _nullListArg(Session session, List<int> userIds) => userIds;
}
