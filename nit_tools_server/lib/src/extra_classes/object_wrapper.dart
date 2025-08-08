import 'package:serverpod/serverpod.dart';

class ObjectWrapper implements SerializableModel, ProtocolSerialization {
  static SerializationManagerServer get _protocol =>
      Serverpod.instance.serializationManager;

  static ObjectWrapper? wrap(TableRow? object) =>
      object != null ? ObjectWrapper(object: object) : null;

  static List<ObjectWrapper> wrapMany(List<TableRow?> objects) => objects
      .where((e) => e != null)
      .map((object) => ObjectWrapper(object: object!))
      .toList();

  ObjectWrapper({
    required this.object,
  })  : modelId = object.id,
        className = _protocol.getClassNameForObject(object) ?? 'unknown',
        isDeleted = false;

  ObjectWrapper.deleted({
    required this.object,
  })  : modelId = object.id,
        className = _protocol.getClassNameForObject(object) ?? 'unknown',
        isDeleted = true;

  final String className;
  final TableRow object;
  final bool isDeleted;
  final int? modelId;

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
      'data': object.toJson(),
      'isDeleted': isDeleted,
      'modelId': modelId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'className': className,
      'data': object.toJson(),
      'isDeleted': isDeleted,
      'modelId': modelId,
    };
  }

  ObjectWrapper copyWith({
    TableRow? object,
  }) {
    return ObjectWrapper(
      object: object ?? this.object,
    );
  }
}
