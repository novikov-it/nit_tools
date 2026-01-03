import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nit_tools_client/nit_tools_client.dart';
import 'package:nit_tools_flutter/nit_tools_flutter.dart';

import '../states/chat_ui_state/chat_ui_state.dart';
import 'widget/input/widget/edit_input_panel.dart';
import 'widget/input/widget/reply_input_panel.dart';

class NitChatView extends ConsumerWidget {
  final int chatId;
  final Map<String, Widget Function(NitChatMessage)>? customMessageBuilders;

  const NitChatView({
    super.key,
    required this.chatId,
    this.customMessageBuilders,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState =
        chatId == NitDefaultModelsRepository.mockModelId
            ? ChatViewState.loading
            : ref.watch(
              chatStateProvider(chatId).select((state) => state.viewState),
            );

    if (viewState == ChatViewState.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: ChatTheme.of(context).mainTheme.backgroundColor,
      body: Container(
        color: ChatTheme.of(context).inputTheme.backgroundColor,
        child: SafeArea(
          child: Container(
            color: ChatTheme.of(context).mainTheme.backgroundColor,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ChatMessagesList(
                        chatId: chatId,
                        customMessageBuilders: customMessageBuilders,
                      ),
                      // Should be consumer inside widgets?
                      if (ChatTheme.of(
                        context,
                      ).settings.showScrollToBottomButton)
                        Consumer(
                          builder: (
                            BuildContext context,
                            WidgetRef ref,
                            Widget? child,
                          ) {
                            return ref.watch(
                                  chatUIStateProvider(
                                    chatId,
                                  ).select((state) => state.showScrollToBottom),
                                )
                                ? Positioned(
                                  bottom: 16,
                                  right: 16,
                                  child: ScrollToBottomButton(chatId: chatId),
                                )
                                : const SizedBox.shrink();
                          },
                        ),
                    ],
                  ),
                ),
                Consumer(
                  builder: (
                    BuildContext context,
                    WidgetRef ref,
                    Widget? child,
                  ) {
                    return ref.watch(
                          chatStateProvider(
                            chatId,
                          ).select((state) => state.isTyping),
                        )
                        ? const TypingIndicator()
                        : const SizedBox.shrink();
                  },
                ),
                Column(
                  children: [
                    EditInputPanel(chatId: chatId),
                    ReplyInputPanel(chatId: chatId),
                    ChatInputWidget(chatId: chatId),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
