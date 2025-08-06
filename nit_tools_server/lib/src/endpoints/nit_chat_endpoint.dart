import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class NitChatEndpoint extends Endpoint {
  static chatUpdatesChannel(int chatId) => 'chatUpdates$chatId';

  Stream<SerializableModel> updatesStream(
    Session session, {
    required int chatId,
  }) async* {
    final userId = await session.currentUserId;

    if (userId == null) {
      return;
    }

    final stream = session.messages.createStream<SerializableModel>(
      chatUpdatesChannel(chatId),
    );

    final messages = await NitChatMessage.db.find(
      session,
      where: (t) => t.chatChannelId.equals(chatId) & t.isDeleted.equals(false),
      orderByList: (t) => [
        Order(
          column: t.sentAt,
        ),
      ],
    );

    final participants = await NitChatParticipant.db
        .find(session, where: (t) => t.chatChannelId.equals(chatId));

    final participantIds = participants.map((e) => e.userId).toSet();

    final initMedias = await NitMedia.db.find(
      session,
      where: (t) => t.id.inSet(
        messages.expand((m) => (m.attachmentIds ?? <int>[])).toSet(),
      ),
    );

    yield NitChatInitialData(
        messages: messages,
        participantIds: participantIds.toList(),
        lastReadMessageId: participants
            .reduce(
              (a, b) => (a.lastReadMessageId ?? 0) > (b.lastReadMessageId ?? 0)
                  ? a
                  : b,
            )
            .lastReadMessageId, //TODO: для групповых чатов не будет работать эффект прочтения
        additionalEntities: [
          ...initMedias.map((e) => ObjectWrapper(object: e)),
          ...await NitChatsConfig.additionalEntitiesLoaderForInitialChatData(
                  session, participantIds)
              .then(
            (e) => e
                .map(
                  (e) => ObjectWrapper(object: e),
                )
                .toList(),
          ),
        ]);

    await for (var update in stream) {
      yield update;
      // yield update is TableRow ? ObjectWrapper.wrap(update)! : update;
    }

    // yield* session.messages.createStream<SerializableModel>(channel).map(
    //       (update) => update is TableRow ? ObjectWrapper.wrap(update)! : update,
    //     );
  }

  Future<void> readChatMessages(
    Session session,
    List<int> readMessageIds,
    int chatId,
  ) async {
    if (readMessageIds.isEmpty) {
      return;
    }

    final userId = await session.currentUserId;

    readMessageIds.sort();
    final maxMessageId = readMessageIds.last;

    await session.nitSendToChat(
      chatId,
      NitChatReadMessageEvent(messageId: maxMessageId, userId: userId!),
    );

    final participant = await NitChatParticipant.db.findFirstRow(session,
        where: (p0) =>
            p0.chatChannelId.equals(chatId) & p0.userId.equals(userId));

    if (participant == null) {
      return;
    }

    final currentLastRead = participant.lastReadMessageId ?? 0;
    final newReadIds =
        readMessageIds.where((id) => id > currentLastRead).toList();

    if (newReadIds.isEmpty) {
      return;
    }

    // Уменьшаем unreadCount на количество новых прочитанных сообщений. //TODO: возможно излишне и стоит ставить просто unreadCount = 0
    // if (participant.unreadCount > 0) {
    //   if (newReadIds.last == participant.lastMessageId) {
    //     participant.unreadCount = 0;
    //   } else {
    //     participant.unreadCount =
    //         max(0, participant.unreadCount - newReadIds.length);
    //   }
    // } else {
    //   participant.unreadCount = 0;
    // }
    participant.unreadCount = 0;

    participant.lastReadMessageId = newReadIds.last;

    await NitChatParticipant.db.updateRow(session, participant);
    await session.nitSendToUser(
      userId,
      participant,
    );
  }

  Future<void> typingToggle(
    Session session,
    int channelId,
    bool isTyping,
  ) async {
    await session.nitSendToChat(
      channelId,
      NitTypingMessageEvent(
        userId: (await session.currentUserId)!,
        isTyping: isTyping,
      ),
    );
  }

  // Future<void> sendCustomMessage(
  //   Session session,
  //   int chatId,
  //   CustomMessageType customMessageInfo,
  // ) async {
  //   session.nitSendToChat(chatId, update);
  // }
}
