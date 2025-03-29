import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class NitChatsConfig {
  static late final Future<List<ObjectWrapper>> Function(
          Session session, Set<int> userIds)
      additionalEntitiesLoaderForInitialChatData;
}
