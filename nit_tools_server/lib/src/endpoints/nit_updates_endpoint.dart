import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class NitUpdatesEndpoint extends Endpoint {
  // Stream<SerializableModel> updatesStream(
  //     Session session, Stream<SerializableModel> instream) async* {
  //   final userId = await session.authenticated.then((auth) => auth?.userId);

  //   if (userId == null) {
  //     return;
  //   }

  //   final t = instream.listen(
  //     (update) {
  //       print("received $update from $userId");
  //       // yield update is TableRow ? ObjectWrapper.wrap(update)! : update;
  //     },
  //     onError: (Object error, StackTrace stack) =>
  //         print('Instream $error\n$stack'),
  //     cancelOnError: true,
  //   );

  //   final channel = userUpdatesChannel(userId);

  //   final stream = session.messages.createStream<SerializableModel>(channel);

  //   // session.messages.addListener(channelName, listener)
  //   // final t2 = session.messages.createStream<SerializableModel>(channel).listen(
  //   //   (update) async* {
  //   //     print("sending $update to $userId");
  //   //     yield update is TableRow ? ObjectWrapper.wrap(update)! : update;
  //   //   },
  //   //   onError: (Object error, StackTrace stack) => print('$error\n$stack'),
  //   //   cancelOnError: true,
  //   // );

  //   await for (var update in stream) {
  //     print("sending $update to $userId");
  //     yield update is TableRow ? ObjectWrapper.wrap(update)! : update;
  //   }
  //   // .map(
  //   //       (update) => update is TableRow ? ObjectWrapper.wrap(update)! : update,
  //   //     );
  // }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    final userId = await session.authenticated.then((auth) => auth?.userId);

    if (userId == null) {
      return;
    }

    final channel = MessagingSessionExtension.userUpdatesChannel(userId);

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
