import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nit_tools_flutter/nit_tools_flutter.dart';

import '../state/attachment_state.dart';

class AddAttachmentButton extends ConsumerWidget {
  const AddAttachmentButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatTheme = ChatTheme.of(context);

    return IconButton(
      icon: Icon(Icons.attach_file, color: chatTheme.mainTheme.primaryColor),
      onPressed: () {
        ref.read(attachmentStateProvider.notifier).openMediaPicker(context);
      },
      splashColor: chatTheme.mainTheme.secondaryColor.withValues(alpha: 0.2),
      tooltip: 'Прикрепить файл',
    );
  }
}
