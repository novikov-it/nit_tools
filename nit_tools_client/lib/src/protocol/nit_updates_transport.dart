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
import '/src/extra_classes/object_wrapper.dart' as _i2;

abstract class NitUpdatesTransport implements _i1.SerializableModel {
  NitUpdatesTransport._({required this.updatedEntities});

  factory NitUpdatesTransport(
          {required List<_i2.ObjectWrapper> updatedEntities}) =
      _NitUpdatesTransportImpl;

  factory NitUpdatesTransport.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitUpdatesTransport(
        updatedEntities: (jsonSerialization['updatedEntities'] as List)
            .map((e) => _i2.ObjectWrapper.fromJson(e))
            .toList());
  }

  List<_i2.ObjectWrapper> updatedEntities;

  NitUpdatesTransport copyWith({List<_i2.ObjectWrapper>? updatedEntities});
  @override
  Map<String, dynamic> toJson() {
    return {
      'updatedEntities': updatedEntities.toJson(valueToJson: (v) => v.toJson())
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _NitUpdatesTransportImpl extends NitUpdatesTransport {
  _NitUpdatesTransportImpl({required List<_i2.ObjectWrapper> updatedEntities})
      : super._(updatedEntities: updatedEntities);

  @override
  NitUpdatesTransport copyWith({List<_i2.ObjectWrapper>? updatedEntities}) {
    return NitUpdatesTransport(
        updatedEntities: updatedEntities ??
            this.updatedEntities.map((e0) => e0.copyWith()).toList());
  }
}
