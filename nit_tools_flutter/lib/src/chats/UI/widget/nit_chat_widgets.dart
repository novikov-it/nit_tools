import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nit_tools_client/nit_tools_client.dart';
import 'package:nit_tools_flutter/nit_tools_flutter.dart';

import '../../states/chat_ui_state/chat_ui_state.dart';
import 'attachment/attachment_list.dart';
import 'attachment/state/attachment_state.dart';
import 'attachment/widget/add_attchment_button.dart';
import 'attachment/widget/fullscreen_attachment_view.dart';
import 'message_bubbles/emoji/emoji_bubble.dart';
import 'message_bubbles/emoji/emoji_utils_extension.dart';
import 'message_bubbles/widgets/message_time.dart';
import 'message_bubbles/widgets/reply_indicator.dart';
import 'message_bubbles/widgets/voice_message/voice_message_bubble.dart';
import 'voice_messages/voice_message_widget.dart';

part 'attachment/widget/message_bubble_media_grid.dart';
part 'input/chat_input.dart';
part 'message_bubbles/group_message_bubble.dart';
part 'message_bubbles/personal_message_bubble.dart';
part 'message_bubbles/widgets/read_indicator.dart';
part 'scroll_bottom_button.dart';
part 'typing_indicator.dart';
