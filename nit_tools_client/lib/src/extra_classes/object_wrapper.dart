import 'package:serverpod_client/serverpod_client.dart';

import 'static.dart';

class ObjectWrapper implements SerializableModel {
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
    // this.entities,
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
      // value: jsonSerialization['value'] as T,
      // warning: jsonSerialization['warning'] as String,
      // error: jsonSerialization['error'] as String,
      // entities: (jsonSerialization['entities'] as List)
      //         .map((e) => T.fromJson((e as Map<String, dynamic>)))
      //         .toList(),
    );
  }

  @override
  toJson() {
    return {
      'className': NitToolsClient.protocol.getClassNameForObject(model),
      'data': model.toJson(),
      // if (entities != null)
      //   'entities': entities?.toJson(valueToJson: (v) => v.toJson()),
    };
  }
}
