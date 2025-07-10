import 'package:mime/mime.dart';
import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class NitUploadEndpoint extends Endpoint {
  Future<String?> getUploadDescription(
    Session session, {
    required String path,
  }) async {
    var storage = session.server.serverpod.storage['public'];
    if (storage == null) {
      throw CloudStorageException('Storage public is not registered');
    }
    return await storage.createDirectFileUploadDescription(
      session: session,
      path: path,
      maxFileSize: 50 * 1024 * 1024,
    );
  }

  Future<NitMedia?> verifyUpload(
    Session session, {
    required String path,
    int? duration,
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
          type: MediaType.values.firstWhere(
            (e) => e.name == lookupMimeType(path)?.split('/').first,
            orElse: () => MediaType.image,
          ),
          duration: duration,
        ),
      );
    }

    return null;
  }
}
