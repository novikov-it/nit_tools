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

abstract class NitChatChannel
    implements _i1.TableRow, _i1.ProtocolSerialization {
  NitChatChannel._({
    this.id,
    required this.channel,
    this.chatParticipants,
  });

  factory NitChatChannel({
    int? id,
    required String channel,
    List<_i2.NitChatParticipant>? chatParticipants,
  }) = _NitChatChannelImpl;

  factory NitChatChannel.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitChatChannel(
      id: jsonSerialization['id'] as int?,
      channel: jsonSerialization['channel'] as String,
      chatParticipants: (jsonSerialization['chatParticipants'] as List?)
          ?.map((e) =>
              _i2.NitChatParticipant.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = NitChatChannelTable();

  static const db = NitChatChannelRepository._();

  @override
  int? id;

  String channel;

  List<_i2.NitChatParticipant>? chatParticipants;

  @override
  _i1.Table get table => t;

  NitChatChannel copyWith({
    int? id,
    String? channel,
    List<_i2.NitChatParticipant>? chatParticipants,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'channel': channel,
      if (chatParticipants != null)
        'chatParticipants':
            chatParticipants?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'channel': channel,
      if (chatParticipants != null)
        'chatParticipants':
            chatParticipants?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static NitChatChannelInclude include(
      {_i2.NitChatParticipantIncludeList? chatParticipants}) {
    return NitChatChannelInclude._(chatParticipants: chatParticipants);
  }

  static NitChatChannelIncludeList includeList({
    _i1.WhereExpressionBuilder<NitChatChannelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitChatChannelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitChatChannelTable>? orderByList,
    NitChatChannelInclude? include,
  }) {
    return NitChatChannelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NitChatChannel.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(NitChatChannel.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NitChatChannelImpl extends NitChatChannel {
  _NitChatChannelImpl({
    int? id,
    required String channel,
    List<_i2.NitChatParticipant>? chatParticipants,
  }) : super._(
          id: id,
          channel: channel,
          chatParticipants: chatParticipants,
        );

  @override
  NitChatChannel copyWith({
    Object? id = _Undefined,
    String? channel,
    Object? chatParticipants = _Undefined,
  }) {
    return NitChatChannel(
      id: id is int? ? id : this.id,
      channel: channel ?? this.channel,
      chatParticipants: chatParticipants is List<_i2.NitChatParticipant>?
          ? chatParticipants
          : this.chatParticipants?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class NitChatChannelTable extends _i1.Table {
  NitChatChannelTable({super.tableRelation})
      : super(tableName: 'nit_chat_channel') {
    channel = _i1.ColumnString(
      'channel',
      this,
    );
  }

  late final _i1.ColumnString channel;

  _i2.NitChatParticipantTable? ___chatParticipants;

  _i1.ManyRelation<_i2.NitChatParticipantTable>? _chatParticipants;

  _i2.NitChatParticipantTable get __chatParticipants {
    if (___chatParticipants != null) return ___chatParticipants!;
    ___chatParticipants = _i1.createRelationTable(
      relationFieldName: '__chatParticipants',
      field: NitChatChannel.t.id,
      foreignField: _i2.NitChatParticipant.t.chatChannelId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.NitChatParticipantTable(tableRelation: foreignTableRelation),
    );
    return ___chatParticipants!;
  }

  _i1.ManyRelation<_i2.NitChatParticipantTable> get chatParticipants {
    if (_chatParticipants != null) return _chatParticipants!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'chatParticipants',
      field: NitChatChannel.t.id,
      foreignField: _i2.NitChatParticipant.t.chatChannelId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.NitChatParticipantTable(tableRelation: foreignTableRelation),
    );
    _chatParticipants = _i1.ManyRelation<_i2.NitChatParticipantTable>(
      tableWithRelations: relationTable,
      table: _i2.NitChatParticipantTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _chatParticipants!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        channel,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'chatParticipants') {
      return __chatParticipants;
    }
    return null;
  }
}

class NitChatChannelInclude extends _i1.IncludeObject {
  NitChatChannelInclude._(
      {_i2.NitChatParticipantIncludeList? chatParticipants}) {
    _chatParticipants = chatParticipants;
  }

  _i2.NitChatParticipantIncludeList? _chatParticipants;

  @override
  Map<String, _i1.Include?> get includes =>
      {'chatParticipants': _chatParticipants};

  @override
  _i1.Table get table => NitChatChannel.t;
}

class NitChatChannelIncludeList extends _i1.IncludeList {
  NitChatChannelIncludeList._({
    _i1.WhereExpressionBuilder<NitChatChannelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(NitChatChannel.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => NitChatChannel.t;
}

class NitChatChannelRepository {
  const NitChatChannelRepository._();

  final attach = const NitChatChannelAttachRepository._();

  final attachRow = const NitChatChannelAttachRowRepository._();

  final detach = const NitChatChannelDetachRepository._();

  final detachRow = const NitChatChannelDetachRowRepository._();

  Future<List<NitChatChannel>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitChatChannelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitChatChannelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitChatChannelTable>? orderByList,
    _i1.Transaction? transaction,
    NitChatChannelInclude? include,
  }) async {
    return session.db.find<NitChatChannel>(
      where: where?.call(NitChatChannel.t),
      orderBy: orderBy?.call(NitChatChannel.t),
      orderByList: orderByList?.call(NitChatChannel.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<NitChatChannel?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitChatChannelTable>? where,
    int? offset,
    _i1.OrderByBuilder<NitChatChannelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitChatChannelTable>? orderByList,
    _i1.Transaction? transaction,
    NitChatChannelInclude? include,
  }) async {
    return session.db.findFirstRow<NitChatChannel>(
      where: where?.call(NitChatChannel.t),
      orderBy: orderBy?.call(NitChatChannel.t),
      orderByList: orderByList?.call(NitChatChannel.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<NitChatChannel?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    NitChatChannelInclude? include,
  }) async {
    return session.db.findById<NitChatChannel>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<NitChatChannel>> insert(
    _i1.Session session,
    List<NitChatChannel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<NitChatChannel>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatChannel> insertRow(
    _i1.Session session,
    NitChatChannel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<NitChatChannel>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitChatChannel>> update(
    _i1.Session session,
    List<NitChatChannel> rows, {
    _i1.ColumnSelections<NitChatChannelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<NitChatChannel>(
      rows,
      columns: columns?.call(NitChatChannel.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatChannel> updateRow(
    _i1.Session session,
    NitChatChannel row, {
    _i1.ColumnSelections<NitChatChannelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<NitChatChannel>(
      row,
      columns: columns?.call(NitChatChannel.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitChatChannel>> delete(
    _i1.Session session,
    List<NitChatChannel> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<NitChatChannel>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatChannel> deleteRow(
    _i1.Session session,
    NitChatChannel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<NitChatChannel>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitChatChannel>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NitChatChannelTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<NitChatChannel>(
      where: where(NitChatChannel.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitChatChannelTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<NitChatChannel>(
      where: where?.call(NitChatChannel.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class NitChatChannelAttachRepository {
  const NitChatChannelAttachRepository._();

  Future<void> chatParticipants(
    _i1.Session session,
    NitChatChannel nitChatChannel,
    List<_i2.NitChatParticipant> nitChatParticipant, {
    _i1.Transaction? transaction,
  }) async {
    if (nitChatParticipant.any((e) => e.id == null)) {
      throw ArgumentError.notNull('nitChatParticipant.id');
    }
    if (nitChatChannel.id == null) {
      throw ArgumentError.notNull('nitChatChannel.id');
    }

    var $nitChatParticipant = nitChatParticipant
        .map((e) => e.copyWith(chatChannelId: nitChatChannel.id))
        .toList();
    await session.db.update<_i2.NitChatParticipant>(
      $nitChatParticipant,
      columns: [_i2.NitChatParticipant.t.chatChannelId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class NitChatChannelAttachRowRepository {
  const NitChatChannelAttachRowRepository._();

  Future<void> chatParticipants(
    _i1.Session session,
    NitChatChannel nitChatChannel,
    _i2.NitChatParticipant nitChatParticipant, {
    _i1.Transaction? transaction,
  }) async {
    if (nitChatParticipant.id == null) {
      throw ArgumentError.notNull('nitChatParticipant.id');
    }
    if (nitChatChannel.id == null) {
      throw ArgumentError.notNull('nitChatChannel.id');
    }

    var $nitChatParticipant =
        nitChatParticipant.copyWith(chatChannelId: nitChatChannel.id);
    await session.db.updateRow<_i2.NitChatParticipant>(
      $nitChatParticipant,
      columns: [_i2.NitChatParticipant.t.chatChannelId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class NitChatChannelDetachRepository {
  const NitChatChannelDetachRepository._();

  Future<void> chatParticipants(
    _i1.Session session,
    List<_i2.NitChatParticipant> nitChatParticipant, {
    _i1.Transaction? transaction,
  }) async {
    if (nitChatParticipant.any((e) => e.id == null)) {
      throw ArgumentError.notNull('nitChatParticipant.id');
    }

    var $nitChatParticipant =
        nitChatParticipant.map((e) => e.copyWith(chatChannelId: null)).toList();
    await session.db.update<_i2.NitChatParticipant>(
      $nitChatParticipant,
      columns: [_i2.NitChatParticipant.t.chatChannelId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class NitChatChannelDetachRowRepository {
  const NitChatChannelDetachRowRepository._();

  Future<void> chatParticipants(
    _i1.Session session,
    _i2.NitChatParticipant nitChatParticipant, {
    _i1.Transaction? transaction,
  }) async {
    if (nitChatParticipant.id == null) {
      throw ArgumentError.notNull('nitChatParticipant.id');
    }

    var $nitChatParticipant = nitChatParticipant.copyWith(chatChannelId: null);
    await session.db.updateRow<_i2.NitChatParticipant>(
      $nitChatParticipant,
      columns: [_i2.NitChatParticipant.t.chatChannelId],
      transaction: transaction ?? session.transaction,
    );
  }
}
