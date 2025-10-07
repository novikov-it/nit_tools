import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

final chatParticipantInclude = NitChatParticipant.include(
  chatChannel: NitChatChannel.include(),
  lastMessage: NitChatMessage.include(),
  lastReadMessage: NitChatMessage.include(),
);

final nitChatParticipantCrudConfig = CrudConfig<NitChatParticipant>(
  table: NitChatParticipant.t,
  getAll: GetAllConfig(
    defaultOrderByList: [
      Order(
        column: NitChatParticipant.t.lastMessageSentAt,
        orderDescending: true,
      ),
    ],
    include: chatParticipantInclude,
  ),
  getOneCustomConfigs: [
    GetOneCustomConfig(
      filterPrototype: NitBackendFilter.andPrototype(
        children: [
          NitBackendFilter.equalsPrototype(fieldName: 'chatChannelId'),
          NitBackendFilter.equalsPrototype(fieldName: 'userId'),
        ],
      ),
      include: chatParticipantInclude,
      createIfMissing: (session, filter) async {
        final chatChannelId = filter.children!.first.fieldValue;
        final userId = filter.children!.last.fieldValue;
        return await session.joinChatChannel(
          chatChannelId: chatChannelId,
          userId: userId,
        );
      },
    ),
  ],
);
