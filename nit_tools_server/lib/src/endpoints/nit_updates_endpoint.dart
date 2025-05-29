import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class NitUpdatesEndpoint extends Endpoint {
  static userUpdatesChannel(int userId) => 'userUpdates$userId';

  @override
  Future<void> streamOpened(StreamingSession session) async {
    final userId = await session.currentUserId;

    if (userId == null) {
      return;
    }

    final channel = userUpdatesChannel(userId);

    setUserObject(
      session,
      channel,
    );

    session.log('Subscribing to channel $channel');

    session.messages.addListener(
      channel,
      (update) => _listener(session, update),
    );
  }

  _listener(StreamingSession session, SerializableModel update) {
    if (update is TableRow) {
      sendStreamMessage(session, ObjectWrapper.wrap(update)!);
    } else {
      sendStreamMessage(session, update);
    }
  }

  @override
  Future<void> streamClosed(StreamingSession session) async {
    session.messages.removeListener(
      getUserObject(session),
      (update) => _listener(session, update),
    );
  }
}
