/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'app_notification.dart' as _i2;
import 'fcm_token.dart' as _i3;
import 'package:nit_tools_client/src/extra_classes/nit_backend_filter.dart'
    as _i4;
import 'package:nit_tools_client/src/extra_classes/object_wrapper.dart' as _i5;
import '/src/extra_classes/object_wrapper.dart' as _i6;
import '/src/extra_classes/api_response.dart' as _i7;
import '/src/extra_classes/nit_backend_filter.dart' as _i8;
export 'app_notification.dart';
export 'fcm_token.dart';
export 'client.dart';

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
    if (data is Map<String, dynamic>) {
      final manualDeserialization =
          _i7.ApiResponse.manualDeserialization<T>(data);
      if (manualDeserialization != null) return manualDeserialization;
    }
    if (t == _i2.AppNotification) {
      return _i2.AppNotification.fromJson(data) as T;
    }
    if (t == _i3.FcmToken) {
      return _i3.FcmToken.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AppNotification?>()) {
      return (data != null ? _i2.AppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.FcmToken?>()) {
      return (data != null ? _i3.FcmToken.fromJson(data) : null) as T;
    }
    if (t == List<_i4.NitBackendFilter>) {
      return (data as List)
          .map((e) => deserialize<_i4.NitBackendFilter>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<List<_i4.NitBackendFilter>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i4.NitBackendFilter>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i5.ObjectWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i5.ObjectWrapper>(e))
          .toList() as dynamic;
    }
    if (t == _i6.ObjectWrapper) {
      return _i6.ObjectWrapper.fromJson(data) as T;
    }
    if (t == _i7.ApiResponse) {
      return _i7.ApiResponse.fromJson(data) as T;
    }
    if (t == _i8.NitBackendFilter) {
      return _i8.NitBackendFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i6.ObjectWrapper?>()) {
      return (data != null ? _i6.ObjectWrapper.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ApiResponse?>()) {
      return (data != null ? _i7.ApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.NitBackendFilter?>()) {
      return (data != null ? _i8.NitBackendFilter.fromJson(data) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i6.ObjectWrapper) {
      return 'ObjectWrapper';
    }
    if (data is _i7.ApiResponse) {
      return 'ApiResponse';
    }
    if (data is _i8.NitBackendFilter) {
      return 'NitBackendFilter';
    }
    if (data is _i2.AppNotification) {
      return 'AppNotification';
    }
    if (data is _i3.FcmToken) {
      return 'FcmToken';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ObjectWrapper') {
      return deserialize<_i6.ObjectWrapper>(data['data']);
    }
    if (data['className'] == 'ApiResponse') {
      return deserialize<_i7.ApiResponse>(data['data']);
    }
    if (data['className'] == 'NitBackendFilter') {
      return deserialize<_i8.NitBackendFilter>(data['data']);
    }
    if (data['className'] == 'AppNotification') {
      return deserialize<_i2.AppNotification>(data['data']);
    }
    if (data['className'] == 'FcmToken') {
      return deserialize<_i3.FcmToken>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
