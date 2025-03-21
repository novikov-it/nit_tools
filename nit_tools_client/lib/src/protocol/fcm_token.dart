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

abstract class NitFcmToken implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String fcmToken;

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
