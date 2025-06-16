/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class NitAppNotification implements _i1.SerializableModel {
  NitAppNotification._({
    this.id,
    required this.toUserId,
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int toUserId;

  DateTime timestamp;

  String title;

  String? body;

  String? goToPath;

  String? pathQueryParams;

  int? fromUserId;

  bool isRead;

  NitAppNotification copyWith({
    int? id,
    int? toUserId,
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
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NitAppNotificationImpl extends NitAppNotification {
  _NitAppNotificationImpl({
    int? id,
    required int toUserId,
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
