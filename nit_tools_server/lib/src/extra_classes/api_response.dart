import 'package:serverpod/serverpod.dart';

import 'object_wrapper.dart';

class ApiResponse<T> implements SerializableModel {
  static SerializationManagerServer get _protocol =>
      Serverpod.instance.serializationManager;

  const ApiResponse({
    required this.isOk,
    required this.value,
    this.warning,
    this.error,
    this.updatedEntities,
  });

  const ApiResponse.notConfigured({
    required String? source,
  })  : isOk = false,
        value = null,
        error =
            'Действие не поддерживается сервером${source != null ? ' ($source)' : ''}',
        warning = null,
        updatedEntities = null;

  const ApiResponse.forbidden()
      : isOk = false,
        value = null,
        error = 'Недостаточно полномочий',
        warning = null,
        updatedEntities = null;

  final bool isOk;
  final T? value;
  final String? warning;
  final String? error;
  final List<ObjectWrapper>? updatedEntities;

  factory ApiResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ApiResponse(
      isOk: jsonSerialization['isOk'] as bool,
      value: _protocol.deserialize<T>(jsonSerialization['value']),
      warning: jsonSerialization['warning'] as String?,
      error: jsonSerialization['error'] as String?,
      updatedEntities: jsonSerialization['updatedEntities'] == null
          ? null
          : (jsonSerialization['updatedEntities'] as List)
              .map((e) => _protocol.deserialize<ObjectWrapper>(e))
              .toList() as dynamic,
    );
  }

  @override
  toJson() {
    return {
      'isOk': isOk,
      'value': value is SerializableModel
          ? (value as SerializableModel).toJson()
          : value,
      if (warning != null) 'warning': warning,
      if (error != null) 'error': error,
      if (updatedEntities != null)
        'updatedEntities':
            updatedEntities?.toJson(valueToJson: (v) => v.toJson()),
    };
  }
}
