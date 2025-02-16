import 'package:serverpod/serverpod.dart';

class ObjectWrapper implements SerializableModel {
  static SerializationManagerServer get _protocol =>
      Serverpod.instance.serializationManager;

  static ObjectWrapper? wrap(TableRow? object) =>
      object != null ? ObjectWrapper(object: object) : null;

  ObjectWrapper({
    required this.object,
  }) : className = _protocol.getClassNameForObject(object) ?? 'unknown';

  final String className;
  final TableRow object;

  String get nitMappingClassname => className.split('.').last;

  factory ObjectWrapper.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ObjectWrapper(
      object: _protocol.deserializeByClassName(jsonSerialization),
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
