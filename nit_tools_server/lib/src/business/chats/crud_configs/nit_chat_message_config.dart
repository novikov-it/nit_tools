import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

import 'nit_chat_participant_config.dart';

final nitChatMessageCrudConfig = CrudConfig<NitChatMessage>(
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
  deleteConfig: DwDeleteConfig(
    allowDelete: (session, model) async => session.isUser(model.userId),
  ),
  saveConfig: DwSaveConfig(
    allowSave: (session, saveContext) async =>
        session.isUser(saveContext.currentModel.userId),
    afterSaveTransaction: (session, saveContext) async {
      final chatParticipants = await NitChatParticipant.db.find(
        session,
        where: (t) =>
            t.chatChannelId.equals(saveContext.currentModel.chatChannelId),
        include: chatParticipantInclude,
      );

      List<NitChatParticipant> updatedParticipants = [];

      if (saveContext.isInsert) {
        updatedParticipants = await NitChatParticipant.db.update(
          session,
          [
            for (var p in chatParticipants)
              p.copyWith(
                lastMessage: saveContext.currentModel,
                lastMessageId: saveContext.currentModel.id,
                lastMessageSentAt: saveContext.currentModel.sentAt,
                unreadCount: saveContext.currentUserId == p.userId
                    ? p.unreadCount
                    : p.unreadCount + 1,
              ),
          ],
          transaction: saveContext.transaction,
        );
      } else {
        final isLastMessage = saveContext.currentModel.id ==
            chatParticipants.firstOrNull?.lastMessageId;

        if (!saveContext.currentModel.isDeleted) {
          if (isLastMessage) {
            updatedParticipants = await NitChatParticipant.db.update(
              session,
              [
                for (var p in chatParticipants)
                  p.copyWith(
                    lastMessage: saveContext.currentModel,
                    lastMessageId: saveContext.currentModel.id,
                    lastMessageSentAt: saveContext.currentModel.sentAt,
                  ),
              ],
              transaction: saveContext.transaction,
            );
          }
        } else {
          if (!isLastMessage) {
            updatedParticipants = await NitChatParticipant.db.update(
              session,
              [
                for (var p in chatParticipants)
                  p.copyWith(
                    unreadCount: p.unreadCount > 0
                        ? p.unreadCount - 1
                        : 0, //TODO: можно сделать лучше
                  ),
              ],
              transaction: saveContext.transaction,
            );
          } else {
            // Логика удаления: находим новое последнее НЕУДАЛЁННОЕ сообщение
            final newLastMessage = await NitChatMessage.db.findFirstRow(
              session,
              where: (t) =>
                  t.chatChannelId
                      .equals(saveContext.currentModel.chatChannelId) &
                  t.isDeleted.equals(false),
              orderDescending: true,
              orderBy: (t) => t.id,
            );

            // if (newLastMessage == null) {
            //   return;
            // }
            updatedParticipants = await NitChatParticipant.db.update(
              session,
              [
                for (var p in chatParticipants)
                  p.copyWith(
                    lastMessage: newLastMessage,
                    lastMessageId: newLastMessage?.id,
                    lastMessageSentAt: newLastMessage?.sentAt,
                    unreadCount: p.unreadCount > 0
                        ? p.unreadCount - 1
                        : 0, //TODO: можно сделать лучше
                  ),
              ],
              transaction: saveContext.transaction,
            );
          }
        }
      }

      saveContext.afterUpdates.addAll(
        ObjectWrapper.wrapMany(updatedParticipants),
      );
    },
    afterSaveSideEffects: (session, saveContext) async {
      await session.nitSendToChat(
        saveContext.currentModel.chatChannelId,
        saveContext.currentModel,
      );

      final otherParticipants = await NitChatParticipant.db.find(
        session,
        where: (t) =>
            t.chatChannelId.equals(saveContext.currentModel.chatChannelId) &
            t.userId.notEquals(saveContext.currentModel.userId),
        include: chatParticipantInclude,
      );

      for (var p in otherParticipants) {
        await session.nitSendToUser(
          p.userId,
          NitUpdatesTransport(
            updatedEntities: saveContext.afterUpdates,
          ),
        );
      }

      if (saveContext.isInsert) {
        if (NitChatsConfig.pushNotificationConfig != null) {
          await NitPushNotifications.sendPushToUsers(
            session,
            userIds: await NitChatsConfig.pushNotificationConfig!
                .filterMessagePermission(
              session,
              otherParticipants
                  .map((e) => e.userId)
                  // .where((e) => e != saveContext.currentModel.userId)
                  .toList(),
            ),
            title: await NitChatsConfig.pushNotificationConfig!.title(
                    session,
                    saveContext.currentModel.userId,
                    saveContext.currentModel.text) ??
                '${saveContext.currentModel.text}',
            body: await NitChatsConfig.pushNotificationConfig!.body(
                    session,
                    saveContext.currentModel.userId,
                    saveContext.currentModel.text) ??
                '',
            goToPath: NitChatsConfig.pushNotificationConfig!
                .goToPath(saveContext.currentModel.chatChannelId),
            pathQueryParams: NitChatsConfig.pushNotificationConfig!
                .pathQueryParams(saveContext.currentModel.chatChannelId),
            // includeBadgeCount: true,
          );
        }
      }
    },
  ),
  // post: PostConfig(
  //   // allowInsert: (session, model) async => session.isUser(model.userId),
  //   // allowUpdate: (session, model) async => session.isUser(model.userId),
  //   // allowDelete: (session, model) async => session.isUser(model.userId),
  //   afterUpdateSideEffects:
  //       (session, currentUserId, initialModel, updatedModel) async {
  //     final participants = await NitChatParticipant.db.find(
  //       session,
  //       where: (t) => t.chatChannelId.equals(updatedModel.chatChannelId),
  //     );

  //     if (!updatedModel.isDeleted) {
  //       // Логика редактирования (оставляем как есть, но унифицировали fetch participants)
  //       for (var p in participants) {
  //         final isLastMessage = p.lastMessageId == updatedModel.id;
  //         if (isLastMessage) {
  //           await session.nitSendToUser(
  //             p.userId,
  //             await NitChatParticipant.db.updateRow(
  //               session,
  //               p.copyWith(
  //                 lastMessage: isLastMessage ? updatedModel : p.lastMessage,
  //                 lastMessageId:
  //                     isLastMessage ? updatedModel.id : p.lastMessageId,
  //                 lastMessageSentAt:
  //                     isLastMessage ? updatedModel.sentAt : p.lastMessageSentAt,
  //               ),
  //             ),
  //           );
  //         }
  //       }
  //     } else {
  //       // Логика удаления: находим новое последнее НЕУДАЛЁННОЕ сообщение
  //       final newLastMessage = await NitChatMessage.db.findFirstRow(
  //         session,
  //         where: (t) =>
  //             t.chatChannelId.equals(updatedModel.chatChannelId) &
  //             t.isDeleted.equals(false),
  //         orderDescending: true,
  //         orderBy: (t) => t.id,
  //       );

  //       // if (newLastMessage == null) {
  //       //   return;
  //       // }

  //       for (var p in participants) {
  //         final isLastMessage = p.lastMessageId == updatedModel.id;
  //         if (isLastMessage) {
  //           await session.nitSendToUser(
  //             p.userId,
  //             await NitChatParticipant.db.updateRow(
  //               session,
  //               p.copyWith(
  //                 lastMessage: newLastMessage,
  //                 lastMessageId: newLastMessage?.id,
  //                 lastMessageSentAt: newLastMessage?.sentAt,
  //                 unreadCount: p.unreadCount > 0
  //                     ? p.unreadCount - 1
  //                     : 0, //TODO: можно сделать лучше
  //               ),
  //             ),
  //           );
  //         }
  //       }
  //     }

  //     return;
  //   },
  //   afterUpdate: (session, initialModel, updatedModel) async {
  //     await session.nitSendToChat(
  //       initialModel.chatChannelId,
  //       updatedModel,
  //     );
  //     return [];
  //   },

  //   // afterDelete: (session, deletedModel) async {
  //   //   final participants = await NitChatParticipant.db.find(
  //   //     session,
  //   //     where: (t) => t.chatChannelId.equals(deletedModel.chatChannelId),
  //   //   );
  //   //   final newLastMessage = await NitChatMessage.db.findFirstRow(
  //   //     session,
  //   //     where: (t) => t.chatChannelId.equals(deletedModel.chatChannelId),
  //   //     orderDescending: true,
  //   //   );
  //   //   if (newLastMessage == null) {
  //   //     // значит сообщений в чате больше нет
  //   //     return [];
  //   //   }
  //   //   // значит удаленное сообщение было последним
  //   //   if (deletedModel.id! > newLastMessage.id!) {
  //   //     for (var p in participants) {
  //   //       session.nitSendToUser(
  //   //         p.userId,
  //   //         await NitChatParticipant.db.updateRow(
  //   //           session,
  //   //           p.copyWith(
  //   //             lastMessage: newLastMessage.text,
  //   //             lastMessageId: newLastMessage.id,
  //   //             lastMessageSentAt: newLastMessage.sentAt,
  //   //           ),
  //   //         ),
  //   //       );
  //   //     }
  //   //   }

  //   //   return [];
  //   // },
  //   afterInsert: (session, model) async {
  //     await session.nitSendToChat(
  //       model.chatChannelId,
  //       model,
  //     );
  //     return [];
  //   },
  //   afterInsertSideEffects: (session, currentUserId, model) async {
  //     final participants = await NitChatParticipant.db.find(
  //       session,
  //       where: (t) => t.chatChannelId.equals(model.chatChannelId),
  //     );

  //     for (var p in participants) {
  //       await session.nitSendToUser(
  //         p.userId,
  //         await NitChatParticipant.db.updateRow(
  //           session,
  //           p.copyWith(
  //             lastMessage: model,
  //             lastMessageId: model.id,
  //             lastMessageSentAt: model.sentAt,
  //             unreadCount:
  //                 currentUserId == p.userId ? p.unreadCount : p.unreadCount + 1,
  //           ),
  //         ),
  //       );
  //     }

  //     if (NitChatsConfig.pushNotificationConfig != null) {
  //       await NitPushNotifications.sendPushToUsers(
  //         session,
  //         userIds: await NitChatsConfig.pushNotificationConfig!
  //             .filterMessagePermission(
  //           session,
  //           participants
  //               .map((e) => e.userId)
  //               .where((e) => e != model.userId)
  //               .toList(),
  //         ),
  //         title: await NitChatsConfig.pushNotificationConfig!
  //                 .title(session, model.userId, model.text) ??
  //             '${model.text}',
  //         body: await NitChatsConfig.pushNotificationConfig!
  //                 .body(session, model.userId, model.text) ??
  //             '',
  //         goToPath: NitChatsConfig.pushNotificationConfig!
  //             .goToPath(model.chatChannelId),
  //         pathQueryParams: NitChatsConfig.pushNotificationConfig!
  //             .pathQueryParams(model.chatChannelId),
  //         // includeBadgeCount: true,
  //       );
  //     }
  //   },
  // ),
);
