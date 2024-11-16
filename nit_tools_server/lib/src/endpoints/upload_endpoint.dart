import 'package:serverpod/serverpod.dart';

class UploadEndpoint extends Endpoint {
  Future<String?> getUploadDescription(
    Session session, {
    required String path,
  }) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  Future<String?> verifyUpload(
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
        uri?.toString(),
      );

      return uri?.toString();
    }

    return null;
  }
}
