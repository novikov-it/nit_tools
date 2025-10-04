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
import '/src/extra_classes/object_wrapper.dart' as _i2;
import '../protocol.dart' as _i3;

abstract class NitChatParticipant
    implements _i1.TableRow, _i1.ProtocolSerialization {
  NitChatParticipant._({
    this.id,
    required this.userId,
    this.userProfileWrapper,
    required this.chatChannelId,
    this.chatChannel,
    this.lastMessageId,
    this.lastMessage,
    this.lastMessageSentAt,
    int? unreadCount,
    this.lastReadMessageId,
    this.lastReadMessage,
    bool? isDeleted,
  })  : unreadCount = unreadCount ?? 0,
        isDeleted = isDeleted ?? false;

  factory NitChatParticipant({
    int? id,
    required int userId,
    _i2.ObjectWrapper? userProfileWrapper,
    required int chatChannelId,
    _i3.NitChatChannel? chatChannel,
    int? lastMessageId,
    _i3.NitChatMessage? lastMessage,
    DateTime? lastMessageSentAt,
    int? unreadCount,
    int? lastReadMessageId,
    _i3.NitChatMessage? lastReadMessage,
    bool? isDeleted,
  }) = _NitChatParticipantImpl;

  factory NitChatParticipant.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitChatParticipant(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      userProfileWrapper: jsonSerialization['userProfileWrapper'] == null
          ? null
          : _i2.ObjectWrapper.fromJson(jsonSerialization['userProfileWrapper']),
      chatChannelId: jsonSerialization['chatChannelId'] as int,
      chatChannel: jsonSerialization['chatChannel'] == null
          ? null
          : _i3.NitChatChannel.fromJson(
              (jsonSerialization['chatChannel'] as Map<String, dynamic>)),
      lastMessageId: jsonSerialization['lastMessageId'] as int?,
      lastMessage: jsonSerialization['lastMessage'] == null
          ? null
          : _i3.NitChatMessage.fromJson(
              (jsonSerialization['lastMessage'] as Map<String, dynamic>)),
      lastMessageSentAt: jsonSerialization['lastMessageSentAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastMessageSentAt']),
      unreadCount: jsonSerialization['unreadCount'] as int,
      lastReadMessageId: jsonSerialization['lastReadMessageId'] as int?,
      lastReadMessage: jsonSerialization['lastReadMessage'] == null
          ? null
          : _i3.NitChatMessage.fromJson(
              (jsonSerialization['lastReadMessage'] as Map<String, dynamic>)),
      isDeleted: jsonSerialization['isDeleted'] as bool,
    );
  }

  static final t = NitChatParticipantTable();

  static const db = NitChatParticipantRepository._();

  @override
  int? id;

  int userId;

  _i2.ObjectWrapper? userProfileWrapper;

  int chatChannelId;

  _i3.NitChatChannel? chatChannel;

  int? lastMessageId;

  _i3.NitChatMessage? lastMessage;

  DateTime? lastMessageSentAt;

  int unreadCount;

  int? lastReadMessageId;

  _i3.NitChatMessage? lastReadMessage;

  bool isDeleted;

  @override
  _i1.Table get table => t;

  NitChatParticipant copyWith({
    int? id,
    int? userId,
    _i2.ObjectWrapper? userProfileWrapper,
    int? chatChannelId,
    _i3.NitChatChannel? chatChannel,
    int? lastMessageId,
    _i3.NitChatMessage? lastMessage,
    DateTime? lastMessageSentAt,
    int? unreadCount,
    int? lastReadMessageId,
    _i3.NitChatMessage? lastReadMessage,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (userProfileWrapper != null)
        'userProfileWrapper': userProfileWrapper?.toJson(),
      'chatChannelId': chatChannelId,
      if (chatChannel != null) 'chatChannel': chatChannel?.toJson(),
      if (lastMessageId != null) 'lastMessageId': lastMessageId,
      if (lastMessage != null) 'lastMessage': lastMessage?.toJson(),
      if (lastMessageSentAt != null)
        'lastMessageSentAt': lastMessageSentAt?.toJson(),
      'unreadCount': unreadCount,
      if (lastReadMessageId != null) 'lastReadMessageId': lastReadMessageId,
      if (lastReadMessage != null) 'lastReadMessage': lastReadMessage?.toJson(),
      'isDeleted': isDeleted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (userProfileWrapper != null)
        'userProfileWrapper': userProfileWrapper?.toJsonForProtocol(),
      'chatChannelId': chatChannelId,
      if (chatChannel != null) 'chatChannel': chatChannel?.toJsonForProtocol(),
      if (lastMessageId != null) 'lastMessageId': lastMessageId,
      if (lastMessage != null) 'lastMessage': lastMessage?.toJsonForProtocol(),
      if (lastMessageSentAt != null)
        'lastMessageSentAt': lastMessageSentAt?.toJson(),
      'unreadCount': unreadCount,
      if (lastReadMessageId != null) 'lastReadMessageId': lastReadMessageId,
      if (lastReadMessage != null)
        'lastReadMessage': lastReadMessage?.toJsonForProtocol(),
      'isDeleted': isDeleted,
    };
  }

  static NitChatParticipantInclude include({
    _i3.NitChatChannelInclude? chatChannel,
    _i3.NitChatMessageInclude? lastMessage,
    _i3.NitChatMessageInclude? lastReadMessage,
  }) {
    return NitChatParticipantInclude._(
      chatChannel: chatChannel,
      lastMessage: lastMessage,
      lastReadMessage: lastReadMessage,
    );
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
    required int userId,
    _i2.ObjectWrapper? userProfileWrapper,
    required int chatChannelId,
    _i3.NitChatChannel? chatChannel,
    int? lastMessageId,
    _i3.NitChatMessage? lastMessage,
    DateTime? lastMessageSentAt,
    int? unreadCount,
    int? lastReadMessageId,
    _i3.NitChatMessage? lastReadMessage,
    bool? isDeleted,
  }) : super._(
          id: id,
          userId: userId,
          userProfileWrapper: userProfileWrapper,
          chatChannelId: chatChannelId,
          chatChannel: chatChannel,
          lastMessageId: lastMessageId,
          lastMessage: lastMessage,
          lastMessageSentAt: lastMessageSentAt,
          unreadCount: unreadCount,
          lastReadMessageId: lastReadMessageId,
          lastReadMessage: lastReadMessage,
          isDeleted: isDeleted,
        );

  @override
  NitChatParticipant copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? userProfileWrapper = _Undefined,
    int? chatChannelId,
    Object? chatChannel = _Undefined,
    Object? lastMessageId = _Undefined,
    Object? lastMessage = _Undefined,
    Object? lastMessageSentAt = _Undefined,
    int? unreadCount,
    Object? lastReadMessageId = _Undefined,
    Object? lastReadMessage = _Undefined,
    bool? isDeleted,
  }) {
    return NitChatParticipant(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      userProfileWrapper: userProfileWrapper is _i2.ObjectWrapper?
          ? userProfileWrapper
          : this.userProfileWrapper?.copyWith(),
      chatChannelId: chatChannelId ?? this.chatChannelId,
      chatChannel: chatChannel is _i3.NitChatChannel?
          ? chatChannel
          : this.chatChannel?.copyWith(),
      lastMessageId: lastMessageId is int? ? lastMessageId : this.lastMessageId,
      lastMessage: lastMessage is _i3.NitChatMessage?
          ? lastMessage
          : this.lastMessage?.copyWith(),
      lastMessageSentAt: lastMessageSentAt is DateTime?
          ? lastMessageSentAt
          : this.lastMessageSentAt,
      unreadCount: unreadCount ?? this.unreadCount,
      lastReadMessageId: lastReadMessageId is int?
          ? lastReadMessageId
          : this.lastReadMessageId,
      lastReadMessage: lastReadMessage is _i3.NitChatMessage?
          ? lastReadMessage
          : this.lastReadMessage?.copyWith(),
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}

class NitChatParticipantTable extends _i1.Table {
  NitChatParticipantTable({super.tableRelation})
      : super(tableName: 'nit_chat_participant') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    chatChannelId = _i1.ColumnInt(
      'chatChannelId',
      this,
    );
    lastMessageId = _i1.ColumnInt(
      'lastMessageId',
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
    lastReadMessageId = _i1.ColumnInt(
      'lastReadMessageId',
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

  _i3.NitChatChannelTable? _chatChannel;

  late final _i1.ColumnInt lastMessageId;

  _i3.NitChatMessageTable? _lastMessage;

  late final _i1.ColumnDateTime lastMessageSentAt;

  late final _i1.ColumnInt unreadCount;

  late final _i1.ColumnInt lastReadMessageId;

  _i3.NitChatMessageTable? _lastReadMessage;

  late final _i1.ColumnBool isDeleted;

  _i3.NitChatChannelTable get chatChannel {
    if (_chatChannel != null) return _chatChannel!;
    _chatChannel = _i1.createRelationTable(
      relationFieldName: 'chatChannel',
      field: NitChatParticipant.t.chatChannelId,
      foreignField: _i3.NitChatChannel.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.NitChatChannelTable(tableRelation: foreignTableRelation),
    );
    return _chatChannel!;
  }

  _i3.NitChatMessageTable get lastMessage {
    if (_lastMessage != null) return _lastMessage!;
    _lastMessage = _i1.createRelationTable(
      relationFieldName: 'lastMessage',
      field: NitChatParticipant.t.lastMessageId,
      foreignField: _i3.NitChatMessage.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.NitChatMessageTable(tableRelation: foreignTableRelation),
    );
    return _lastMessage!;
  }

  _i3.NitChatMessageTable get lastReadMessage {
    if (_lastReadMessage != null) return _lastReadMessage!;
    _lastReadMessage = _i1.createRelationTable(
      relationFieldName: 'lastReadMessage',
      field: NitChatParticipant.t.lastReadMessageId,
      foreignField: _i3.NitChatMessage.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.NitChatMessageTable(tableRelation: foreignTableRelation),
    );
    return _lastReadMessage!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        chatChannelId,
        lastMessageId,
        lastMessageSentAt,
        unreadCount,
        lastReadMessageId,
        isDeleted,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'chatChannel') {
      return chatChannel;
    }
    if (relationField == 'lastMessage') {
      return lastMessage;
    }
    if (relationField == 'lastReadMessage') {
      return lastReadMessage;
    }
    return null;
  }
}

class NitChatParticipantInclude extends _i1.IncludeObject {
  NitChatParticipantInclude._({
    _i3.NitChatChannelInclude? chatChannel,
    _i3.NitChatMessageInclude? lastMessage,
    _i3.NitChatMessageInclude? lastReadMessage,
  }) {
    _chatChannel = chatChannel;
    _lastMessage = lastMessage;
    _lastReadMessage = lastReadMessage;
  }

  _i3.NitChatChannelInclude? _chatChannel;

  _i3.NitChatMessageInclude? _lastMessage;

  _i3.NitChatMessageInclude? _lastReadMessage;

  @override
  Map<String, _i1.Include?> get includes => {
        'chatChannel': _chatChannel,
        'lastMessage': _lastMessage,
        'lastReadMessage': _lastReadMessage,
      };

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

  final attachRow = const NitChatParticipantAttachRowRepository._();

  final detachRow = const NitChatParticipantDetachRowRepository._();

  Future<List<NitChatParticipant>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitChatParticipantTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitChatParticipantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitChatParticipantTable>? orderByList,
    _i1.Transaction? transaction,
    NitChatParticipantInclude? include,
  }) async {
    return session.db.find<NitChatParticipant>(
      where: where?.call(NitChatParticipant.t),
      orderBy: orderBy?.call(NitChatParticipant.t),
      orderByList: orderByList?.call(NitChatParticipant.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
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
    NitChatParticipantInclude? include,
  }) async {
    return session.db.findFirstRow<NitChatParticipant>(
      where: where?.call(NitChatParticipant.t),
      orderBy: orderBy?.call(NitChatParticipant.t),
      orderByList: orderByList?.call(NitChatParticipant.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<NitChatParticipant?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    NitChatParticipantInclude? include,
  }) async {
    return session.db.findById<NitChatParticipant>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
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

class NitChatParticipantAttachRowRepository {
  const NitChatParticipantAttachRowRepository._();

  Future<void> chatChannel(
    _i1.Session session,
    NitChatParticipant nitChatParticipant,
    _i3.NitChatChannel chatChannel, {
    _i1.Transaction? transaction,
  }) async {
    if (nitChatParticipant.id == null) {
      throw ArgumentError.notNull('nitChatParticipant.id');
    }
    if (chatChannel.id == null) {
      throw ArgumentError.notNull('chatChannel.id');
    }

    var $nitChatParticipant =
        nitChatParticipant.copyWith(chatChannelId: chatChannel.id);
    await session.db.updateRow<NitChatParticipant>(
      $nitChatParticipant,
      columns: [NitChatParticipant.t.chatChannelId],
      transaction: transaction ?? session.transaction,
    );
  }

  Future<void> lastMessage(
    _i1.Session session,
    NitChatParticipant nitChatParticipant,
    _i3.NitChatMessage lastMessage, {
    _i1.Transaction? transaction,
  }) async {
    if (nitChatParticipant.id == null) {
      throw ArgumentError.notNull('nitChatParticipant.id');
    }
    if (lastMessage.id == null) {
      throw ArgumentError.notNull('lastMessage.id');
    }

    var $nitChatParticipant =
        nitChatParticipant.copyWith(lastMessageId: lastMessage.id);
    await session.db.updateRow<NitChatParticipant>(
      $nitChatParticipant,
      columns: [NitChatParticipant.t.lastMessageId],
      transaction: transaction ?? session.transaction,
    );
  }

  Future<void> lastReadMessage(
    _i1.Session session,
    NitChatParticipant nitChatParticipant,
    _i3.NitChatMessage lastReadMessage, {
    _i1.Transaction? transaction,
  }) async {
    if (nitChatParticipant.id == null) {
      throw ArgumentError.notNull('nitChatParticipant.id');
    }
    if (lastReadMessage.id == null) {
      throw ArgumentError.notNull('lastReadMessage.id');
    }

    var $nitChatParticipant =
        nitChatParticipant.copyWith(lastReadMessageId: lastReadMessage.id);
    await session.db.updateRow<NitChatParticipant>(
      $nitChatParticipant,
      columns: [NitChatParticipant.t.lastReadMessageId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class NitChatParticipantDetachRowRepository {
  const NitChatParticipantDetachRowRepository._();

  Future<void> lastMessage(
    _i1.Session session,
    NitChatParticipant nitchatparticipant, {
    _i1.Transaction? transaction,
  }) async {
    if (nitchatparticipant.id == null) {
      throw ArgumentError.notNull('nitchatparticipant.id');
    }

    var $nitchatparticipant = nitchatparticipant.copyWith(lastMessageId: null);
    await session.db.updateRow<NitChatParticipant>(
      $nitchatparticipant,
      columns: [NitChatParticipant.t.lastMessageId],
      transaction: transaction ?? session.transaction,
    );
  }

  Future<void> lastReadMessage(
    _i1.Session session,
    NitChatParticipant nitchatparticipant, {
    _i1.Transaction? transaction,
  }) async {
    if (nitchatparticipant.id == null) {
      throw ArgumentError.notNull('nitchatparticipant.id');
    }

    var $nitchatparticipant =
        nitchatparticipant.copyWith(lastReadMessageId: null);
    await session.db.updateRow<NitChatParticipant>(
      $nitchatparticipant,
      columns: [NitChatParticipant.t.lastReadMessageId],
      transaction: transaction ?? session.transaction,
    );
  }
}
