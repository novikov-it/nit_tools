import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

final defaultChatCrudConfigs = [
  CrudConfig<NitChatParticipant>(
    table: NitChatParticipant.t,
    getAll: GetAllConfig(
      additionalEntitiesFetchFunction: (session, models) async => [
        ...await UserInfo.db.find(
          session,
          where: (t) => t.id.inSet(
            models.map((e) => e.userInfoId).toSet(),
          ),
        ),
        ...await NitChatChannel.db.find(
          session,
          where: (t) => t.id.inSet(
            models.map((e) => e.chatChannelId).toSet(),
          ),
        ),
      ],
    ),
  ),
  CrudConfig<NitChatMessage>(
    table: NitChatMessage.t,
    getAll: GetAllConfig(),
    post: PostConfig(
      allowInsert: (session, model) async {
        return model.userInfoId == (await session.authenticated)?.userId;
      },
      afterInsert: (session, model) async {
        // final participants = await NitChatParticipant.db.find(
        //   session,
        //   where: (t) => t.chatChannelId.equals(model.chatChannelId),
        // );

        // for (var p in participants) {
        //   session.nitSendToUser(
        //     p.userInfoId,
        //     model,
        //   );
        // }

        // for (var p in participants) {
        session.nitSendToChat(
          model.chatChannelId,
          model,
        );
        // }

        return [];
      },
    ),
  ),
];
