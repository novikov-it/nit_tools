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

abstract class FcmToken implements _i1.TableRow, _i1.ProtocolSerialization {
  FcmToken._({
    this.id,
    required this.userId,
    required this.fcmToken,
  });

  factory FcmToken({
    int? id,
    required int userId,
    required String fcmToken,
  }) = _FcmTokenImpl;

  factory FcmToken.fromJson(Map<String, dynamic> jsonSerialization) {
    return FcmToken(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      fcmToken: jsonSerialization['fcmToken'] as String,
    );
  }

  static final t = FcmTokenTable();

  static const db = FcmTokenRepository._();

  @override
  int? id;

  int userId;

  String fcmToken;

  @override
  _i1.Table get table => t;

  FcmToken copyWith({
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

  static FcmTokenInclude include() {
    return FcmTokenInclude._();
  }

  static FcmTokenIncludeList includeList({
    _i1.WhereExpressionBuilder<FcmTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FcmTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FcmTokenTable>? orderByList,
    FcmTokenInclude? include,
  }) {
    return FcmTokenIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FcmToken.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(FcmToken.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FcmTokenImpl extends FcmToken {
  _FcmTokenImpl({
    int? id,
    required int userId,
    required String fcmToken,
  }) : super._(
          id: id,
          userId: userId,
          fcmToken: fcmToken,
        );

  @override
  FcmToken copyWith({
    Object? id = _Undefined,
    int? userId,
    String? fcmToken,
  }) {
    return FcmToken(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}

class FcmTokenTable extends _i1.Table {
  FcmTokenTable({super.tableRelation}) : super(tableName: 'fcm_token') {
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

class FcmTokenInclude extends _i1.IncludeObject {
  FcmTokenInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => FcmToken.t;
}

class FcmTokenIncludeList extends _i1.IncludeList {
  FcmTokenIncludeList._({
    _i1.WhereExpressionBuilder<FcmTokenTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FcmToken.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => FcmToken.t;
}

class FcmTokenRepository {
  const FcmTokenRepository._();

  Future<List<FcmToken>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FcmTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FcmTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FcmTokenTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<FcmToken>(
      where: where?.call(FcmToken.t),
      orderBy: orderBy?.call(FcmToken.t),
      orderByList: orderByList?.call(FcmToken.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<FcmToken?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FcmTokenTable>? where,
    int? offset,
    _i1.OrderByBuilder<FcmTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FcmTokenTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<FcmToken>(
      where: where?.call(FcmToken.t),
      orderBy: orderBy?.call(FcmToken.t),
      orderByList: orderByList?.call(FcmToken.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<FcmToken?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<FcmToken>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<FcmToken>> insert(
    _i1.Session session,
    List<FcmToken> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<FcmToken>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<FcmToken> insertRow(
    _i1.Session session,
    FcmToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<FcmToken>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<FcmToken>> update(
    _i1.Session session,
    List<FcmToken> rows, {
    _i1.ColumnSelections<FcmTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<FcmToken>(
      rows,
      columns: columns?.call(FcmToken.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<FcmToken> updateRow(
    _i1.Session session,
    FcmToken row, {
    _i1.ColumnSelections<FcmTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<FcmToken>(
      row,
      columns: columns?.call(FcmToken.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<FcmToken>> delete(
    _i1.Session session,
    List<FcmToken> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<FcmToken>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<FcmToken> deleteRow(
    _i1.Session session,
    FcmToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FcmToken>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<FcmToken>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FcmTokenTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<FcmToken>(
      where: where(FcmToken.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FcmTokenTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<FcmToken>(
      where: where?.call(FcmToken.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}
