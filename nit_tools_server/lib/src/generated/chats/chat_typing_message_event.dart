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

abstract class NitTypingMessageEvent
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  NitTypingMessageEvent._({
    required this.userId,
    required this.isTyping,
  });

  factory NitTypingMessageEvent({
    required int userId,
    required bool isTyping,
  }) = _NitTypingMessageEventImpl;

  factory NitTypingMessageEvent.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return NitTypingMessageEvent(
      userId: jsonSerialization['userId'] as int,
      isTyping: jsonSerialization['isTyping'] as bool,
    );
  }

  int userId;

  bool isTyping;

  NitTypingMessageEvent copyWith({
    int? userId,
    bool? isTyping,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'isTyping': isTyping,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'userId': userId,
      'isTyping': isTyping,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _NitTypingMessageEventImpl extends NitTypingMessageEvent {
  _NitTypingMessageEventImpl({
    required int userId,
    required bool isTyping,
  }) : super._(
          userId: userId,
          isTyping: isTyping,
        );

  @override
  NitTypingMessageEvent copyWith({
    int? userId,
    bool? isTyping,
  }) {
    return NitTypingMessageEvent(
      userId: userId ?? this.userId,
      isTyping: isTyping ?? this.isTyping,
    );
  }
}
