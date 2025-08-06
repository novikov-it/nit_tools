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
      allowDelete: (session, model) async => session.isUser(model.userId),
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
      afterUpdateSideEffects:
          (session, currentUserId, initialModel, updatedModel) async {
        final participants = await NitChatParticipant.db.find(
          session,
          where: (t) => t.chatChannelId.equals(updatedModel.chatChannelId),
        );

        if (!updatedModel.isDeleted) {
          // Логика редактирования (оставляем как есть, но унифицировали fetch participants)
          for (var p in participants) {
            final isLastMessage = p.lastMessageId == updatedModel.id;
            if (isLastMessage) {
              await session.nitSendToUser(
                p.userId,
                await NitChatParticipant.db.updateRow(
                  session,
                  p.copyWith(
                    lastMessage:
                        isLastMessage ? updatedModel.text : p.lastMessage,
                    lastMessageId:
                        isLastMessage ? updatedModel.id : p.lastMessageId,
                    lastMessageSentAt: isLastMessage
                        ? updatedModel.sentAt
                        : p.lastMessageSentAt,
                  ),
                ),
              );
            }
          }
        } else {
          // Логика удаления: находим новое последнее НЕУДАЛЁННОЕ сообщение
          final newLastMessage = await NitChatMessage.db.findFirstRow(
            session,
            where: (t) =>
                t.chatChannelId.equals(updatedModel.chatChannelId) &
                t.isDeleted.equals(false),
            orderDescending: true,
            orderBy: (t) => t.id,
          );

          // if (newLastMessage == null) {
          //   return;
          // }

          for (var p in participants) {
            final isLastMessage = p.lastMessageId == updatedModel.id;
            if (isLastMessage) {
              await session.nitSendToUser(
                p.userId,
                await NitChatParticipant.db.updateRow(
                  session,
                  p.copyWith(
                    lastMessage: newLastMessage?.text,
                    lastMessageId: newLastMessage?.id,
                    lastMessageSentAt: newLastMessage?.sentAt,
                    unreadCount: p.unreadCount > 0
                        ? p.unreadCount - 1
                        : 0, //TODO: можно сделать лучше
                  ),
                ),
              );
            }
          }
        }

        return;
      },
      afterUpdate: (session, initialModel, updatedModel) async {
       await session.nitSendToChat(
          initialModel.chatChannelId,
          updatedModel,
        );
        return [];
      },

      // afterDelete: (session, deletedModel) async {
      //   final participants = await NitChatParticipant.db.find(
      //     session,
      //     where: (t) => t.chatChannelId.equals(deletedModel.chatChannelId),
      //   );
      //   final newLastMessage = await NitChatMessage.db.findFirstRow(
      //     session,
      //     where: (t) => t.chatChannelId.equals(deletedModel.chatChannelId),
      //     orderDescending: true,
      //   );
      //   if (newLastMessage == null) {
      //     // значит сообщений в чате больше нет
      //     return [];
      //   }
      //   // значит удаленное сообщение было последним
      //   if (deletedModel.id! > newLastMessage.id!) {
      //     for (var p in participants) {
      //       session.nitSendToUser(
      //         p.userId,
      //         await NitChatParticipant.db.updateRow(
      //           session,
      //           p.copyWith(
      //             lastMessage: newLastMessage.text,
      //             lastMessageId: newLastMessage.id,
      //             lastMessageSentAt: newLastMessage.sentAt,
      //           ),
      //         ),
      //       );
      //     }
      //   }

      //   return [];
      // },
      afterInsert: (session, model) async {
       await session.nitSendToChat(
          model.chatChannelId,
          model,
        );
        return [];
      },
      afterInsertSideEffects: (session, currentUserId, model) async {
        final participants = await NitChatParticipant.db.find(
          session,
          where: (t) => t.chatChannelId.equals(model.chatChannelId),
        );

        for (var p in participants) {
          await session.nitSendToUser(
            p.userId,
            await NitChatParticipant.db.updateRow(
              session,
              p.copyWith(
                lastMessage: model.text,
                lastMessageId: model.id,
                lastMessageSentAt: model.sentAt,
                unreadCount: currentUserId == p.userId
                    ? p.unreadCount
                    : p.unreadCount + 1,
              ),
            ),
          );
        }

        if (NitChatsConfig.pushNotificationConfig != null) {
          await NitPushNotifications.sendPushToUsers(
            session,
            userIds: await NitChatsConfig.pushNotificationConfig!
                .filterMessagePermission(
              session,
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
            // includeBadgeCount: true,
          );
        }
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
