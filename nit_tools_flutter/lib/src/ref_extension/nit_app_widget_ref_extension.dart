import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nit_tools_client/nit_tools_client.dart';
import 'package:nit_tools_flutter/nit_tools_flutter.dart';

import 'file_upload_handler.dart';

extension NitAppWidgetRefExtension on WidgetRef {
  // requireLogin({
  //   Function()? thenAction,
  // }) async {
  //   final userLoggedIn = read(nitSessionStateProvider).signedInUserId != null ||
  //       true ==
  //           await context.showBottomSheetOrDialog<bool>(
  //             NitDialogLayout(
  //               title: 'Войдите в приложение',
  //               child: PhoneAuthWidget(
  //                 onSuccess: context.pop,
  //                 extraParams:
  //                     NitAuthConfig.config.authExtraParamsProvider == null
  //                         ? null
  //                         : read(
  //                             NitAuthConfig.config.authExtraParamsProvider!,
  //                           ),
  //               ),
  //             ),
  //           );

  //   if (userLoggedIn && thenAction != null) thenAction();
  // }

  Future<NitMedia> uploadXFileToServer({required XFile xFile}) async =>
      await FileUploaderHandler.uploadXFileToServer(xFile: xFile);

  Future<NitMedia> uploadBytesToServer({
    required Uint8List bytes,
    required String path,
  }) async =>
      await FileUploaderHandler.uploadBytesToServer(bytes: bytes, path: path);

  Future<NitMedia?> pickAndUploadImage({
    ImageSource imageSource = ImageSource.gallery,
  }) async =>
      await FileUploaderHandler.pickAndUploadImage(imageSource: imageSource);
}
