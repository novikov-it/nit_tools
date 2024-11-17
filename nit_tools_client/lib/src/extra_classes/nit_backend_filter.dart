import 'package:serverpod_client/serverpod_client.dart';

class NitBackendFilter implements SerializableModel {
  const NitBackendFilter({
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

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NitBackendFilter &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.equalsTo, equalsTo) ||
                other.equalsTo == equalsTo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fieldName, equalsTo);
}
