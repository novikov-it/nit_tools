/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:nit_tools_client/src/extra_classes/nit_backend_filter.dart'
    as _i7;
import 'package:nit_tools_client/src/extra_classes/object_wrapper.dart' as _i8;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i12;
import 'package:serverpod_client/serverpod_client.dart' as _i1;

import '/src/extra_classes/api_response.dart' as _i10;
import '/src/extra_classes/nit_backend_filter.dart' as _i11;
import '/src/extra_classes/object_wrapper.dart' as _i9;
import 'app_notification.dart' as _i2;
import 'chats/chat_channel.dart' as _i3;
import 'chats/chat_message.dart' as _i4;
import 'chats/chat_participant.dart' as _i5;
import 'fcm_token.dart' as _i6;

export 'app_notification.dart';
export 'chats/chat_channel.dart';
export 'chats/chat_message.dart';
export 'chats/chat_participant.dart';
export 'client.dart';
export 'fcm_token.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }

    if (data is Map<String, dynamic>) {
      final manualDeserialization =
          _i10.ApiResponse.manualDeserialization<T>(data);
      if (manualDeserialization != null) return manualDeserialization;
    }
    if (t == _i2.NitAppNotification) {
      return _i2.NitAppNotification.fromJson(data) as T;
    }
    if (t == _i3.NitChatChannel) {
      return _i3.NitChatChannel.fromJson(data) as T;
    }
    if (t == _i4.NitChatMessage) {
      return _i4.NitChatMessage.fromJson(data) as T;
    }
    if (t == _i5.NitChatParticipant) {
      return _i5.NitChatParticipant.fromJson(data) as T;
    }
    if (t == _i6.FcmToken) {
      return _i6.FcmToken.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.NitAppNotification?>()) {
      return (data != null ? _i2.NitAppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.NitChatChannel?>()) {
      return (data != null ? _i3.NitChatChannel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.NitChatMessage?>()) {
      return (data != null ? _i4.NitChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.NitChatParticipant?>()) {
      return (data != null ? _i5.NitChatParticipant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.FcmToken?>()) {
      return (data != null ? _i6.FcmToken.fromJson(data) : null) as T;
    }
    if (t == List<_i7.NitBackendFilter>) {
      return (data as List)
          .map((e) => deserialize<_i7.NitBackendFilter>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<List<_i7.NitBackendFilter>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i7.NitBackendFilter>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i8.ObjectWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i8.ObjectWrapper>(e))
          .toList() as dynamic;
    }
    if (t == _i9.ObjectWrapper) {
      return _i9.ObjectWrapper.fromJson(data) as T;
    }
    if (t == _i10.ApiResponse) {
      return _i10.ApiResponse.fromJson(data) as T;
    }
    if (t == _i11.NitBackendFilter) {
      return _i11.NitBackendFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i9.ObjectWrapper?>()) {
      return (data != null ? _i9.ObjectWrapper.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ApiResponse?>()) {
      return (data != null ? _i10.ApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.NitBackendFilter?>()) {
      return (data != null ? _i11.NitBackendFilter.fromJson(data) : null) as T;
    }
    try {
      return _i12.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i9.ObjectWrapper) {
      return 'ObjectWrapper';
    }
    if (data is _i10.ApiResponse) {
      return 'ApiResponse';
    }
    if (data is _i11.NitBackendFilter) {
      return 'NitBackendFilter';
    }
    if (data is _i2.NitAppNotification) {
      return 'NitAppNotification';
    }
    if (data is _i3.NitChatChannel) {
      return 'NitChatChannel';
    }
    if (data is _i4.NitChatMessage) {
      return 'NitChatMessage';
    }
    if (data is _i5.NitChatParticipant) {
      return 'NitChatParticipant';
    }
    if (data is _i6.FcmToken) {
      return 'FcmToken';
    }
    className = _i12.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ObjectWrapper') {
      return deserialize<_i9.ObjectWrapper>(data['data']);
    }
    if (data['className'] == 'ApiResponse') {
      return deserialize<_i10.ApiResponse>(data['data']);
    }
    if (data['className'] == 'NitBackendFilter') {
      return deserialize<_i11.NitBackendFilter>(data['data']);
    }
    if (data['className'] == 'NitAppNotification') {
      return deserialize<_i2.NitAppNotification>(data['data']);
    }
    if (data['className'] == 'NitChatChannel') {
      return deserialize<_i3.NitChatChannel>(data['data']);
    }
    if (data['className'] == 'NitChatMessage') {
      return deserialize<_i4.NitChatMessage>(data['data']);
    }
    if (data['className'] == 'NitChatParticipant') {
      return deserialize<_i5.NitChatParticipant>(data['data']);
    }
    if (data['className'] == 'FcmToken') {
      return deserialize<_i6.FcmToken>(data['data']);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i12.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
