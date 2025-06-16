import 'package:serverpod/serverpod.dart';

class NitChatsConfig {
  static late final Future<List<TableRow>> Function(
          Session session, Set<int> userIds)
      additionalEntitiesLoaderForInitialChatData;

  static late final Function additionalOnMessageSentAction;

  static late final NitChatsPushNotificationConfig pushNotificationConfig;
}

class NitChatsPushNotificationConfig {
  final String? Function(int userFromId, String? messageText) title;
  final String? Function(int userFromId, String? messageText) body;
  final String? Function(int channel) goToPath;
  final String? Function(int channel) pathQueryParams;

  NitChatsPushNotificationConfig({
    this.title = _nullTwoArgs,
    this.body = _nullTwoArgs,
    this.goToPath = _nullOneArg,
    this.pathQueryParams = _nullOneArg,
  });

  static String? _nullTwoArgs(int userFromId, String? messageText) => null;
  static String? _nullOneArg(int channel) => null;
}
