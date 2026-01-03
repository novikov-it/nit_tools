import 'package:cross_file/cross_file.dart';
import 'package:nit_tools_client/nit_tools_client.dart';
import 'package:nit_tools_flutter/nit_tools_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_message_state.g.dart';

@riverpod
class VoiceMessageState extends _$VoiceMessageState {
  @override
  NitMedia? build(int chatId) {
    return null;
  }

  Future<void> uploadVoiceMessage(XFile file, int duration) async {
    final nitMedia = await ref.uploadXFileToServer(
      xFile: file,
      duration: duration,
      path: 'chat/${ref.signedInUserId}',
    );
    await ref
        .read(chatStateProvider(chatId).notifier)
        .sendMessage('Голосовое сообщение', nitMedia);
  }
}
