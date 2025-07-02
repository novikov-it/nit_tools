/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class CustomMessageType
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CustomMessageType._({
    required this.type,
    this.additionalModelId,
  });

  factory CustomMessageType({
    required String type,
    int? additionalModelId,
  }) = _CustomMessageTypeImpl;

  factory CustomMessageType.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomMessageType(
      type: jsonSerialization['type'] as String,
      additionalModelId: jsonSerialization['additionalModelId'] as int?,
    );
  }

  String type;

  int? additionalModelId;

  CustomMessageType copyWith({
    String? type,
    int? additionalModelId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      if (additionalModelId != null) 'additionalModelId': additionalModelId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'type': type,
      if (additionalModelId != null) 'additionalModelId': additionalModelId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomMessageTypeImpl extends CustomMessageType {
  _CustomMessageTypeImpl({
    required String type,
    int? additionalModelId,
  }) : super._(
          type: type,
          additionalModelId: additionalModelId,
        );

  @override
  CustomMessageType copyWith({
    String? type,
    Object? additionalModelId = _Undefined,
  }) {
    return CustomMessageType(
      type: type ?? this.type,
      additionalModelId: additionalModelId is int?
          ? additionalModelId
          : this.additionalModelId,
    );
  }
}
