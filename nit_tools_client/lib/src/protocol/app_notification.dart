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

abstract class AppNotification implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int toUserId;

  DateTime timestamp;

  String title;

  String? body;

  String? goToPath;

  bool isRead;

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
