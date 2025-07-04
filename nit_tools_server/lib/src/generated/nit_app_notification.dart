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

abstract class NitAppNotification
    implements _i1.TableRow, _i1.ProtocolSerialization {
  NitAppNotification._({
    this.id,
    required this.toUserId,
    this.identifier,
    DateTime? timestamp,
    required this.title,
    this.body,
    this.goToPath,
    this.pathQueryParams,
    this.fromUserId,
    bool? isRead,
  })  : timestamp = timestamp ?? DateTime.now(),
        isRead = isRead ?? false;

  factory NitAppNotification({
    int? id,
    required int toUserId,
    String? identifier,
    DateTime? timestamp,
    required String title,
    String? body,
    String? goToPath,
    String? pathQueryParams,
    int? fromUserId,
    bool? isRead,
  }) = _NitAppNotificationImpl;

  factory NitAppNotification.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitAppNotification(
      id: jsonSerialization['id'] as int?,
      toUserId: jsonSerialization['toUserId'] as int,
      identifier: jsonSerialization['identifier'] as String?,
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
      title: jsonSerialization['title'] as String,
      body: jsonSerialization['body'] as String?,
      goToPath: jsonSerialization['goToPath'] as String?,
      pathQueryParams: jsonSerialization['pathQueryParams'] as String?,
      fromUserId: jsonSerialization['fromUserId'] as int?,
      isRead: jsonSerialization['isRead'] as bool,
    );
  }

  static final t = NitAppNotificationTable();

  static const db = NitAppNotificationRepository._();

  @override
  int? id;

  int toUserId;

  String? identifier;

  DateTime timestamp;

  String title;

  String? body;

  String? goToPath;

  String? pathQueryParams;

  int? fromUserId;

  bool isRead;

  @override
  _i1.Table get table => t;

  NitAppNotification copyWith({
    int? id,
    int? toUserId,
    String? identifier,
    DateTime? timestamp,
    String? title,
    String? body,
    String? goToPath,
    String? pathQueryParams,
    int? fromUserId,
    bool? isRead,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'toUserId': toUserId,
      if (identifier != null) 'identifier': identifier,
      'timestamp': timestamp.toJson(),
      'title': title,
      if (body != null) 'body': body,
      if (goToPath != null) 'goToPath': goToPath,
      if (pathQueryParams != null) 'pathQueryParams': pathQueryParams,
      if (fromUserId != null) 'fromUserId': fromUserId,
      'isRead': isRead,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'toUserId': toUserId,
      if (identifier != null) 'identifier': identifier,
      'timestamp': timestamp.toJson(),
      'title': title,
      if (body != null) 'body': body,
      if (goToPath != null) 'goToPath': goToPath,
      if (pathQueryParams != null) 'pathQueryParams': pathQueryParams,
      if (fromUserId != null) 'fromUserId': fromUserId,
      'isRead': isRead,
    };
  }

  static NitAppNotificationInclude include() {
    return NitAppNotificationInclude._();
  }

  static NitAppNotificationIncludeList includeList({
    _i1.WhereExpressionBuilder<NitAppNotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitAppNotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitAppNotificationTable>? orderByList,
    NitAppNotificationInclude? include,
  }) {
    return NitAppNotificationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NitAppNotification.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(NitAppNotification.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NitAppNotificationImpl extends NitAppNotification {
  _NitAppNotificationImpl({
    int? id,
    required int toUserId,
    String? identifier,
    DateTime? timestamp,
    required String title,
    String? body,
    String? goToPath,
    String? pathQueryParams,
    int? fromUserId,
    bool? isRead,
  }) : super._(
          id: id,
          toUserId: toUserId,
          identifier: identifier,
          timestamp: timestamp,
          title: title,
          body: body,
          goToPath: goToPath,
          pathQueryParams: pathQueryParams,
          fromUserId: fromUserId,
          isRead: isRead,
        );

  @override
  NitAppNotification copyWith({
    Object? id = _Undefined,
    int? toUserId,
    Object? identifier = _Undefined,
    DateTime? timestamp,
    String? title,
    Object? body = _Undefined,
    Object? goToPath = _Undefined,
    Object? pathQueryParams = _Undefined,
    Object? fromUserId = _Undefined,
    bool? isRead,
  }) {
    return NitAppNotification(
      id: id is int? ? id : this.id,
      toUserId: toUserId ?? this.toUserId,
      identifier: identifier is String? ? identifier : this.identifier,
      timestamp: timestamp ?? this.timestamp,
      title: title ?? this.title,
      body: body is String? ? body : this.body,
      goToPath: goToPath is String? ? goToPath : this.goToPath,
      pathQueryParams:
          pathQueryParams is String? ? pathQueryParams : this.pathQueryParams,
      fromUserId: fromUserId is int? ? fromUserId : this.fromUserId,
      isRead: isRead ?? this.isRead,
    );
  }
}

class NitAppNotificationTable extends _i1.Table {
  NitAppNotificationTable({super.tableRelation})
      : super(tableName: 'nit_app_notification') {
    toUserId = _i1.ColumnInt(
      'toUserId',
      this,
    );
    identifier = _i1.ColumnString(
      'identifier',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
      hasDefault: true,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    body = _i1.ColumnString(
      'body',
      this,
    );
    goToPath = _i1.ColumnString(
      'goToPath',
      this,
    );
    pathQueryParams = _i1.ColumnString(
      'pathQueryParams',
      this,
    );
    fromUserId = _i1.ColumnInt(
      'fromUserId',
      this,
    );
    isRead = _i1.ColumnBool(
      'isRead',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt toUserId;

  late final _i1.ColumnString identifier;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnString title;

  late final _i1.ColumnString body;

  late final _i1.ColumnString goToPath;

  late final _i1.ColumnString pathQueryParams;

  late final _i1.ColumnInt fromUserId;

  late final _i1.ColumnBool isRead;

  @override
  List<_i1.Column> get columns => [
        id,
        toUserId,
        identifier,
        timestamp,
        title,
        body,
        goToPath,
        pathQueryParams,
        fromUserId,
        isRead,
      ];
}

class NitAppNotificationInclude extends _i1.IncludeObject {
  NitAppNotificationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => NitAppNotification.t;
}

class NitAppNotificationIncludeList extends _i1.IncludeList {
  NitAppNotificationIncludeList._({
    _i1.WhereExpressionBuilder<NitAppNotificationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(NitAppNotification.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => NitAppNotification.t;
}

class NitAppNotificationRepository {
  const NitAppNotificationRepository._();

  Future<List<NitAppNotification>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitAppNotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NitAppNotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitAppNotificationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<NitAppNotification>(
      where: where?.call(NitAppNotification.t),
      orderBy: orderBy?.call(NitAppNotification.t),
      orderByList: orderByList?.call(NitAppNotification.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitAppNotification?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitAppNotificationTable>? where,
    int? offset,
    _i1.OrderByBuilder<NitAppNotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NitAppNotificationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<NitAppNotification>(
      where: where?.call(NitAppNotification.t),
      orderBy: orderBy?.call(NitAppNotification.t),
      orderByList: orderByList?.call(NitAppNotification.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitAppNotification?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<NitAppNotification>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitAppNotification>> insert(
    _i1.Session session,
    List<NitAppNotification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<NitAppNotification>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitAppNotification> insertRow(
    _i1.Session session,
    NitAppNotification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<NitAppNotification>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitAppNotification>> update(
    _i1.Session session,
    List<NitAppNotification> rows, {
    _i1.ColumnSelections<NitAppNotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<NitAppNotification>(
      rows,
      columns: columns?.call(NitAppNotification.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitAppNotification> updateRow(
    _i1.Session session,
    NitAppNotification row, {
    _i1.ColumnSelections<NitAppNotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<NitAppNotification>(
      row,
      columns: columns?.call(NitAppNotification.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitAppNotification>> delete(
    _i1.Session session,
    List<NitAppNotification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<NitAppNotification>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<NitAppNotification> deleteRow(
    _i1.Session session,
    NitAppNotification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<NitAppNotification>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<NitAppNotification>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NitAppNotificationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<NitAppNotification>(
      where: where(NitAppNotification.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NitAppNotificationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<NitAppNotification>(
      where: where?.call(NitAppNotification.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}
