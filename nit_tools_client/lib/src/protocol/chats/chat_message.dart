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

abstract class NitChatMessage implements _i1.SerializableModel {
  NitChatMessage._({
    this.id,
    required this.userId,
    required this.chatChannelId,
    required this.sentAt,
    this.text,
    this.attachmentIds,
    this.customMessageType,
  });

  factory NitChatMessage({
    int? id,
    required int userId,
    required int chatChannelId,
    required DateTime sentAt,
    String? text,
    List<int>? attachmentIds,
    _i2.CustomMessageType? customMessageType,
  }) = _NitChatMessageImpl;

  factory NitChatMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitChatMessage(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      chatChannelId: jsonSerialization['chatChannelId'] as int,
      sentAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sentAt']),
      text: jsonSerialization['text'] as String?,
      attachmentIds: (jsonSerialization['attachmentIds'] as List?)
          ?.map((e) => e as int)
          .toList(),
      customMessageType: jsonSerialization['customMessageType'] == null
          ? null
          : _i2.CustomMessageType.fromJson(
              (jsonSerialization['customMessageType'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int chatChannelId;

  DateTime sentAt;

  String? text;

  List<int>? attachmentIds;

  _i2.CustomMessageType? customMessageType;

  NitChatMessage copyWith({
    int? id,
    int? userId,
    int? chatChannelId,
    DateTime? sentAt,
    String? text,
    List<int>? attachmentIds,
    _i2.CustomMessageType? customMessageType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'chatChannelId': chatChannelId,
      'sentAt': sentAt.toJson(),
      if (text != null) 'text': text,
      if (attachmentIds != null) 'attachmentIds': attachmentIds?.toJson(),
      if (customMessageType != null)
        'customMessageType': customMessageType?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NitChatMessageImpl extends NitChatMessage {
  _NitChatMessageImpl({
    int? id,
    required int userId,
    required int chatChannelId,
    required DateTime sentAt,
    String? text,
    List<int>? attachmentIds,
    _i2.CustomMessageType? customMessageType,
  }) : super._(
          id: id,
          userId: userId,
          chatChannelId: chatChannelId,
          sentAt: sentAt,
          text: text,
          attachmentIds: attachmentIds,
          customMessageType: customMessageType,
        );

  @override
  NitChatMessage copyWith({
    Object? id = _Undefined,
    int? userId,
    int? chatChannelId,
    DateTime? sentAt,
    Object? text = _Undefined,
    Object? attachmentIds = _Undefined,
    Object? customMessageType = _Undefined,
  }) {
    return NitChatMessage(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      chatChannelId: chatChannelId ?? this.chatChannelId,
      sentAt: sentAt ?? this.sentAt,
      text: text is String? ? text : this.text,
      attachmentIds: attachmentIds is List<int>?
          ? attachmentIds
          : this.attachmentIds?.map((e0) => e0).toList(),
      customMessageType: customMessageType is _i2.CustomMessageType?
          ? customMessageType
          : this.customMessageType?.copyWith(),
    );
  }
}
