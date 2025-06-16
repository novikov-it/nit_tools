import 'package:serverpod/serverpod.dart';

class NitChatsConfig {
  static late final Future<List<TableRow>> Function(
          Session session, Set<int> userIds)
      additionalEntitiesLoaderForInitialChatData;

  static late final Function additionalOnMessageSentAction;

  static late final NitChatsPushNotificationConfig pushNotificationConfig;
}

class NitChatsPushNotificationConfig {
  final String? title;
  final String? body;
  final String Function(int channel)? goToPath;
  final String Function(int channel)? pathQueryParams;

  NitChatsPushNotificationConfig({
    this.title,
    this.body,
    this.goToPath,
    this.pathQueryParams,
  });
}
