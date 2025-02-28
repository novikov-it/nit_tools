import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import '../endpoints/nit_chat_endpoint.dart';
import '../endpoints/nit_updates_endpoint.dart';

extension NitSessionExtension on Session {
  Future<UserInfo?> get currentUser async => await authenticated.then(
        (auth) async => auth == null
            ? null
            : await UserInfo.db.findById(
                this,
                auth.userId,
              ),
      );

  Future<int?> get currentUserId async => await authenticated.then(
        (auth) async => auth?.userId,
      );

  Future<UserInfo?> get requireUser async => await authenticated.then(
        (auth) async => await UserInfo.db.findById(
          this,
          auth!.userId,
        ),
      );

  Future<int> get requireUserId async => await authenticated.then(
        (auth) async => auth!.userId,
      );

  Future<bool> isUser(int userId) async => userId == await currentUserId;

  nitSendToUser(int userId, SerializableModel update) {
    messages.postMessage(
      NitUpdatesEndpoint.userUpdatesChannel(userId),
      update,
    );
  }

  nitSendToChat(int chatId, SerializableModel update) {
    messages.postMessage(
      NitChatEndpoint.chatUpdatesChannel(chatId),
      update,
    );
  }
}
