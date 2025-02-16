import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class ChatEndpoint extends Endpoint {
  Future<ApiResponse<bool>> setFcmToken(
    Session session, {
    required String fcmToken,
  }) async {
    await FcmToken.db.deleteWhere(
      session,
      where: (t) => t.fcmToken.equals(fcmToken),
    );

    await session.authenticated.then(
      (auth) async => auth != null
          ? await session.db.insertRow(
              FcmToken(
                userId: auth.userId,
                fcmToken: fcmToken,
              ),
            )
          : {},
    );

    return ApiResponse(isOk: true, value: true);
  }
}
