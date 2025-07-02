import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

extension ChatChannelExtension on Session {
  Future<NitChatParticipant?> joinChatChannel({
    required int chatChannelId,
    required int userId,
    // required bool sendUpdate,
  }) async {
    try {
      return await db.insertRow(
        NitChatParticipant(userId: userId, chatChannelId: chatChannelId),
      );
    } on DatabaseException catch (e) {
      log(
        'Failed to join chat $chatChannelId with user $userId',
        level: LogLevel.error,
        exception: e,
      );
      return null;
    }
  }

  Future<NitChatParticipant?> leaveChatChannel({
    required int chatChannelId,
  }) async {
    final userId = await currentUserId;
    if (userId == null) {
      return null;
    }
    try {
      return await db.deleteRow(
        NitChatParticipant(userId: userId, chatChannelId: chatChannelId),
      );
    } on DatabaseException catch (e) {
      log(
        'Failed to leave chat $chatChannelId with user $userId',
        level: LogLevel.error,
        exception: e,
      );
      return null;
    }
  }

  Future<NitChatChannel> createChatChannel({
    required String channel,
    bool withCurrentUser = true,
    List<int>? withOtherUserIds,
    // bool sendUpdatesToCurrentUser = false,
    // bool sendUpdatesToOtherUsers = true,
  }) async {
    final chatChannel = await db.insertRow(NitChatChannel(channel: channel));
    final userId = await currentUserId;

    if (withCurrentUser && userId != null) {
      await joinChatChannel(
        chatChannelId: chatChannel.id!,
        userId: userId,
      );
    }

    if (withOtherUserIds != null) {
      for (var id in withOtherUserIds) {
        await joinChatChannel(
          chatChannelId: chatChannel.id!,
          userId: id,
        );
      }
    }

    return chatChannel;

    // for (var id in [
    //   if (withCurrentUser && currentUserId != null) currentUserId,
    //   if (withOtherUserIds != null) ...withOtherUserIds,
    // ]) {}
  }
}
