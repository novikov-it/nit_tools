import 'static.dart';
import 'package:serverpod_client/serverpod_client.dart';

class ObjectWrapper implements SerializableModel {
  ObjectWrapper.wrap({
    required this.model,
  })  : modelId = null,
        className =
            NitToolsClient.protocol.getClassNameForObject(model) ?? 'unknown';

  ObjectWrapper._({
    required this.model,
    this.modelId,
    // this.entities,
  }) : className =
            NitToolsClient.protocol.getClassNameForObject(model) ?? 'unknown';

  final String className;
  final SerializableModel model;
  final int? modelId;
  // final List<SerializableModel>? entities;

  String get nitMappingClassname => className.split('.').last;

  factory ObjectWrapper.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ObjectWrapper._(
      modelId: jsonSerialization['data']['id'],
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
