import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

final defaultChatCrudConfigs = [
  CrudConfig<NitChatParticipant>(
    table: NitChatParticipant.t,
    getAll: GetAllConfig(
      defaultOrderByList: [
        Order(
          column: NitChatParticipant.t.lastMessageSentAt,
          orderDescending: true,
        ),
      ],
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
    getAll: GetAllConfig(
      defaultOrderByList: [
        Order(
          column: NitChatMessage.t.sentAt,
        ),
      ],
    ),
    post: PostConfig(
      allowInsert: (session, model) async {
        return model.userInfoId == (await session.authenticated)?.userId;
      },
      afterInsert: (session, model) async {
        final participants = await NitChatParticipant.db.find(
          session,
          where: (t) => t.chatChannelId.equals(model.chatChannelId),
        );

        for (var p in participants) {
          session.nitSendToUser(
            p.userInfoId,
            await NitChatParticipant.db.updateRow(
              session,
              p.copyWith(
                lastMessage: model.text,
                lastMessageSentAt: model.sentAt,
                unreadCount: await session.isUser(model.userInfoId)
                    ? p.unreadCount
                    : p.unreadCount + 1,
              ),
            ),
          );
        }

        NitPushNotifications.sendPushToUsers(
          session,
          userIds: participants
              .map((e) => e.userInfoId)
              .where((e) => e != model.userInfoId)
              .toList(),
          title: model.text!,
          body: '',
          // 'Поздравляем с покупкой, робот теперь доступен в разделе Мои Роботы',
        );

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
