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

abstract class AppNotification
    implements _i1.TableRow, _i1.ProtocolSerialization {
  AppNotification._({
    this.id,
    required this.toUserId,
    DateTime? timestamp,
    required this.title,
    this.body,
    this.goToPath,
    bool? isRead,
  })  : timestamp = timestamp ?? DateTime.now(),
        isRead = isRead ?? false;

  factory AppNotification({
    int? id,
    required int toUserId,
    DateTime? timestamp,
    required String title,
    String? body,
    String? goToPath,
    bool? isRead,
  }) = _AppNotificationImpl;

  factory AppNotification.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppNotification(
      id: jsonSerialization['id'] as int?,
      toUserId: jsonSerialization['toUserId'] as int,
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
      title: jsonSerialization['title'] as String,
      body: jsonSerialization['body'] as String?,
      goToPath: jsonSerialization['goToPath'] as String?,
      isRead: jsonSerialization['isRead'] as bool,
    );
  }

  static final t = AppNotificationTable();

  static const db = AppNotificationRepository._();

  @override
  int? id;

  int toUserId;

  DateTime timestamp;

  String title;

  String? body;

  String? goToPath;

  bool isRead;

  @override
  _i1.Table get table => t;

  AppNotification copyWith({
    int? id,
    int? toUserId,
    DateTime? timestamp,
    String? title,
    String? body,
    String? goToPath,
    bool? isRead,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'toUserId': toUserId,
      'timestamp': timestamp.toJson(),
      'title': title,
      if (body != null) 'body': body,
      if (goToPath != null) 'goToPath': goToPath,
      'isRead': isRead,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'toUserId': toUserId,
      'timestamp': timestamp.toJson(),
      'title': title,
      if (body != null) 'body': body,
      if (goToPath != null) 'goToPath': goToPath,
      'isRead': isRead,
    };
  }

  static AppNotificationInclude include() {
    return AppNotificationInclude._();
  }

  static AppNotificationIncludeList includeList({
    _i1.WhereExpressionBuilder<AppNotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppNotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppNotificationTable>? orderByList,
    AppNotificationInclude? include,
  }) {
    return AppNotificationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppNotification.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AppNotification.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppNotificationImpl extends AppNotification {
  _AppNotificationImpl({
    int? id,
    required int toUserId,
    DateTime? timestamp,
    required String title,
    String? body,
    String? goToPath,
    bool? isRead,
  }) : super._(
          id: id,
          toUserId: toUserId,
          timestamp: timestamp,
          title: title,
          body: body,
          goToPath: goToPath,
          isRead: isRead,
        );

  @override
  AppNotification copyWith({
    Object? id = _Undefined,
    int? toUserId,
    DateTime? timestamp,
    String? title,
    Object? body = _Undefined,
    Object? goToPath = _Undefined,
    bool? isRead,
  }) {
    return AppNotification(
      id: id is int? ? id : this.id,
      toUserId: toUserId ?? this.toUserId,
      timestamp: timestamp ?? this.timestamp,
      title: title ?? this.title,
      body: body is String? ? body : this.body,
      goToPath: goToPath is String? ? goToPath : this.goToPath,
      isRead: isRead ?? this.isRead,
    );
  }
}

class AppNotificationTable extends _i1.Table {
  AppNotificationTable({super.tableRelation})
      : super(tableName: 'app_notification') {
    toUserId = _i1.ColumnInt(
      'toUserId',
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
    isRead = _i1.ColumnBool(
      'isRead',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt toUserId;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnString title;

  late final _i1.ColumnString body;

  late final _i1.ColumnString goToPath;

  late final _i1.ColumnBool isRead;

  @override
  List<_i1.Column> get columns => [
        id,
        toUserId,
        timestamp,
        title,
        body,
        goToPath,
        isRead,
      ];
}

class AppNotificationInclude extends _i1.IncludeObject {
  AppNotificationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => AppNotification.t;
}

class AppNotificationIncludeList extends _i1.IncludeList {
  AppNotificationIncludeList._({
    _i1.WhereExpressionBuilder<AppNotificationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppNotification.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => AppNotification.t;
}

class AppNotificationRepository {
  const AppNotificationRepository._();

  Future<List<AppNotification>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppNotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppNotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppNotificationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AppNotification>(
      where: where?.call(AppNotification.t),
      orderBy: orderBy?.call(AppNotification.t),
      orderByList: orderByList?.call(AppNotification.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<AppNotification?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppNotificationTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppNotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppNotificationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<AppNotification>(
      where: where?.call(AppNotification.t),
      orderBy: orderBy?.call(AppNotification.t),
      orderByList: orderByList?.call(AppNotification.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<AppNotification?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<AppNotification>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<AppNotification>> insert(
    _i1.Session session,
    List<AppNotification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AppNotification>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<AppNotification> insertRow(
    _i1.Session session,
    AppNotification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppNotification>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<AppNotification>> update(
    _i1.Session session,
    List<AppNotification> rows, {
    _i1.ColumnSelections<AppNotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AppNotification>(
      rows,
      columns: columns?.call(AppNotification.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<AppNotification> updateRow(
    _i1.Session session,
    AppNotification row, {
    _i1.ColumnSelections<AppNotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppNotification>(
      row,
      columns: columns?.call(AppNotification.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<AppNotification>> delete(
    _i1.Session session,
    List<AppNotification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AppNotification>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<AppNotification> deleteRow(
    _i1.Session session,
    AppNotification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppNotification>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<AppNotification>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AppNotificationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AppNotification>(
      where: where(AppNotification.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppNotificationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AppNotification>(
      where: where?.call(AppNotification.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}
