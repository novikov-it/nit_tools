import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class ServicesEndpoint extends Endpoint {
  Future<ApiResponse<bool>> setFcmToken(
    Session session, {
    required String fcmToken,
  }) async {
    await NitFcmToken.db.deleteWhere(
      session,
      where: (t) => t.fcmToken.equals(fcmToken),
    );

    final userId = await session.currentUserId;

    if (userId != null) {
      await session.db.insertRow(
        NitFcmToken(
          userId: userId,
          fcmToken: fcmToken,
        ),
      );
    }

    return ApiResponse(isOk: true, value: true);
  }
}
