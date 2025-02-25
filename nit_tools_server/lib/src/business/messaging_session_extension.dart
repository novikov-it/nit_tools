import 'package:serverpod/serverpod.dart';

extension MessagingSessionExtension on Session {
  static userUpdatesChannel(int userId) => 'userUpdates$userId';
  static chatUpdatesChannel(int chatId) => 'chatUpdates$chatId';

  nitSendToUser(int userId, SerializableModel update) {
    messages.postMessage(
      userUpdatesChannel(userId),
      update,
    );
  }

  nitSendToChat(int chatId, SerializableModel update) {
    messages.postMessage(
      chatUpdatesChannel(chatId),
      update,
    );
  }
}
