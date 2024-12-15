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
import 'package:nit_tools_client/src/extra_classes/nit_backend_filter.dart'
    as _i2;
import 'package:nit_tools_client/src/extra_classes/object_wrapper.dart' as _i3;
import '/src/extra_classes/object_wrapper.dart' as _i4;
import '/src/extra_classes/api_response.dart' as _i5;
import '/src/extra_classes/nit_backend_filter.dart' as _i6;
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
    // if (T.toString().startsWith(_i5.ApiResponse.)) {
    //   return _i5.ApiResponse.manualDeserialization<T>(data);
    // }
    if (data is Map<String, dynamic>) {
      final manualDeserialization =
          _i5.ApiResponse.manualDeserialization<T>(data);
      if (manualDeserialization != null) return manualDeserialization;
    }

    if (t == _i1.getType<List<int>>()) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i2.NitBackendFilter>) {
      return (data as List)
          .map((e) => deserialize<_i2.NitBackendFilter>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<List<_i2.NitBackendFilter>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i2.NitBackendFilter>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i3.ObjectWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i3.ObjectWrapper>(e))
          .toList() as dynamic;
    }
    if (t == _i4.ObjectWrapper) {
      return _i4.ObjectWrapper.fromJson(data) as T;
    }
    if (t == _i5.ApiResponse) {
      return _i5.ApiResponse.fromJson(data) as T;
    }
    if (t == _i6.NitBackendFilter) {
      return _i6.NitBackendFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.ObjectWrapper?>()) {
      return (data != null ? _i4.ObjectWrapper.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ApiResponse?>()) {
      return (data != null ? _i5.ApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.NitBackendFilter?>()) {
      return (data != null ? _i6.NitBackendFilter.fromJson(data) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.ObjectWrapper) {
      return 'ObjectWrapper';
    }
    if (data is _i5.ApiResponse) {
      return 'ApiResponse';
    }
    if (data is _i6.NitBackendFilter) {
      return 'NitBackendFilter';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ObjectWrapper') {
      return deserialize<_i4.ObjectWrapper>(data['data']);
    }
    if (data['className'] == 'ApiResponse') {
      return deserialize<_i5.ApiResponse>(data['data']);
    }
    if (data['className'] == 'NitBackendFilter') {
      return deserialize<_i6.NitBackendFilter>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
