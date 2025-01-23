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
import 'app_notification.dart' as _i3;
import 'fcm_token.dart' as _i4;
import 'package:nit_tools_server/src/extra_classes/nit_backend_filter.dart'
    as _i5;
import 'package:nit_tools_server/src/extra_classes/object_wrapper.dart' as _i6;
import '/src/extra_classes/object_wrapper.dart' as _i7;
import '/src/extra_classes/api_response.dart' as _i8;
import '/src/extra_classes/nit_backend_filter.dart' as _i9;
export 'app_notification.dart';
export 'fcm_token.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'app_notification',
      dartName: 'AppNotification',
      schema: 'public',
      module: 'nit_tools',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'app_notification_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'toUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'timestamp',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'body',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'goToPath',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isRead',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'app_notification_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'fcm_token',
      dartName: 'FcmToken',
      schema: 'public',
      module: 'nit_tools',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'fcm_token_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'fcmToken',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'fcm_token_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.AppNotification) {
      return _i3.AppNotification.fromJson(data) as T;
    }
    if (t == _i4.FcmToken) {
      return _i4.FcmToken.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.AppNotification?>()) {
      return (data != null ? _i3.AppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.FcmToken?>()) {
      return (data != null ? _i4.FcmToken.fromJson(data) : null) as T;
    }
    if (t == List<_i5.NitBackendFilter>) {
      return (data as List)
          .map((e) => deserialize<_i5.NitBackendFilter>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<List<_i5.NitBackendFilter>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i5.NitBackendFilter>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i6.ObjectWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i6.ObjectWrapper>(e))
          .toList() as dynamic;
    }
    if (t == _i7.ObjectWrapper) {
      return _i7.ObjectWrapper.fromJson(data) as T;
    }
    if (t == _i8.ApiResponse) {
      return _i8.ApiResponse.fromJson(data) as T;
    }
    if (t == _i9.NitBackendFilter) {
      return _i9.NitBackendFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i7.ObjectWrapper?>()) {
      return (data != null ? _i7.ObjectWrapper.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ApiResponse?>()) {
      return (data != null ? _i8.ApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.NitBackendFilter?>()) {
      return (data != null ? _i9.NitBackendFilter.fromJson(data) : null) as T;
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
    if (data is _i7.ObjectWrapper) {
      return 'ObjectWrapper';
    }
    if (data is _i8.ApiResponse) {
      return 'ApiResponse';
    }
    if (data is _i9.NitBackendFilter) {
      return 'NitBackendFilter';
    }
    if (data is _i3.AppNotification) {
      return 'AppNotification';
    }
    if (data is _i4.FcmToken) {
      return 'FcmToken';
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
      return deserialize<_i7.ObjectWrapper>(data['data']);
    }
    if (data['className'] == 'ApiResponse') {
      return deserialize<_i8.ApiResponse>(data['data']);
    }
    if (data['className'] == 'NitBackendFilter') {
      return deserialize<_i9.NitBackendFilter>(data['data']);
    }
    if (data['className'] == 'AppNotification') {
      return deserialize<_i3.AppNotification>(data['data']);
    }
    if (data['className'] == 'FcmToken') {
      return deserialize<_i4.FcmToken>(data['data']);
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
    switch (t) {
      case _i3.AppNotification:
        return _i3.AppNotification.t;
      case _i4.FcmToken:
        return _i4.FcmToken.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'nit_tools';
}
