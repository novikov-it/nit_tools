import 'package:serverpod_client/serverpod_client.dart';

class NitBackendFilter implements SerializableModel {
  NitBackendFilter({
    required this.fieldName,
    required this.equalsTo,
  });
  final String fieldName;
  final String equalsTo;

  factory NitBackendFilter.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return NitBackendFilter(
      fieldName: jsonSerialization['fieldName'] as String,
      equalsTo: jsonSerialization['equalsTo'] as String,
    );
  }

  @override
  toJson() {
    return {
      'fieldName': fieldName,
      'equalsTo': equalsTo,
    };
  }
}
