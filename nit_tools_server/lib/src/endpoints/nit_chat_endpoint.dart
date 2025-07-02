import 'package:collection/collection.dart';
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
      where: (t) => t.chatChannelId.equals(chatId),
      orderByList: (t) => [
        Order(
          column: t.sentAt,
        ),
      ],
    );

    final participants = await NitChatParticipant.db
        .find(session, where: (t) => t.chatChannelId.equals(chatId));

    final participantIds = participants.map((e) => e.userId).toSet();

    final currentParticipant = participants.firstWhereOrNull(
        (e) => e.userId != userId); //TODO: отследить для груповых чатов

    final initMedias = await NitMedia.db.find(
      session,
      where: (t) => t.id.inSet(
        messages.expand((m) => (m.attachmentIds ?? <int>[])).toSet(),
      ),
    );

    yield NitChatInitialData(
        messages: messages,
        participantIds: participantIds.toList(),
        lastReadMessageId: currentParticipant?.lastReadMessageId,
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

  Future<void> readChatMessage(
    Session session,
    int messageId,
    int chatId,
  ) async {
    final userId = await session.currentUserId;
    final participant = await NitChatParticipant.db.findFirstRow(session,
        where: (p0) =>
            p0.chatChannelId.equals(chatId) & p0.userId.equals(userId));
    if (participant == null ||
        messageId < (participant.lastReadMessageId ?? 0)) {
      return;
    }
    participant.lastReadMessageId = messageId;

    await NitChatParticipant.db.updateRow(session, participant);

    session.nitSendToChat(
      chatId,
      NitChatReadMessageEvent(messageId: messageId, userId: userId!),
    );
  }

  Future<void> typingToggle(
    Session session,
    int channelId,
    bool isTyping,
  ) async {
    session.nitSendToChat(
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
