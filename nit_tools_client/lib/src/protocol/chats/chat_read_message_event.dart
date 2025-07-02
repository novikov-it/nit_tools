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

abstract class NitChatReadMessageEvent implements _i1.SerializableModel {
  NitChatReadMessageEvent._({
    required this.userId,
    required this.messageId,
  });

  factory NitChatReadMessageEvent({
    required int userId,
    required int messageId,
  }) = _NitChatReadMessageEventImpl;

  factory NitChatReadMessageEvent.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return NitChatReadMessageEvent(
      userId: jsonSerialization['userId'] as int,
      messageId: jsonSerialization['messageId'] as int,
    );
  }

  int userId;

  int messageId;

  NitChatReadMessageEvent copyWith({
    int? userId,
    int? messageId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'messageId': messageId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _NitChatReadMessageEventImpl extends NitChatReadMessageEvent {
  _NitChatReadMessageEventImpl({
    required int userId,
    required int messageId,
  }) : super._(
          userId: userId,
          messageId: messageId,
        );

  @override
  NitChatReadMessageEvent copyWith({
    int? userId,
    int? messageId,
  }) {
    return NitChatReadMessageEvent(
      userId: userId ?? this.userId,
      messageId: messageId ?? this.messageId,
    );
  }
}
