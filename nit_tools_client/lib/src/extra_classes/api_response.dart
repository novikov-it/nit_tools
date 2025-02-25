import 'package:serverpod_client/serverpod_client.dart';

import 'object_wrapper.dart';
import 'static.dart';

// if (T.toString().startsWith('ApiResponse')) {
//       return _i4.ApiResponse.manualDeserialization<T>(data);
//     }
// if (t == _i1.getType<List<int>>()) {
//   return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
// }

// Code to be pasted into Protocol after serverpod generate
// if (t == List<int>) {
//       return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
//     }

// if (data is Map<String, dynamic>) {
//       final manualDeserialization =
//           _i13.ApiResponse.manualDeserialization<T>(data);
//       if (manualDeserialization != null) return manualDeserialization;
//     }

class ApiResponse<T> implements SerializableModel {
  const ApiResponse({
    required this.isOk,
    required this.value,
    this.warning,
    this.error,
    this.updatedEntities,
  });

  const ApiResponse.notConfigured()
      : isOk = false,
        value = null,
        error = 'Действие не поддерживается сервером',
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

  static K? manualDeserialization<K>(
    Map<String, dynamic> jsonSerialization,
  ) {
    // if (K.toString() == 'ApiResponse<List<int>>') {
    if (K == ApiResponse<List<int>>) {
      return ApiResponse<List<int>>.fromJson(jsonSerialization) as K;
    } else if (K == ApiResponse<int>) {
      return ApiResponse<int>.fromJson(jsonSerialization) as K;
    } else if (K == ApiResponse<bool>) {
      return ApiResponse<bool>.fromJson(jsonSerialization) as K;
    }

    return null;

    // if (T.toString().startsWith('ApiResponse')) {
    // print('Exact option for $K deserialization not configured');
    // throw UnimplementedError();
    // }
  }
  // print(T.toString());

  factory ApiResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    // Type t;
  ) {
    // final t = jsonSerialization['value'];
    // try {
    return ApiResponse(
      isOk: jsonSerialization['isOk'] as bool,
      value: jsonSerialization['value'] == null
          ? null
          : NitToolsClient.protocol.deserialize<T>(jsonSerialization['value']),
      warning: jsonSerialization['warning'] as String?,
      error: jsonSerialization['error'] as String?,
      updatedEntities: jsonSerialization['updatedEntities'] == null
          ? null
          : (jsonSerialization['updatedEntities'] as List)
              .map((e) => NitToolsClient.protocol.deserialize<ObjectWrapper>(e))
              .toList() as dynamic,
    );
    // } catch (e) {
    //   print(e);
    //   return ApiResponse(isOk: false, value: null);
    // }
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
