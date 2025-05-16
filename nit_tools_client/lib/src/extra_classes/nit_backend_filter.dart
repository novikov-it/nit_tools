import 'package:nit_tools_client/nit_tools_client.dart';

class NitBackendFilter<T> implements SerializableModel {
  const NitBackendFilter._({
    required this.fieldName,
    required this.type,
    required this.fieldValue,
    required this.children,
    bool? negate,
  }) : negate = negate ?? false;

  final String? fieldName;
  final NitBackendFilterType type;
  final T? fieldValue;
  final List<NitBackendFilter>? children;
  final bool negate;

  const NitBackendFilter.and({
    required this.children,
    this.negate = false,
  })  : fieldName = null,
        type = NitBackendFilterType.and,
        fieldValue = null;

  const NitBackendFilter.or({
    required this.children,
    this.negate = false,
  })  : fieldName = null,
        type = NitBackendFilterType.or,
        fieldValue = null;

  const NitBackendFilter.equals({
    required this.fieldName,
    required T? equalsTo,
    this.negate = false,
  })  : type = NitBackendFilterType.equals,
        fieldValue = equalsTo,
        children = null;

  factory NitBackendFilter.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return NitBackendFilter._(
      fieldName: jsonSerialization['fieldName'] as String,
      type:
          NitBackendFilterType.fromJson((jsonSerialization['type'] as String)),
      fieldValue: jsonSerialization['fieldValue'] as T?,
      children: jsonSerialization['children'] == null
          ? null
          : (jsonSerialization['children'] as List)
              .map((e) => NitBackendFilter.fromJson(e))
              .toList() as dynamic,
      negate: jsonSerialization['negate'] as bool,
      // child: jsonSerialization['child'] == null
      //     ? null
      //     : NitBackendFilter.fromJson(
      //         jsonSerialization['child'],
      //       ),
    );
  }

  @override
  toJson() {
    return {
      'type': type.toJson(),
      if (fieldName != null) 'fieldName': fieldName,
      if (fieldValue != null) 'fieldValue': fieldValue.toString(),
      if (children != null) 'children': [...children!.map((e) => e.toJson())],
      'negate': negate,
      // if (child != null) 'child': child!.toJson(),
    };
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
                other is NitBackendFilter &&
                (identical(other.fieldName, fieldName) ||
                    other.fieldName == fieldName) &&
                (identical(other.type, type) || other.type == type)) &&
            (identical(other.fieldValue, fieldValue) ||
                other.fieldValue == fieldValue) &&
            (identical(other.children, children) ||
                other.children == children) &&
            (identical(other.negate, negate) || other.negate == negate);
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, fieldName, type, fieldValue, children, negate);
}
