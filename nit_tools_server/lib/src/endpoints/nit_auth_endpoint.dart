import 'package:serverpod/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class NitAuthEndpoint extends Endpoint {
  Future<void> signOutUser(
    Session session, {
    required bool revokeAllTokens,
  }) async {
    final userId = (await session.authenticated)?.userId;
    if (userId == null) return;

    if (revokeAllTokens == true) {
      await session.db
          .deleteWhere<AuthKey>(where: AuthKey.t.userId.equals(userId));
      await session.messages
          .authenticationRevoked(userId, RevokedAuthenticationUser());
    } else {
      var keyId = int.tryParse(session.authenticationKey?.split(':')[0] ?? '');

      if (keyId == null) return;

      await session.db.deleteWhere<AuthKey>(
        where: AuthKey.t.id.equals(
          keyId,
        ),
      );

      await session.messages.authenticationRevoked(
        userId,
        RevokedAuthenticationAuthId(
          authId: session.authenticationKey!,
        ),
      );
    }
    session.updateAuthenticated(null);
  }
}
