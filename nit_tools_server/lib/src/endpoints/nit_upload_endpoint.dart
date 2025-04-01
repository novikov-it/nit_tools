import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class NitUploadEndpoint extends Endpoint {
  Future<String?> getUploadDescription(
    Session session, {
    required String path,
  }) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  Future<NitMedia?> verifyUpload(
    Session session, {
    required String path,
  }) async {
    if (await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    )) {
      final uri = await session.storage.getPublicUrl(
        storageId: 'public',
        path: path,
      );

      print(
        uri.toString(),
      );
      if (uri == null) return null;
      return await session.db.insertRow(
        NitMedia(
          createdAt: DateTime.now(),
          publicUrl: uri.toString(),
        ),
      );
    }

    return null;
  }
}
