import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

final defaultChatCrudConfigs = [
  CrudConfig<NitChatParticipant>(
    table: NitChatParticipant.t,
    getAll: GetAllConfig(
      additionalEntitiesFetchFunction: (session, models) =>
          session.db.find<UserInfo>(
        where: UserInfo.t.id.inSet(
          models.map((e) => e.userInfoId).toSet(),
        ),
      ),
    ),
  ),
  CrudConfig<NitChatMessage>(
    table: NitChatMessage.t,
    getAll: GetAllConfig(),
    post: PostConfig(
      allowInsert: (session, model) async {
        return model.userInfoId == (await session.authenticated)?.userId;
      },
    ),
  ),
];
