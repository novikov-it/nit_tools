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
import '../protocol.dart' as _i2;

abstract class NitMedia implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.MediaType type;

  DateTime createdAt;

  String publicUrl;

  int? duration;

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
