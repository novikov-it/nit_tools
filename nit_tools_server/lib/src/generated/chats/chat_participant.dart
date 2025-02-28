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

abstract class NitChatParticipant
    implements _i1.TableRow, _i1.ProtocolSerialization {
  NitChatParticipant._({
    this.id,
    required this.userInfoId,
    required this.chatChannelId,
    this.lastMessage,
    this.lastMessageSentAt,
    int? unreadCount,
  }) : unreadCount = unreadCount ?? 0;

  factory NitChatParticipant({
    int? id,
    required int userInfoId,
    required int chatChannelId,
    String? lastMessage,
    DateTime? lastMessageSentAt,
    int? unreadCount,
  }) = _NitChatParticipantImpl;

  factory NitChatParticipant.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitChatParticipant(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      chatChannelId: jsonSerialization['chatChannelId'] as int,
      lastMessage: jsonSerialization['lastMessage'] as String?,
      lastMessageSentAt: jsonSerialization['lastMessageSentAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastMessageSentAt']),
      unreadCount: jsonSerialization['unreadCount'] as int,
    );
  }

  static final t = NitChatParticipantTable();

  static const db = NitChatParticipantRepository._();

  @override
  int? id;

  int userInfoId;

  int chatChannelId;

  String? lastMessage;

  DateTime? lastMessageSentAt;

  int unreadCount;

  @override
  _i1.Table get table => t;

  NitChatParticipant copyWith({
    int? id,
    int? userInfoId,
    int? chatChannelId,
    String? lastMessage,
    DateTime? lastMessageSentAt,
    int? unreadCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'chatChannelId': chatChannelId,
      if (lastMessage != null) 'lastMessage': lastMessage,
      if (lastMessageSentAt != null)
        'lastMessageSentAt': lastMessageSentAt?.toJson(),
      'unreadCount': unreadCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'chatChannelId': chatChannelId,
      if (lastMessage != null) 'lastMessage': lastMessage,
      if (lastMessageSentAt != null)
        'lastMessageSentAt': lastMessageSentAt?.toJson(),
      'unreadCount': unreadCount,
    };
  }

  static NitChatParticipantInclude include() {
    return NitChatParticipantInclude._();
  }

  static NitChatParticipantIncludeList includeList({
    _i1.WhereExpressionBuilder<NitChatParticipantTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitChatParticipantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitChatParticipantTable>? orderByList,
    NitChatParticipantInclude? include,
  }) {
    return NitChatParticipantIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NitChatParticipant.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(NitChatParticipant.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NitChatParticipantImpl extends NitChatParticipant {
  _NitChatParticipantImpl({
    int? id,
    required int userInfoId,
    required int chatChannelId,
    String? lastMessage,
    DateTime? lastMessageSentAt,
    int? unreadCount,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          chatChannelId: chatChannelId,
          lastMessage: lastMessage,
          lastMessageSentAt: lastMessageSentAt,
          unreadCount: unreadCount,
        );

  @override
  NitChatParticipant copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    int? chatChannelId,
    Object? lastMessage = _Undefined,
    Object? lastMessageSentAt = _Undefined,
    int? unreadCount,
  }) {
    return NitChatParticipant(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      chatChannelId: chatChannelId ?? this.chatChannelId,
      lastMessage: lastMessage is String? ? lastMessage : this.lastMessage,
      lastMessageSentAt: lastMessageSentAt is DateTime?
          ? lastMessageSentAt
          : this.lastMessageSentAt,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }
}

class NitChatParticipantTable extends _i1.Table {
  NitChatParticipantTable({super.tableRelation})
      : super(tableName: 'nit_chat_participant') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    chatChannelId = _i1.ColumnInt(
      'chatChannelId',
      this,
    );
    lastMessage = _i1.ColumnString(
      'lastMessage',
      this,
    );
    lastMessageSentAt = _i1.ColumnDateTime(
      'lastMessageSentAt',
      this,
    );
    unreadCount = _i1.ColumnInt(
      'unreadCount',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt userInfoId;

  late final _i1.ColumnInt chatChannelId;

  late final _i1.ColumnString lastMessage;

  late final _i1.ColumnDateTime lastMessageSentAt;

  late final _i1.ColumnInt unreadCount;

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        chatChannelId,
        lastMessage,
        lastMessageSentAt,
        unreadCount,
      ];
}

class NitChatParticipantInclude extends _i1.IncludeObject {
  NitChatParticipantInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => NitChatParticipant.t;
}

class NitChatParticipantIncludeList extends _i1.IncludeList {
  NitChatParticipantIncludeList._({
    _i1.WhereExpressionBuilder<NitChatParticipantTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(NitChatParticipant.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => NitChatParticipant.t;
}

class NitChatParticipantRepository {
  const NitChatParticipantRepository._();

  Future<List<NitChatParticipant>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitChatParticipantTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitChatParticipantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitChatParticipantTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<NitChatParticipant>(
      where: where?.call(NitChatParticipant.t),
      orderBy: orderBy?.call(NitChatParticipant.t),
      orderByList: orderByList?.call(NitChatParticipant.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatParticipant?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitChatParticipantTable>? where,
    int? offset,
    _i1.OrderByBuilder<NitChatParticipantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitChatParticipantTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<NitChatParticipant>(
      where: where?.call(NitChatParticipant.t),
      orderBy: orderBy?.call(NitChatParticipant.t),
      orderByList: orderByList?.call(NitChatParticipant.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatParticipant?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<NitChatParticipant>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitChatParticipant>> insert(
    _i1.Session session,
    List<NitChatParticipant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<NitChatParticipant>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatParticipant> insertRow(
    _i1.Session session,
    NitChatParticipant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<NitChatParticipant>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitChatParticipant>> update(
    _i1.Session session,
    List<NitChatParticipant> rows, {
    _i1.ColumnSelections<NitChatParticipantTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<NitChatParticipant>(
      rows,
      columns: columns?.call(NitChatParticipant.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatParticipant> updateRow(
    _i1.Session session,
    NitChatParticipant row, {
    _i1.ColumnSelections<NitChatParticipantTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<NitChatParticipant>(
      row,
      columns: columns?.call(NitChatParticipant.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitChatParticipant>> delete(
    _i1.Session session,
    List<NitChatParticipant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<NitChatParticipant>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatParticipant> deleteRow(
    _i1.Session session,
    NitChatParticipant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<NitChatParticipant>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitChatParticipant>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NitChatParticipantTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<NitChatParticipant>(
      where: where(NitChatParticipant.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitChatParticipantTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<NitChatParticipant>(
      where: where?.call(NitChatParticipant.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}
