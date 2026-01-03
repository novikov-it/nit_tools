import 'package:dartway_flutter/dartway_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nit_tools_client/nit_tools_client.dart';
import 'package:nit_tools_flutter/nit_tools_flutter.dart';

import '../../../../states/chat_ui_state/chat_ui_state.dart';

class ReplyIndicator extends ConsumerWidget {
  final int repliedMessageId;
  final int chatId;

  const ReplyIndicator({
    super.key,
    required this.repliedMessageId,
    required this.chatId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ChatTheme.of(context);

    return ref
        .watchOrFetchModelAsync<NitChatMessage>(repliedMessageId)
        .dwBuildAsync(
          childBuilder:
              (message) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap:
                        () => ref
                            .read(chatUIStateProvider(chatId).notifier)
                            .scrollToMessage(repliedMessageId),
                    borderRadius: BorderRadius.circular(14.0),
                    splashColor: theme.mainTheme.primaryColor.withValues(
                      alpha: 0.08,
                    ),
                    highlightColor: theme.mainTheme.primaryColor.withValues(
                      alpha: 0.04,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.85),
                        borderRadius: BorderRadius.circular(14.0),
                        border: Border(
                          left: BorderSide(
                            color: theme.mainTheme.primaryColor,
                            width: 5.0,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 14.0,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.reply, size: 20.0, color: Colors.black),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Text(
                                //   'Ответ на сообщение',
                                //   style: TextStyle(
                                //     color: theme.mainTheme.primaryColor,
                                //     fontSize: 13.5,
                                //     fontWeight: FontWeight.w700,
                                //     letterSpacing: 0.1,
                                //   ),
                                // ),
                                // const SizedBox(height: 4.0),
                                Text(
                                  message.text?.trim().isNotEmpty == true
                                      ? message.text!
                                      : 'Медиафайл',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16.0,
                            color: Colors.black.withValues(alpha: 0.8),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        );
  }
}
