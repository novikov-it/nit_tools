import 'package:serverpod/serverpod.dart';

class NitChatsConfig {
  static late final Future<List<TableRow>> Function(
          Session session, Set<int> userIds)
      additionalEntitiesLoaderForInitialChatData;
}
