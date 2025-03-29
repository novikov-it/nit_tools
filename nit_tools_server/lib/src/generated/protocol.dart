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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'app_notification.dart' as _i4;
import 'chats/chat_channel.dart' as _i5;
import 'chats/chat_initial_data.dart' as _i6;
import 'chats/chat_message.dart' as _i7;
import 'chats/chat_participant.dart' as _i8;
import 'fcm_token.dart' as _i9;
import '/src/extra_classes/object_wrapper.dart' as _i10;
import 'protocol.dart' as _i11;
import 'package:nit_tools_server/src/extra_classes/nit_backend_filter.dart'
    as _i12;
import 'package:nit_tools_server/src/extra_classes/object_wrapper.dart' as _i13;
import '/src/extra_classes/api_response.dart' as _i14;
import '/src/extra_classes/nit_backend_filter.dart' as _i15;
export 'app_notification.dart';
export 'chats/chat_channel.dart';
export 'chats/chat_initial_data.dart';
export 'chats/chat_message.dart';
export 'chats/chat_participant.dart';
export 'fcm_token.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'nit_app_notification',
      dartName: 'NitAppNotification',
      schema: 'public',
      module: 'nit_tools',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'nit_app_notification_id_seq\'::regclass)',
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
          indexName: 'nit_app_notification_pkey',
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
      name: 'nit_chat_channel',
      dartName: 'NitChatChannel',
      schema: 'public',
      module: 'nit_tools',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'nit_chat_channel_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'channel',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'nit_chat_channel_pkey',
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
        ),
        _i2.IndexDefinition(
          indexName: 'channel_name_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'channel',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'nit_chat_message',
      dartName: 'NitChatMessage',
      schema: 'public',
      module: 'nit_tools',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'nit_chat_message_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'chatChannelId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'sentAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'nit_chat_message_fk_0',
          columns: ['userId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'nit_chat_message_fk_1',
          columns: ['chatChannelId'],
          referenceTable: 'nit_chat_channel',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'nit_chat_message_pkey',
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
      name: 'nit_chat_participant',
      dartName: 'NitChatParticipant',
      schema: 'public',
      module: 'nit_tools',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'nit_chat_participant_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'chatChannelId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'lastMessage',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'lastMessageSentAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'unreadCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'nit_chat_participant_fk_0',
          columns: ['userId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'nit_chat_participant_fk_1',
          columns: ['chatChannelId'],
          referenceTable: 'nit_chat_channel',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'nit_chat_participant_pkey',
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
        ),
        _i2.IndexDefinition(
          indexName: 'chat_participants_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'chatChannelId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'nit_fcm_token',
      dartName: 'NitFcmToken',
      schema: 'public',
      module: 'nit_tools',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'nit_fcm_token_id_seq\'::regclass)',
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
          indexName: 'nit_fcm_token_pkey',
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
    ..._i3.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.NitAppNotification) {
      return _i4.NitAppNotification.fromJson(data) as T;
    }
    if (t == _i5.NitChatChannel) {
      return _i5.NitChatChannel.fromJson(data) as T;
    }
    if (t == _i6.NitChatInitialData) {
      return _i6.NitChatInitialData.fromJson(data) as T;
    }
    if (t == _i7.NitChatMessage) {
      return _i7.NitChatMessage.fromJson(data) as T;
    }
    if (t == _i8.NitChatParticipant) {
      return _i8.NitChatParticipant.fromJson(data) as T;
    }
    if (t == _i9.NitFcmToken) {
      return _i9.NitFcmToken.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.NitAppNotification?>()) {
      return (data != null ? _i4.NitAppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.NitChatChannel?>()) {
      return (data != null ? _i5.NitChatChannel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.NitChatInitialData?>()) {
      return (data != null ? _i6.NitChatInitialData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.NitChatMessage?>()) {
      return (data != null ? _i7.NitChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.NitChatParticipant?>()) {
      return (data != null ? _i8.NitChatParticipant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.NitFcmToken?>()) {
      return (data != null ? _i9.NitFcmToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i10.ObjectWrapper>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i10.ObjectWrapper>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i10.ObjectWrapper) {
      return _i10.ObjectWrapper.fromJson(data) as T;
    }
    if (t == List<_i11.NitChatMessage>) {
      return (data as List)
          .map((e) => deserialize<_i11.NitChatMessage>(e))
          .toList() as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i10.ObjectWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i10.ObjectWrapper>(e))
          .toList() as dynamic;
    }
    if (t == List<_i12.NitBackendFilter>) {
      return (data as List)
          .map((e) => deserialize<_i12.NitBackendFilter>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<List<_i12.NitBackendFilter>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i12.NitBackendFilter>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i13.ObjectWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i13.ObjectWrapper>(e))
          .toList() as dynamic;
    }
    if (t == _i14.ApiResponse) {
      return _i14.ApiResponse.fromJson(data) as T;
    }
    if (t == _i15.NitBackendFilter) {
      return _i15.NitBackendFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i10.ObjectWrapper?>()) {
      return (data != null ? _i10.ObjectWrapper.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.ApiResponse?>()) {
      return (data != null ? _i14.ApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.NitBackendFilter?>()) {
      return (data != null ? _i15.NitBackendFilter.fromJson(data) : null) as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i10.ObjectWrapper) {
      return 'ObjectWrapper';
    }
    if (data is _i14.ApiResponse) {
      return 'ApiResponse';
    }
    if (data is _i15.NitBackendFilter) {
      return 'NitBackendFilter';
    }
    if (data is _i4.NitAppNotification) {
      return 'NitAppNotification';
    }
    if (data is _i5.NitChatChannel) {
      return 'NitChatChannel';
    }
    if (data is _i6.NitChatInitialData) {
      return 'NitChatInitialData';
    }
    if (data is _i7.NitChatMessage) {
      return 'NitChatMessage';
    }
    if (data is _i8.NitChatParticipant) {
      return 'NitChatParticipant';
    }
    if (data is _i9.NitFcmToken) {
      return 'NitFcmToken';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ObjectWrapper') {
      return deserialize<_i10.ObjectWrapper>(data['data']);
    }
    if (data['className'] == 'ApiResponse') {
      return deserialize<_i14.ApiResponse>(data['data']);
    }
    if (data['className'] == 'NitBackendFilter') {
      return deserialize<_i15.NitBackendFilter>(data['data']);
    }
    if (data['className'] == 'NitAppNotification') {
      return deserialize<_i4.NitAppNotification>(data['data']);
    }
    if (data['className'] == 'NitChatChannel') {
      return deserialize<_i5.NitChatChannel>(data['data']);
    }
    if (data['className'] == 'NitChatInitialData') {
      return deserialize<_i6.NitChatInitialData>(data['data']);
    }
    if (data['className'] == 'NitChatMessage') {
      return deserialize<_i7.NitChatMessage>(data['data']);
    }
    if (data['className'] == 'NitChatParticipant') {
      return deserialize<_i8.NitChatParticipant>(data['data']);
    }
    if (data['className'] == 'NitFcmToken') {
      return deserialize<_i9.NitFcmToken>(data['data']);
    }
    if (data['className'].startsWith('serverpod.')) {
      data['className'] = data['className'].substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.NitAppNotification:
        return _i4.NitAppNotification.t;
      case _i5.NitChatChannel:
        return _i5.NitChatChannel.t;
      case _i7.NitChatMessage:
        return _i7.NitChatMessage.t;
      case _i8.NitChatParticipant:
        return _i8.NitChatParticipant.t;
      case _i9.NitFcmToken:
        return _i9.NitFcmToken.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'nit_tools';
}
