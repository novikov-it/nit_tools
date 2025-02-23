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

abstract class NitChatChannel implements _i1.SerializableModel {
  NitChatChannel._({
    this.id,
    required this.channel,
  });

  factory NitChatChannel({
    int? id,
    required String channel,
  }) = _NitChatChannelImpl;

  factory NitChatChannel.fromJson(Map<String, dynamic> jsonSerialization) {
    return NitChatChannel(
      id: jsonSerialization['id'] as int?,
      channel: jsonSerialization['channel'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String channel;

  NitChatChannel copyWith({
    int? id,
    String? channel,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'channel': channel,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NitChatChannelImpl extends NitChatChannel {
  _NitChatChannelImpl({
    int? id,
    required String channel,
  }) : super._(
          id: id,
          channel: channel,
        );

  @override
  NitChatChannel copyWith({
    Object? id = _Undefined,
    String? channel,
  }) {
    return NitChatChannel(
      id: id is int? ? id : this.id,
      channel: channel ?? this.channel,
    );
  }
}
