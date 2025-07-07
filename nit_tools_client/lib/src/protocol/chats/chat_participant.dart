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

abstract class NitChatParticipant implements _i1.SerializableModel {
  NitChatParticipant._({
    this.id,
    required this.userId,
    required this.chatChannelId,
    this.lastMessage,
    this.lastMessageId,
    this.lastMessageSentAt,
    int? unreadCount,
    this.lastReadMessageId,
    bool? isDeleted,
  })  : unreadCount = unreadCount ?? 0,
        isDeleted = isDeleted ?? false;

  factory NitChatParticipant({
    int? id,
    required int userId,
    required int chatChannelId,
    String? lastMessage,
    int? lastMessageId,
    DateTime? lastMessageSentAt,
    int? unreadCount,
    int? lastReadMessageId,
    bool? isDeleted,
  }) = _NitChatParticipantImpl;

  factory NitChatParticipant.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitChatParticipant(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      chatChannelId: jsonSerialization['chatChannelId'] as int,
      lastMessage: jsonSerialization['lastMessage'] as String?,
      lastMessageId: jsonSerialization['lastMessageId'] as int?,
      lastMessageSentAt: jsonSerialization['lastMessageSentAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastMessageSentAt']),
      unreadCount: jsonSerialization['unreadCount'] as int,
      lastReadMessageId: jsonSerialization['lastReadMessageId'] as int?,
      isDeleted: jsonSerialization['isDeleted'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int chatChannelId;

  String? lastMessage;

  int? lastMessageId;

  DateTime? lastMessageSentAt;

  int unreadCount;

  int? lastReadMessageId;

  bool isDeleted;

  NitChatParticipant copyWith({
    int? id,
    int? userId,
    int? chatChannelId,
    String? lastMessage,
    int? lastMessageId,
    DateTime? lastMessageSentAt,
    int? unreadCount,
    int? lastReadMessageId,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'chatChannelId': chatChannelId,
      if (lastMessage != null) 'lastMessage': lastMessage,
      if (lastMessageId != null) 'lastMessageId': lastMessageId,
      if (lastMessageSentAt != null)
        'lastMessageSentAt': lastMessageSentAt?.toJson(),
      'unreadCount': unreadCount,
      if (lastReadMessageId != null) 'lastReadMessageId': lastReadMessageId,
      'isDeleted': isDeleted,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NitChatParticipantImpl extends NitChatParticipant {
  _NitChatParticipantImpl({
    int? id,
    required int userId,
    required int chatChannelId,
    String? lastMessage,
    int? lastMessageId,
    DateTime? lastMessageSentAt,
    int? unreadCount,
    int? lastReadMessageId,
    bool? isDeleted,
  }) : super._(
          id: id,
          userId: userId,
          chatChannelId: chatChannelId,
          lastMessage: lastMessage,
          lastMessageId: lastMessageId,
          lastMessageSentAt: lastMessageSentAt,
          unreadCount: unreadCount,
          lastReadMessageId: lastReadMessageId,
          isDeleted: isDeleted,
        );

  @override
  NitChatParticipant copyWith({
    Object? id = _Undefined,
    int? userId,
    int? chatChannelId,
    Object? lastMessage = _Undefined,
    Object? lastMessageId = _Undefined,
    Object? lastMessageSentAt = _Undefined,
    int? unreadCount,
    Object? lastReadMessageId = _Undefined,
    bool? isDeleted,
  }) {
    return NitChatParticipant(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      chatChannelId: chatChannelId ?? this.chatChannelId,
      lastMessage: lastMessage is String? ? lastMessage : this.lastMessage,
      lastMessageId: lastMessageId is int? ? lastMessageId : this.lastMessageId,
      lastMessageSentAt: lastMessageSentAt is DateTime?
          ? lastMessageSentAt
          : this.lastMessageSentAt,
      unreadCount: unreadCount ?? this.unreadCount,
      lastReadMessageId: lastReadMessageId is int?
          ? lastReadMessageId
          : this.lastReadMessageId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
