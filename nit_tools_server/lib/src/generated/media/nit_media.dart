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

abstract class NitMedia implements _i1.TableRow, _i1.ProtocolSerialization {
  NitMedia._({
    this.id,
    required this.type,
    required this.createdAt,
    required this.publicUrl,
    this.duration,
  });

  factory NitMedia({
    int? id,
    required _i2.MediaType type,
    required DateTime createdAt,
    required String publicUrl,
    int? duration,
  }) = _NitMediaImpl;

  factory NitMedia.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitMedia(
      id: jsonSerialization['id'] as int?,
      type: _i2.MediaType.fromJson((jsonSerialization['type'] as int)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      publicUrl: jsonSerialization['publicUrl'] as String,
      duration: jsonSerialization['duration'] as int?,
    );
  }

  static final t = NitMediaTable();

  static const db = NitMediaRepository._();

  @override
  int? id;

  _i2.MediaType type;

  DateTime createdAt;

  String publicUrl;

  int? duration;

  @override
  _i1.Table get table => t;

  NitMedia copyWith({
    int? id,
    _i2.MediaType? type,
    DateTime? createdAt,
    String? publicUrl,
    int? duration,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'type': type.toJson(),
      'createdAt': createdAt.toJson(),
      'publicUrl': publicUrl,
      if (duration != null) 'duration': duration,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'type': type.toJson(),
      'createdAt': createdAt.toJson(),
      'publicUrl': publicUrl,
      if (duration != null) 'duration': duration,
    };
  }

  static NitMediaInclude include() {
    return NitMediaInclude._();
  }

  static NitMediaIncludeList includeList({
    _i1.WhereExpressionBuilder<NitMediaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitMediaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitMediaTable>? orderByList,
    NitMediaInclude? include,
  }) {
    return NitMediaIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NitMedia.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(NitMedia.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NitMediaImpl extends NitMedia {
  _NitMediaImpl({
    int? id,
    required _i2.MediaType type,
    required DateTime createdAt,
    required String publicUrl,
    int? duration,
  }) : super._(
          id: id,
          type: type,
          createdAt: createdAt,
          publicUrl: publicUrl,
          duration: duration,
        );

  @override
  NitMedia copyWith({
    Object? id = _Undefined,
    _i2.MediaType? type,
    DateTime? createdAt,
    String? publicUrl,
    Object? duration = _Undefined,
  }) {
    return NitMedia(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      publicUrl: publicUrl ?? this.publicUrl,
      duration: duration is int? ? duration : this.duration,
    );
  }
}

class NitMediaTable extends _i1.Table {
  NitMediaTable({super.tableRelation}) : super(tableName: 'nit_media') {
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byIndex,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    publicUrl = _i1.ColumnString(
      'publicUrl',
      this,
    );
    duration = _i1.ColumnInt(
      'duration',
      this,
    );
  }

  late final _i1.ColumnEnum<_i2.MediaType> type;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnString publicUrl;

  late final _i1.ColumnInt duration;

  @override
  List<_i1.Column> get columns => [
        id,
        type,
        createdAt,
        publicUrl,
        duration,
      ];
}

class NitMediaInclude extends _i1.IncludeObject {
  NitMediaInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => NitMedia.t;
}

class NitMediaIncludeList extends _i1.IncludeList {
  NitMediaIncludeList._({
    _i1.WhereExpressionBuilder<NitMediaTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(NitMedia.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => NitMedia.t;
}

class NitMediaRepository {
  const NitMediaRepository._();

  Future<List<NitMedia>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitMediaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitMediaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitMediaTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<NitMedia>(
      where: where?.call(NitMedia.t),
      orderBy: orderBy?.call(NitMedia.t),
      orderByList: orderByList?.call(NitMedia.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitMedia?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitMediaTable>? where,
    int? offset,
    _i1.OrderByBuilder<NitMediaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitMediaTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<NitMedia>(
      where: where?.call(NitMedia.t),
      orderBy: orderBy?.call(NitMedia.t),
      orderByList: orderByList?.call(NitMedia.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitMedia?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<NitMedia>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitMedia>> insert(
    _i1.Session session,
    List<NitMedia> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<NitMedia>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitMedia> insertRow(
    _i1.Session session,
    NitMedia row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<NitMedia>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitMedia>> update(
    _i1.Session session,
    List<NitMedia> rows, {
    _i1.ColumnSelections<NitMediaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<NitMedia>(
      rows,
      columns: columns?.call(NitMedia.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitMedia> updateRow(
    _i1.Session session,
    NitMedia row, {
    _i1.ColumnSelections<NitMediaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<NitMedia>(
      row,
      columns: columns?.call(NitMedia.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitMedia>> delete(
    _i1.Session session,
    List<NitMedia> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<NitMedia>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitMedia> deleteRow(
    _i1.Session session,
    NitMedia row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<NitMedia>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitMedia>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NitMediaTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<NitMedia>(
      where: where(NitMedia.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitMediaTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<NitMedia>(
      where: where?.call(NitMedia.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}
