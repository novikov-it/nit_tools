import 'package:serverpod_client/serverpod_client.dart';

import 'static.dart';

class ObjectWrapper implements SerializableModel, ProtocolSerialization {
  static String getClassNameForObject(SerializableModel model) {
    return NitToolsClient.protocol.getClassNameForObject(model) ?? 'unknown';
  }

  ObjectWrapper.wrap({
    required this.model,
  })  : modelId = null,
        this.foreignKeys = {},
        className =
            NitToolsClient.protocol.getClassNameForObject(model) ?? 'unknown',
        isDeleted = false,
        jsonSerialization = {
          'className': NitToolsClient.protocol.getClassNameForObject(model),
          'data': model.toJson(),
        };

  ObjectWrapper._({
    required this.model,
    required this.modelId,
    required this.foreignKeys,
    required this.isDeleted,
    required this.jsonSerialization,
  }) : className =
            NitToolsClient.protocol.getClassNameForObject(model) ?? 'unknown';

  final String className;
  final SerializableModel model;
  final Map<String, int> foreignKeys;
  final int? modelId;
  final bool isDeleted;
  final Map<String, dynamic> jsonSerialization;

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
      isDeleted: jsonSerialization['isDeleted'] ?? false,
      jsonSerialization: jsonSerialization,
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

  /// Необходим для работы методов copyWith в ChatInitialData и NitAppNotification
  ObjectWrapper copyWith({
    SerializableModel? model,
  }) {
    return ObjectWrapper.wrap(
      model: model ?? this.model,
    );
  }
}
