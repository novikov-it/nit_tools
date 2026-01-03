import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nit_tools_client/nit_tools_client.dart';

import 'file_upload_handler.dart';

extension NitAppRefExtension on Ref {
  Future<NitMedia> uploadXFileToServer({
    required XFile xFile,
    String? path,
    int? duration, // miliseconds
  }) async => await FileUploaderHandler.uploadXFileToServer(
    xFile: xFile,
    path: path,
    duration: duration,
  );
  Future<NitMedia> uploadBytesToServer({
    required Uint8List bytes,
    required String path,
    int? duration, // miliseconds
  }) async => await FileUploaderHandler.uploadBytesToServer(
    bytes: bytes,
    path: path,
    duration: duration,
  );
  Future<NitMedia?> pickAndUploadImage({
    ImageSource imageSource = ImageSource.gallery,
  }) async =>
      await FileUploaderHandler.pickAndUploadImage(imageSource: imageSource);
}
