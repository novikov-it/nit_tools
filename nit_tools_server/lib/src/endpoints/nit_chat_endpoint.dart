import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class NitChatEndpoint extends Endpoint {
  static chatUpdatesChannel(int chatId) => 'chatUpdates$chatId';

  Stream<SerializableModel> updatesStream(
    Session session, {
    required int chatId,
  }) async* {
    final userId = await session.authenticated.then((auth) => auth?.userId);

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

    yield NitChatInitialData(
        messages: messages,
        participantIds: participantIds.toList(),
        additionalEntities:
            await NitChatsConfig.additionalEntitiesLoaderForInitialChatData(
                session, participantIds));

    await for (var update in stream) {
      yield update;
      // yield update is TableRow ? ObjectWrapper.wrap(update)! : update;
    }

    // yield* session.messages.createStream<SerializableModel>(channel).map(
    //       (update) => update is TableRow ? ObjectWrapper.wrap(update)! : update,
    //     );
  }
}
