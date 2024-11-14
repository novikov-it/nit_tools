import 'package:serverpod/serverpod.dart';

class ObjectWrapper implements SerializableModel {
  static SerializationManagerServer get _protocol =>
      Serverpod.instance.serializationManager;

  ObjectWrapper({
    required this.object,
    // this.entities,
  }) : className = _protocol.getClassNameForObject(object) ?? 'unknown';

  final String className;
  final TableRow object;
  // final int? id;
  // final List<SerializableModel>? entities;

  factory ObjectWrapper.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ObjectWrapper(
      // id: jsonSerialization['id'],
      object: _protocol.deserializeByClassName(jsonSerialization),
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
      'className': className,
      // 'id': id,
      'data': object.toJson(),
      // if (entities != null)
      //   'entities': entities?.toJson(valueToJson: (v) => v.toJson()),
    };
  }
}
