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

abstract class NitChatChannel
    implements _i1.TableRow, _i1.ProtocolSerialization {
  NitChatChannel._({
    this.id,
    required this.channel,
  });

  factory NitChatChannel({
    int? id,
    required String channel,
  }) = _NitChatChannelImpl;

  factory NitChatChannel.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitChatChannel(
      id: jsonSerialization['id'] as int?,
      channel: jsonSerialization['channel'] as String,
    );
  }

  static final t = NitChatChannelTable();

  static const db = NitChatChannelRepository._();

  @override
  int? id;

  String channel;

  @override
  _i1.Table get table => t;

  NitChatChannel copyWith({
    int? id,
    String? channel,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'channel': channel,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'channel': channel,
    };
  }

  static NitChatChannelInclude include() {
    return NitChatChannelInclude._();
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
  }) : super._(
          id: id,
          channel: channel,
        );

  @override
  NitChatChannel copyWith({
    Object? id = _Undefined,
    String? channel,
  }) {
    return NitChatChannel(
      id: id is int? ? id : this.id,
      channel: channel ?? this.channel,
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

  @override
  List<_i1.Column> get columns => [
        id,
        channel,
      ];
}

class NitChatChannelInclude extends _i1.IncludeObject {
  NitChatChannelInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

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

  Future<List<NitChatChannel>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitChatChannelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitChatChannelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitChatChannelTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<NitChatChannel>(
      where: where?.call(NitChatChannel.t),
      orderBy: orderBy?.call(NitChatChannel.t),
      orderByList: orderByList?.call(NitChatChannel.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
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
  }) async {
    return session.db.findFirstRow<NitChatChannel>(
      where: where?.call(NitChatChannel.t),
      orderBy: orderBy?.call(NitChatChannel.t),
      orderByList: orderByList?.call(NitChatChannel.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitChatChannel?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<NitChatChannel>(
      id,
      transaction: transaction ?? session.transaction,
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
