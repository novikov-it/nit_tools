/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:nit_tools_server/src/extra_classes/nit_backend_filter.dart'
    as _i3;
import 'package:nit_tools_server/src/extra_classes/object_wrapper.dart' as _i4;
import '/src/extra_classes/object_wrapper.dart' as _i5;
import '/src/extra_classes/api_response.dart' as _i6;
import '/src/extra_classes/nit_backend_filter.dart' as _i7;

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == List<_i3.NitBackendFilter>) {
      return (data as List)
          .map((e) => deserialize<_i3.NitBackendFilter>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<List<_i3.NitBackendFilter>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i3.NitBackendFilter>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i4.ObjectWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i4.ObjectWrapper>(e))
          .toList() as dynamic;
    }
    if (t == _i5.ObjectWrapper) {
      return _i5.ObjectWrapper.fromJson(data) as T;
    }
    if (t == _i6.ApiResponse) {
      return _i6.ApiResponse.fromJson(data) as T;
    }
    if (t == _i7.NitBackendFilter) {
      return _i7.NitBackendFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.ObjectWrapper?>()) {
      return (data != null ? _i5.ObjectWrapper.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ApiResponse?>()) {
      return (data != null ? _i6.ApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.NitBackendFilter?>()) {
      return (data != null ? _i7.NitBackendFilter.fromJson(data) : null) as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i5.ObjectWrapper) {
      return 'ObjectWrapper';
    }
    if (data is _i6.ApiResponse) {
      return 'ApiResponse';
    }
    if (data is _i7.NitBackendFilter) {
      return 'NitBackendFilter';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ObjectWrapper') {
      return deserialize<_i5.ObjectWrapper>(data['data']);
    }
    if (data['className'] == 'ApiResponse') {
      return deserialize<_i6.ApiResponse>(data['data']);
    }
    if (data['className'] == 'NitBackendFilter') {
      return deserialize<_i7.NitBackendFilter>(data['data']);
    }
    if (data['className'].startsWith('serverpod.')) {
      data['className'] = data['className'].substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'nit_tools';
}
