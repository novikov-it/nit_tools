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
import '../protocol.dart' as _i2;
import '/src/extra_classes/object_wrapper.dart' as _i3;

abstract class NitChatInitialData
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  NitChatInitialData._({
    required this.messages,
    required this.participantIds,
    required this.additionalEntities,
  });

  factory NitChatInitialData({
    required List<_i2.NitChatMessage> messages,
    required List<int> participantIds,
    required List<_i3.ObjectWrapper> additionalEntities,
  }) = _NitChatInitialDataImpl;

  factory NitChatInitialData.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitChatInitialData(
      messages: (jsonSerialization['messages'] as List)
          .map((e) => _i2.NitChatMessage.fromJson((e as Map<String, dynamic>)))
          .toList(),
      participantIds: (jsonSerialization['participantIds'] as List)
          .map((e) => e as int)
          .toList(),
      additionalEntities: (jsonSerialization['additionalEntities'] as List)
          .map((e) => _i3.ObjectWrapper.fromJson(e))
          .toList(),
    );
  }

  List<_i2.NitChatMessage> messages;

  List<int> participantIds;

  List<_i3.ObjectWrapper> additionalEntities;

  NitChatInitialData copyWith({
    List<_i2.NitChatMessage>? messages,
    List<int>? participantIds,
    List<_i3.ObjectWrapper>? additionalEntities,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'messages': messages.toJson(valueToJson: (v) => v.toJson()),
      'participantIds': participantIds.toJson(),
      'additionalEntities':
          additionalEntities.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'messages': messages.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'participantIds': participantIds.toJson(),
      'additionalEntities':
          additionalEntities.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _NitChatInitialDataImpl extends NitChatInitialData {
  _NitChatInitialDataImpl({
    required List<_i2.NitChatMessage> messages,
    required List<int> participantIds,
    required List<_i3.ObjectWrapper> additionalEntities,
  }) : super._(
          messages: messages,
          participantIds: participantIds,
          additionalEntities: additionalEntities,
        );

  @override
  NitChatInitialData copyWith({
    List<_i2.NitChatMessage>? messages,
    List<int>? participantIds,
    List<_i3.ObjectWrapper>? additionalEntities,
  }) {
    return NitChatInitialData(
      messages: messages ?? this.messages.map((e0) => e0.copyWith()).toList(),
      participantIds:
          participantIds ?? this.participantIds.map((e0) => e0).toList(),
      additionalEntities: additionalEntities ??
          this.additionalEntities.map((e0) => e0.copyWith()).toList(),
    );
  }
}
