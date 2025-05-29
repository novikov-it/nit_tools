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
import 'chats/chat_channel.dart' as _i4;
import 'chats/chat_initial_data.dart' as _i5;
import 'chats/chat_message.dart' as _i6;
import 'chats/chat_participant.dart' as _i7;
import 'chats/chat_read_message_event.dart' as _i8;
import 'chats/chat_typing_message_event.dart' as _i9;
import 'chats/custom_message_type.dart' as _i10;
import 'media/nit_media.dart' as _i11;
import 'media/nit_media_type.dart' as _i12;
import 'nit_app_notification.dart' as _i13;
import 'nit_backend_filter_type.dart' as _i14;
import 'nit_fcm_token.dart' as _i15;
import 'nit_updates_transport.dart' as _i16;
import 'protocol.dart' as _i17;
import '/src/extra_classes/object_wrapper.dart' as _i18;
import 'package:nit_tools_server/src/extra_classes/object_wrapper.dart' as _i19;
import '/src/extra_classes/api_response.dart' as _i20;
import '/src/extra_classes/nit_backend_filter.dart' as _i21;
export 'chats/chat_channel.dart';
export 'chats/chat_initial_data.dart';
export 'chats/chat_message.dart';
export 'chats/chat_participant.dart';
export 'chats/chat_read_message_event.dart';
export 'chats/chat_typing_message_event.dart';
export 'chats/custom_message_type.dart';
export 'media/nit_media.dart';
export 'media/nit_media_type.dart';
export 'nit_app_notification.dart';
export 'nit_backend_filter_type.dart';
export 'nit_fcm_token.dart';
export 'nit_updates_transport.dart';

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
        _i2.ColumnDefinition(
          name: 'attachmentIds',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<int>?',
        ),
        _i2.ColumnDefinition(
          name: 'customMessageType',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'protocol:CustomMessageType?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'nit_chat_message_fk_0',
          columns: ['chatChannelId'],
          referenceTable: 'nit_chat_channel',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
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
        _i2.ColumnDefinition(
          name: 'lastReadMessageId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'nit_chat_participant_fk_0',
          columns: ['chatChannelId'],
          referenceTable: 'nit_chat_channel',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'nit_chat_participant_fk_1',
          columns: ['lastReadMessageId'],
          referenceTable: 'nit_chat_message',
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
    _i2.TableDefinition(
      name: 'nit_media',
      dartName: 'NitMedia',
      schema: 'public',
      module: 'nit_tools',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'nit_media_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:MediaType',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'publicUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'duration',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'nit_media_pkey',
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
    if (t == _i4.NitChatChannel) {
      return _i4.NitChatChannel.fromJson(data) as T;
    }
    if (t == _i5.NitChatInitialData) {
      return _i5.NitChatInitialData.fromJson(data) as T;
    }
    if (t == _i6.NitChatMessage) {
      return _i6.NitChatMessage.fromJson(data) as T;
    }
    if (t == _i7.NitChatParticipant) {
      return _i7.NitChatParticipant.fromJson(data) as T;
    }
    if (t == _i8.NitChatReadMessageEvent) {
      return _i8.NitChatReadMessageEvent.fromJson(data) as T;
    }
    if (t == _i9.NitTypingMessageEvent) {
      return _i9.NitTypingMessageEvent.fromJson(data) as T;
    }
    if (t == _i10.CustomMessageType) {
      return _i10.CustomMessageType.fromJson(data) as T;
    }
    if (t == _i11.NitMedia) {
      return _i11.NitMedia.fromJson(data) as T;
    }
    if (t == _i12.MediaType) {
      return _i12.MediaType.fromJson(data) as T;
    }
    if (t == _i13.NitAppNotification) {
      return _i13.NitAppNotification.fromJson(data) as T;
    }
    if (t == _i14.NitBackendFilterType) {
      return _i14.NitBackendFilterType.fromJson(data) as T;
    }
    if (t == _i15.NitFcmToken) {
      return _i15.NitFcmToken.fromJson(data) as T;
    }
    if (t == _i16.NitUpdatesTransport) {
      return _i16.NitUpdatesTransport.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.NitChatChannel?>()) {
      return (data != null ? _i4.NitChatChannel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.NitChatInitialData?>()) {
      return (data != null ? _i5.NitChatInitialData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.NitChatMessage?>()) {
      return (data != null ? _i6.NitChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.NitChatParticipant?>()) {
      return (data != null ? _i7.NitChatParticipant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.NitChatReadMessageEvent?>()) {
      return (data != null ? _i8.NitChatReadMessageEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.NitTypingMessageEvent?>()) {
      return (data != null ? _i9.NitTypingMessageEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.CustomMessageType?>()) {
      return (data != null ? _i10.CustomMessageType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.NitMedia?>()) {
      return (data != null ? _i11.NitMedia.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.MediaType?>()) {
      return (data != null ? _i12.MediaType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.NitAppNotification?>()) {
      return (data != null ? _i13.NitAppNotification.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.NitBackendFilterType?>()) {
      return (data != null ? _i14.NitBackendFilterType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i15.NitFcmToken?>()) {
      return (data != null ? _i15.NitFcmToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.NitUpdatesTransport?>()) {
      return (data != null ? _i16.NitUpdatesTransport.fromJson(data) : null)
          as T;
    }
    if (t == List<_i17.NitChatMessage>) {
      return (data as List)
          .map((e) => deserialize<_i17.NitChatMessage>(e))
          .toList() as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i18.ObjectWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i18.ObjectWrapper>(e))
          .toList() as dynamic;
    }
    if (t == _i18.ObjectWrapper) {
      return _i18.ObjectWrapper.fromJson(data) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i19.ObjectWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i19.ObjectWrapper>(e))
          .toList() as dynamic;
    }
    if (t == _i20.ApiResponse) {
      return _i20.ApiResponse.fromJson(data) as T;
    }
    if (t == _i21.NitBackendFilter) {
      return _i21.NitBackendFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i18.ObjectWrapper?>()) {
      return (data != null ? _i18.ObjectWrapper.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.ApiResponse?>()) {
      return (data != null ? _i20.ApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.NitBackendFilter?>()) {
      return (data != null ? _i21.NitBackendFilter.fromJson(data) : null) as T;
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
    if (data is _i18.ObjectWrapper) {
      return 'ObjectWrapper';
    }
    if (data is _i20.ApiResponse) {
      return 'ApiResponse';
    }
    if (data is _i21.NitBackendFilter) {
      return 'NitBackendFilter';
    }
    if (data is _i4.NitChatChannel) {
      return 'NitChatChannel';
    }
    if (data is _i5.NitChatInitialData) {
      return 'NitChatInitialData';
    }
    if (data is _i6.NitChatMessage) {
      return 'NitChatMessage';
    }
    if (data is _i7.NitChatParticipant) {
      return 'NitChatParticipant';
    }
    if (data is _i8.NitChatReadMessageEvent) {
      return 'NitChatReadMessageEvent';
    }
    if (data is _i9.NitTypingMessageEvent) {
      return 'NitTypingMessageEvent';
    }
    if (data is _i10.CustomMessageType) {
      return 'CustomMessageType';
    }
    if (data is _i11.NitMedia) {
      return 'NitMedia';
    }
    if (data is _i12.MediaType) {
      return 'MediaType';
    }
    if (data is _i13.NitAppNotification) {
      return 'NitAppNotification';
    }
    if (data is _i14.NitBackendFilterType) {
      return 'NitBackendFilterType';
    }
    if (data is _i15.NitFcmToken) {
      return 'NitFcmToken';
    }
    if (data is _i16.NitUpdatesTransport) {
      return 'NitUpdatesTransport';
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
      return deserialize<_i18.ObjectWrapper>(data['data']);
    }
    if (data['className'] == 'ApiResponse') {
      return deserialize<_i20.ApiResponse>(data['data']);
    }
    if (data['className'] == 'NitBackendFilter') {
      return deserialize<_i21.NitBackendFilter>(data['data']);
    }
    if (data['className'] == 'NitChatChannel') {
      return deserialize<_i4.NitChatChannel>(data['data']);
    }
    if (data['className'] == 'NitChatInitialData') {
      return deserialize<_i5.NitChatInitialData>(data['data']);
    }
    if (data['className'] == 'NitChatMessage') {
      return deserialize<_i6.NitChatMessage>(data['data']);
    }
    if (data['className'] == 'NitChatParticipant') {
      return deserialize<_i7.NitChatParticipant>(data['data']);
    }
    if (data['className'] == 'NitChatReadMessageEvent') {
      return deserialize<_i8.NitChatReadMessageEvent>(data['data']);
    }
    if (data['className'] == 'NitTypingMessageEvent') {
      return deserialize<_i9.NitTypingMessageEvent>(data['data']);
    }
    if (data['className'] == 'CustomMessageType') {
      return deserialize<_i10.CustomMessageType>(data['data']);
    }
    if (data['className'] == 'NitMedia') {
      return deserialize<_i11.NitMedia>(data['data']);
    }
    if (data['className'] == 'MediaType') {
      return deserialize<_i12.MediaType>(data['data']);
    }
    if (data['className'] == 'NitAppNotification') {
      return deserialize<_i13.NitAppNotification>(data['data']);
    }
    if (data['className'] == 'NitBackendFilterType') {
      return deserialize<_i14.NitBackendFilterType>(data['data']);
    }
    if (data['className'] == 'NitFcmToken') {
      return deserialize<_i15.NitFcmToken>(data['data']);
    }
    if (data['className'] == 'NitUpdatesTransport') {
      return deserialize<_i16.NitUpdatesTransport>(data['data']);
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
      case _i4.NitChatChannel:
        return _i4.NitChatChannel.t;
      case _i6.NitChatMessage:
        return _i6.NitChatMessage.t;
      case _i7.NitChatParticipant:
        return _i7.NitChatParticipant.t;
      case _i11.NitMedia:
        return _i11.NitMedia.t;
      case _i13.NitAppNotification:
        return _i13.NitAppNotification.t;
      case _i15.NitFcmToken:
        return _i15.NitFcmToken.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'nit_tools';
}
