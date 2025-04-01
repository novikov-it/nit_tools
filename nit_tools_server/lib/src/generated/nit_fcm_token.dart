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

abstract class NitFcmToken implements _i1.TableRow, _i1.ProtocolSerialization {
  NitFcmToken._({
    this.id,
    required this.userId,
    required this.fcmToken,
  });

  factory NitFcmToken({
    int? id,
    required int userId,
    required String fcmToken,
  }) = _NitFcmTokenImpl;

  factory NitFcmToken.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitFcmToken(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      fcmToken: jsonSerialization['fcmToken'] as String,
    );
  }

  static final t = NitFcmTokenTable();

  static const db = NitFcmTokenRepository._();

  @override
  int? id;

  int userId;

  String fcmToken;

  @override
  _i1.Table get table => t;

  NitFcmToken copyWith({
    int? id,
    int? userId,
    String? fcmToken,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'fcmToken': fcmToken,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'fcmToken': fcmToken,
    };
  }

  static NitFcmTokenInclude include() {
    return NitFcmTokenInclude._();
  }

  static NitFcmTokenIncludeList includeList({
    _i1.WhereExpressionBuilder<NitFcmTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitFcmTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitFcmTokenTable>? orderByList,
    NitFcmTokenInclude? include,
  }) {
    return NitFcmTokenIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NitFcmToken.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(NitFcmToken.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NitFcmTokenImpl extends NitFcmToken {
  _NitFcmTokenImpl({
    int? id,
    required int userId,
    required String fcmToken,
  }) : super._(
          id: id,
          userId: userId,
          fcmToken: fcmToken,
        );

  @override
  NitFcmToken copyWith({
    Object? id = _Undefined,
    int? userId,
    String? fcmToken,
  }) {
    return NitFcmToken(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}

class NitFcmTokenTable extends _i1.Table {
  NitFcmTokenTable({super.tableRelation}) : super(tableName: 'nit_fcm_token') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    fcmToken = _i1.ColumnString(
      'fcmToken',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString fcmToken;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        fcmToken,
      ];
}

class NitFcmTokenInclude extends _i1.IncludeObject {
  NitFcmTokenInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => NitFcmToken.t;
}

class NitFcmTokenIncludeList extends _i1.IncludeList {
  NitFcmTokenIncludeList._({
    _i1.WhereExpressionBuilder<NitFcmTokenTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(NitFcmToken.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => NitFcmToken.t;
}

class NitFcmTokenRepository {
  const NitFcmTokenRepository._();

  Future<List<NitFcmToken>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitFcmTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitFcmTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitFcmTokenTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<NitFcmToken>(
      where: where?.call(NitFcmToken.t),
      orderBy: orderBy?.call(NitFcmToken.t),
      orderByList: orderByList?.call(NitFcmToken.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitFcmToken?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitFcmTokenTable>? where,
    int? offset,
    _i1.OrderByBuilder<NitFcmTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitFcmTokenTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<NitFcmToken>(
      where: where?.call(NitFcmToken.t),
      orderBy: orderBy?.call(NitFcmToken.t),
      orderByList: orderByList?.call(NitFcmToken.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitFcmToken?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<NitFcmToken>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitFcmToken>> insert(
    _i1.Session session,
    List<NitFcmToken> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<NitFcmToken>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitFcmToken> insertRow(
    _i1.Session session,
    NitFcmToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<NitFcmToken>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitFcmToken>> update(
    _i1.Session session,
    List<NitFcmToken> rows, {
    _i1.ColumnSelections<NitFcmTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<NitFcmToken>(
      rows,
      columns: columns?.call(NitFcmToken.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitFcmToken> updateRow(
    _i1.Session session,
    NitFcmToken row, {
    _i1.ColumnSelections<NitFcmTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<NitFcmToken>(
      row,
      columns: columns?.call(NitFcmToken.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitFcmToken>> delete(
    _i1.Session session,
    List<NitFcmToken> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<NitFcmToken>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitFcmToken> deleteRow(
    _i1.Session session,
    NitFcmToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<NitFcmToken>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitFcmToken>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NitFcmTokenTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<NitFcmToken>(
      where: where(NitFcmToken.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitFcmTokenTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<NitFcmToken>(
      where: where?.call(NitFcmToken.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}
