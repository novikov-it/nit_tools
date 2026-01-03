import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_client/serverpod_client.dart';

import 'nit_socket_state.dart';

final channelSubscriptionProvider = Provider.family<void, String>((
  ref,
  channel,
) {
  final sub = ref.read(nitSocketStateProvider.notifier);
  final socketState = ref.watch(nitSocketStateProvider);

  if (socketState.websocketStatus == StreamingConnectionStatus.connected) {
    sub.subscribeToChannel(channel);
  }

  ref.onDispose(() {
    sub.unsubscribeFromChannel(channel);
  });
});
