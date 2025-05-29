import 'package:serverpod/serverpod.dart';

import '../endpoints/nit_chat_endpoint.dart';
import '../endpoints/nit_updates_endpoint.dart';

// enum UserIdMode {
//   userProfileId,
//   userInfoId;
// }

extension NitSessionExtension on Session {
  // static UserIdMode userIdMode = UserIdMode.userInfoId;

  static Future<int> Function(int userInfoId)? userIdCustomGetter;

  // Future<UserInfo?> get currentUser async => await authenticated.then(
  //       (auth) async => auth == null
  //           ? null
  //           : await UserInfo.db.findById(
  //               this,
  //               auth.userId,
  //             ),
  //     );

  Future<int?> get currentUserId async => await authenticated.then(
        (auth) async => auth?.userId == null
            ? null
            : userIdCustomGetter == null
                ? auth!.userId
                : await userIdCustomGetter!.call(auth!.userId),
      );

  Future<int> get requireUserId async => (await currentUserId)!;

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
