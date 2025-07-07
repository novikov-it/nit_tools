/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: invalid_use_of_visible_for_testing_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class NitChatMessage
    implements _i1.TableRow, _i1.ProtocolSerialization {
  NitChatMessage._({
    this.id,
    required this.userId,
    required this.chatChannelId,
    required this.sentAt,
    this.text,
    this.attachmentIds,
    this.customMessageType,
    this.replyMessageId,
    bool? isDeleted,
  }) : isDeleted = isDeleted ?? false;

  factory NitChatMessage({
    int? id,
    required int userId,
    required int chatChannelId,
    required DateTime sentAt,
    String? text,
    List<int>? attachmentIds,
    _i2.CustomMessageType? customMessageType,
    int? replyMessageId,
    bool? isDeleted,
  }) = _NitChatMessageImpl;

  factory NitChatMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitChatMessage(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      chatChannelId: jsonSerialization['chatChannelId'] as int,
      sentAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sentAt']),
      text: jsonSerialization['text'] as String?,
      attachmentIds: (jsonSerialization['attachmentIds'] as List?)
          ?.map((e) => e as int)
          .toList(),
      customMessageType: jsonSerialization['customMessageType'] == null
          ? null
          : _i2.CustomMessageType.fromJson(
              (jsonSerialization['customMessageType'] as Map<String, dynamic>)),
      replyMessageId: jsonSerialization['replyMessageId'] as int?,
      isDeleted: jsonSerialization['isDeleted'] as bool,
    );
  }

  static final t = NitChatMessageTable();

  static const db = NitChatMessageRepository._();

  @override
  int? id;

  int userId;

  int chatChannelId;

  DateTime sentAt;

  String? text;

  List<int>? attachmentIds;

  _i2.CustomMessageType? customMessageType;

  int? replyMessageId;

  bool isDeleted;

  @override
  _i1.Table get table => t;

  NitChatMessage copyWith({
    int? id,
    int? userId,
    int? chatChannelId,
    DateTime? sentAt,
    String? text,
    List<int>? attachmentIds,
    _i2.CustomMessageType? customMessageType,
    int? replyMessageId,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'chatChannelId': chatChannelId,
      'sentAt': sentAt.toJson(),
      if (text != null) 'text': text,
      if (attachmentIds != null) 'attachmentIds': attachmentIds?.toJson(),
      if (customMessageType != null)
        'customMessageType': customMessageType?.toJson(),
      if (replyMessageId != null) 'replyMessageId': replyMessageId,
      'isDeleted': isDeleted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'chatChannelId': chatChannelId,
      'sentAt': sentAt.toJson(),
      if (text != null) 'text': text,
      if (attachmentIds != null) 'attachmentIds': attachmentIds?.toJson(),
      if (customMessageType != null)
        'customMessageType': customMessageType?.toJsonForProtocol(),
      if (replyMessageId != null) 'replyMessageId': replyMessageId,
      'isDeleted': isDeleted,
    };
  }

  static NitChatMessageInclude include() {
    return NitChatMessageInclude._();
  }

  static NitChatMessageIncludeList includeList({
    _i1.WhereExpressionBuilder<NitChatMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitChatMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitChatMessageTable>? orderByList,
    NitChatMessageInclude? include,
  }) {
    return NitChatMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NitChatMessage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(NitChatMessage.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NitChatMessageImpl extends NitChatMessage {
  _NitChatMessageImpl({
    int? id,
    required int userId,
    required int chatChannelId,
    required DateTime sentAt,
    String? text,
    List<int>? attachmentIds,
    _i2.CustomMessageType? customMessageType,
    int? replyMessageId,
    bool? isDeleted,
  }) : super._(
          id: id,
          userId: userId,
          chatChannelId: chatChannelId,
          sentAt: sentAt,
          text: text,
          attachmentIds: attachmentIds,
          customMessageType: customMessageType,
          replyMessageId: replyMessageId,
          isDeleted: isDeleted,
        );

  @override
  NitChatMessage copyWith({
    Object? id = _Undefined,
    int? userId,
    int? chatChannelId,
    DateTime? sentAt,
    Object? text = _Undefined,
    Object? attachmentIds = _Undefined,
    Object? customMessageType = _Undefined,
    Object? replyMessageId = _Undefined,
    bool? isDeleted,
  }) {
    return NitChatMessage(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      chatChannelId: chatChannelId ?? this.chatChannelId,
      sentAt: sentAt ?? this.sentAt,
      text: text is String? ? text : this.text,
      attachmentIds: attachmentIds is List<int>?
          ? attachmentIds
          : this.attachmentIds?.map((e0) => e0).toList(),
      customMessageType: customMessageType is _i2.CustomMessageType?
          ? customMessageType
          : this.customMessageType?.copyWith(),
      replyMessageId:
          replyMessageId is int? ? replyMessageId : this.replyMessageId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}

class NitChatMessageTable extends _i1.Table {
  NitChatMessageTable({super.tableRelation})
      : super(tableName: 'nit_chat_message') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    chatChannelId = _i1.ColumnInt(
      'chatChannelId',
      this,
    );
    sentAt = _i1.ColumnDateTime(
      'sentAt',
      this,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
    attachmentIds = _i1.ColumnSerializable(
      'attachmentIds',
      this,
    );
    customMessageType = _i1.ColumnSerializable(
      'customMessageType',
      this,
    );
    replyMessageId = _i1.ColumnInt(
      'replyMessageId',
      this,
    );
    isDeleted = _i1.ColumnBool(
      'isDeleted',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnInt chatChannelId;

  late final _i1.ColumnDateTime sentAt;

  late final _i1.ColumnString text;

  late final _i1.ColumnSerializable attachmentIds;

  late final _i1.ColumnSerializable customMessageType;

  late final _i1.ColumnInt replyMessageId;

  late final _i1.ColumnBool isDeleted;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        chatChannelId,
        sentAt,
        text,
        attachmentIds,
        customMessageType,
        replyMessageId,
        isDeleted,
      ];
}

class NitChatMessageInclude extends _i1.IncludeObject {
  NitChatMessageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => NitChatMessage.t;
}

class NitChatMessageIncludeList extends _i1.IncludeList {
  NitChatMessageIncludeList._({
    _i1.WhereExpressionBuilder<NitChatMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(NitChatMessage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => NitChatMessage.t;
}

class NitChatMessageRepository {
  const NitChatMessageRepository._();

  Future<List<NitChatMessage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitChatMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitChatMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitChatMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<NitChatMessage>(
      where: where?.call(NitChatMessage.t),
      orderBy: orderBy?.call(NitChatMessage.t),
      orderByList: orderByList?.call(NitChatMessage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatMessage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitChatMessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<NitChatMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitChatMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<NitChatMessage>(
      where: where?.call(NitChatMessage.t),
      orderBy: orderBy?.call(NitChatMessage.t),
      orderByList: orderByList?.call(NitChatMessage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatMessage?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<NitChatMessage>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitChatMessage>> insert(
    _i1.Session session,
    List<NitChatMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<NitChatMessage>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatMessage> insertRow(
    _i1.Session session,
    NitChatMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<NitChatMessage>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitChatMessage>> update(
    _i1.Session session,
    List<NitChatMessage> rows, {
    _i1.ColumnSelections<NitChatMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<NitChatMessage>(
      rows,
      columns: columns?.call(NitChatMessage.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatMessage> updateRow(
    _i1.Session session,
    NitChatMessage row, {
    _i1.ColumnSelections<NitChatMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<NitChatMessage>(
      row,
      columns: columns?.call(NitChatMessage.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitChatMessage>> delete(
    _i1.Session session,
    List<NitChatMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<NitChatMessage>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatMessage> deleteRow(
    _i1.Session session,
    NitChatMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<NitChatMessage>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitChatMessage>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NitChatMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<NitChatMessage>(
      where: where(NitChatMessage.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitChatMessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<NitChatMessage>(
      where: where?.call(NitChatMessage.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}
