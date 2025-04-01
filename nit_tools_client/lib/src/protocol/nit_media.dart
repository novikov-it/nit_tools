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

abstract class NitMedia implements _i1.SerializableModel {
  NitMedia._({
    this.id,
    required this.createdAt,
    required this.publicUrl,
  });

  factory NitMedia({
    int? id,
    required DateTime createdAt,
    required String publicUrl,
  }) = _NitMediaImpl;

  factory NitMedia.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitMedia(
      id: jsonSerialization['id'] as int?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      publicUrl: jsonSerialization['publicUrl'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime createdAt;

  String publicUrl;

  NitMedia copyWith({
    int? id,
    DateTime? createdAt,
    String? publicUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'createdAt': createdAt.toJson(),
      'publicUrl': publicUrl,
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
    required DateTime createdAt,
    required String publicUrl,
  }) : super._(
          id: id,
          createdAt: createdAt,
          publicUrl: publicUrl,
        );

  @override
  NitMedia copyWith({
    Object? id = _Undefined,
    DateTime? createdAt,
    String? publicUrl,
  }) {
    return NitMedia(
      id: id is int? ? id : this.id,
      createdAt: createdAt ?? this.createdAt,
      publicUrl: publicUrl ?? this.publicUrl,
    );
  }
}
