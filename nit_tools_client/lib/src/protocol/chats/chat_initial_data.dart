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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i3;

abstract class NitChatInitialData implements _i1.SerializableModel {
  NitChatInitialData._({
    required this.messages,
    required this.participantProfiles,
  });

  factory NitChatInitialData({
    required List<_i2.NitChatMessage> messages,
    required List<_i3.UserInfo> participantProfiles,
  }) = _NitChatInitialDataImpl;

  factory NitChatInitialData.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitChatInitialData(
      messages: (jsonSerialization['messages'] as List)
          .map((e) => _i2.NitChatMessage.fromJson((e as Map<String, dynamic>)))
          .toList(),
      participantProfiles: (jsonSerialization['participantProfiles'] as List)
          .map((e) => _i3.UserInfo.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  List<_i2.NitChatMessage> messages;

  List<_i3.UserInfo> participantProfiles;

  NitChatInitialData copyWith({
    List<_i2.NitChatMessage>? messages,
    List<_i3.UserInfo>? participantProfiles,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'messages': messages.toJson(valueToJson: (v) => v.toJson()),
      'participantProfiles':
          participantProfiles.toJson(valueToJson: (v) => v.toJson()),
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
    required List<_i3.UserInfo> participantProfiles,
  }) : super._(
          messages: messages,
          participantProfiles: participantProfiles,
        );

  @override
  NitChatInitialData copyWith({
    List<_i2.NitChatMessage>? messages,
    List<_i3.UserInfo>? participantProfiles,
  }) {
    return NitChatInitialData(
      messages: messages ?? this.messages.map((e0) => e0.copyWith()).toList(),
      participantProfiles: participantProfiles ??
          this.participantProfiles.map((e0) => e0.copyWith()).toList(),
    );
  }
}
