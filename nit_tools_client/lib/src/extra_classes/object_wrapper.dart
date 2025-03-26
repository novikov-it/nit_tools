import 'package:serverpod_client/serverpod_client.dart';

import 'static.dart';

class ObjectWrapper implements SerializableModel, ProtocolSerialization {
  ObjectWrapper.wrap({
    required this.model,
  })  : modelId = null,
        this.foreignKeys = {},
        className =
            NitToolsClient.protocol.getClassNameForObject(model) ?? 'unknown';

  ObjectWrapper._({
    required this.model,
    required this.modelId,
    required this.foreignKeys,
  }) : className =
            NitToolsClient.protocol.getClassNameForObject(model) ?? 'unknown';

  final String className;
  final SerializableModel model;
  final Map<String, int> foreignKeys;
  final int? modelId;
  // final List<SerializableModel>? entities;

  String get nitMappingClassname => className.split('.').last;

  factory ObjectWrapper.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    final foreignKeys = <String, int>{};

    for (var key in (jsonSerialization['data'] as Map<String, dynamic>).keys) {
      if (key.substring(key.length - 2) == 'Id' &&
          jsonSerialization['data'][key] is int) {
        foreignKeys[key] = jsonSerialization['data'][key] as int;
      }
    }

    return ObjectWrapper._(
      modelId: jsonSerialization['data']['id'],
      foreignKeys: foreignKeys,
      model: NitToolsClient.protocol.deserializeByClassName(jsonSerialization),
    );
  }

  @override
  toJson() {
    return {
      'className': NitToolsClient.protocol.getClassNameForObject(model),
      'data': model.toJson(),
    };
  }

  @override
  toJsonForProtocol() {
    return {
      'className': NitToolsClient.protocol.getClassNameForObject(model),
      'data': model.toJson(),
    };
  }

  ObjectWrapper copyWith({
    SerializableModel? model,
  }) {
    return ObjectWrapper.wrap(
      model: model ?? this.model,
    );
  }
}
