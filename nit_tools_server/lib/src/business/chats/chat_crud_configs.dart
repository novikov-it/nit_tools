import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

final defaultChatCrudConfigs = [
  CrudConfig<NitChatParticipant>(
    table: NitChatParticipant.t,
    post: PostConfig(
      allowInsert: (session, model) async {
        return model.userId == (await session.authenticated)?.userId;
      },
      allowUpdate: (session, model) async {
        return model.userId == (await session.authenticated)?.userId;
      },
    ),
    getAll: GetAllConfig(
      defaultOrderByList: [
        Order(
          column: NitChatParticipant.t.lastMessageSentAt,
          orderDescending: true,
        ),
      ],
      additionalEntitiesFetchFunction: (session, models) async => [
        // TODO: убрать
        ...await UserInfo.db.find(
          session,
          where: (t) => t.id.inSet(
            models.map((e) => e.userId).toSet(),
          ),
        ),
        ...await NitChatsConfig.additionalEntitiesLoaderForInitialChatData(
          session,
          models.map((e) => e.userId).toSet(),
        ),
        // TODO: непонятно
        ...await NitChatChannel.db.find(
          session,
          where: (t) => t.id.inSet(
            models.map((e) => e.chatChannelId).toSet(),
          ),
        ),
      ],
    ),
    getOneCustomConfigs: [
      GetOneCustomConfig(
        filterPrototype: NitBackendFilter.andPrototype(
          children: [
            NitBackendFilter.equalsPrototype(fieldName: 'chatChannelId'),
            NitBackendFilter.equalsPrototype(fieldName: 'userId'),
          ],
        ),
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
  ),
  CrudConfig<NitChatMessage>(
    table: NitChatMessage.t,
    getAll: GetAllConfig(
        defaultOrderByList: [
          Order(
            column: NitChatMessage.t.sentAt,
          ),
        ],
        additionalEntitiesFetchFunction: (session, models) async {
          return [
            ...await NitMedia.db.find(
              session,
              where: (t) => t.id.inSet(
                models.expand((m) => (m.attachmentIds ?? <int>[])).toSet(),
              ),
            ),
          ];
        }),
    // getOneById: GetOneByIdConfig(),
    getOneCustomConfigs: [
      GetOneCustomConfig(
        filterPrototype: NitBackendFilter.equalsPrototype(fieldName: 'id'),
      ),
    ],
    post: PostConfig(
      allowInsert: (session, model) async => session.isUser(model.userId),
      allowUpdate: (session, model) async => session.isUser(model.userId),
      allowDelete: (session, model) async => session.isUser(model.userId),
      afterUpdate: (session, initialModel, updatedModel) async {
        if (!updatedModel.isDeleted) {
          final participants = await NitChatParticipant.db.find(
            session,
            where: (t) => t.chatChannelId.equals(initialModel.chatChannelId),
          );
          for (var p in participants) {
            final isLastMessage = p.lastMessageId == updatedModel.id;

            session.nitSendToUser(
              p.userId,
              await NitChatParticipant.db.updateRow(
                session,
                p.copyWith(
                  lastMessage:
                      isLastMessage ? updatedModel.text : p.lastMessage,
                  lastMessageId:
                      isLastMessage ? updatedModel.id : p.lastMessageId,
                  lastMessageSentAt:
                      isLastMessage ? updatedModel.sentAt : p.lastMessageSentAt,
                ),
              ),
            );
          }
        }

        session.nitSendToChat(
          initialModel.chatChannelId,
          updatedModel,
        );
        return [];
      },
      afterInsert: (session, model) async {
        final participants = await NitChatParticipant.db.find(
          session,
          where: (t) => t.chatChannelId.equals(model.chatChannelId),
        );

        for (var p in participants) {
          session.nitSendToUser(
            p.userId,
            await NitChatParticipant.db.updateRow(
              session,
              p.copyWith(
                lastMessage: model.text,
                lastMessageId:
                    model.userId == p.userId ? model.id : p.lastMessageId,
                lastMessageSentAt: model.sentAt,
                unreadCount: await session.isUser(p.userId)
                    ? p.unreadCount
                    : p.unreadCount + 1,
              ),
            ),
          );
        }

        if (NitChatsConfig.pushNotificationConfig != null) {
          await NitPushNotifications.sendPushToUsers(
            session,
            userIds:
                NitChatsConfig.pushNotificationConfig!.filterMessagePermission(
              participants
                  .map((e) => e.userId)
                  .where((e) => e != model.userId)
                  .toList(),
            ),
            title: await NitChatsConfig.pushNotificationConfig!
                    .title(session, model.userId, model.text) ??
                '${model.text}',
            body: await NitChatsConfig.pushNotificationConfig!
                    .body(session, model.userId, model.text) ??
                '',
            goToPath: NitChatsConfig.pushNotificationConfig!
                .goToPath(model.chatChannelId),
            pathQueryParams: NitChatsConfig.pushNotificationConfig!
                .pathQueryParams(model.chatChannelId),
          );
        }

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
  CrudConfig<NitMedia>(
    table: NitMedia.t,
    // getOneById: GetOneByIdConfig(),
    getOneCustomConfigs: [
      GetOneCustomConfig(
        filterPrototype: NitBackendFilter.equalsPrototype(fieldName: 'id'),
      ),
    ],
  ),
];
