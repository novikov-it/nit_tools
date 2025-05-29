import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nit_tools_client/nit_tools_client.dart';

class NitBackendFilter<T> implements SerializableModel {
  static final _listEquality = DeepCollectionEquality();

  static String getClassNameForObject(Object? object) {
    return NitToolsClient.protocol.getClassNameForObject(object) ?? 'unknown';
  }

  const NitBackendFilter._({
    required this.type,
    required this.fieldName,
    required this.fieldValue,
    required this.children,
    bool? negate,
  }) : negate = negate ?? false;

  final String? fieldName;
  final NitBackendFilterType type;
  final T? fieldValue;
  final List<NitBackendFilter>? children;
  final bool negate;

  const NitBackendFilter.and(
    this.children, {
    this.negate = false,
  })  : fieldName = null,
        type = NitBackendFilterType.and,
        fieldValue = null;

  const NitBackendFilter.or(
    this.children, {
    this.negate = false,
  })  : fieldName = null,
        type = NitBackendFilterType.or,
        fieldValue = null;

  const NitBackendFilter.value({
    required this.type,
    this.fieldName,
    required this.fieldValue,
    this.negate = false,
  }) : children = null;

  factory NitBackendFilter.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return NitBackendFilter._(
      type: NitBackendFilterType.fromJson(
        (jsonSerialization['type'] as String),
      ),
      fieldName: jsonSerialization['fieldName'] as String,
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
      'valueClassName': getClassNameForObject(fieldValue),
      if (fieldName != null) 'fieldName': fieldName,
      if (fieldValue != null) 'fieldValue': fieldValue,
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
            (identical(other.type, type) || other.type == type) &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.fieldValue, fieldValue) ||
                other.fieldValue == fieldValue) &&
            _listEquality.equals(other.children, children) &&
            (identical(other.negate, negate) || other.negate == negate));
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        type,
        fieldName,
        fieldValue,
        _listEquality.hash(children),
        negate,
      );
}
