import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class NitBackendFilter implements SerializableModel {
  const NitBackendFilter._({
    required this.fieldName,
    required this.type,
    required this.fieldValue,
    required this.children,
    required this.negate,
    // required this.child,
  });

  final NitBackendFilterType type;
  final String? fieldName;
  final String? fieldValue;
  final List<NitBackendFilter>? children;
  final bool negate;
  // final NitBackendFilter? child;

  const NitBackendFilter.andPrototype({
    required this.children,
    this.negate = false,
  })  : fieldName = null,
        type = NitBackendFilterType.and,
        fieldValue = null;

  const NitBackendFilter.orPrototype({
    required this.children,
    this.negate = false,
  })  : fieldName = null,
        type = NitBackendFilterType.or,
        fieldValue = null;

  const NitBackendFilter.equalsPrototype({
    required this.fieldName,
    this.negate = false,
  })  : type = NitBackendFilterType.equals,
        fieldValue = null,
        children = null;

  factory NitBackendFilter.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return NitBackendFilter._(
      fieldName: jsonSerialization['fieldName'] as String?,
      type:
          NitBackendFilterType.fromJson((jsonSerialization['type'] as String)),
      fieldValue: jsonSerialization['fieldValue'] as String?,
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

  Map<String, dynamic> get attributeMap => {
        '${negate ? 'not ' : ''}${type.name}': switch (type) {
          NitBackendFilterType.and || NitBackendFilterType.or => [
              if (children != null) ...children!.map((e) => e.attributeMap),
            ],
          _ => fieldName,
        }
      };

  Expression prepareWhere(
    Table table, {
    bool outerNegate = false,
  }) {
    bool shouldNegate = negate != outerNegate;

    if (type == NitBackendFilterType.and || type == NitBackendFilterType.or) {
      if (children == null || children!.isEmpty) {
        return Constant.bool(true); // или другая логика для пустых групп
      }

      // Собираем детей, если нужно - с отрицанием
      final expressions = children!
          .map((child) => child.prepareWhere(table, outerNegate: shouldNegate));

      // Используем OR если фильтр такого типа или если это отрицание AND
      return expressions.reduce((a, b) =>
          shouldNegate != (type == NitBackendFilterType.or) ? a | b : a & b);
    }

    return _valueExpression(
      table,
      negate: shouldNegate,
    );
  }

  _valueExpression(
    Table table, {
    bool negate = false,
  }) {
    final column =
        table.columns.firstWhere((col) => col.columnName == fieldName);

    if (column is ColumnInt) {
      return (switch (type) {
        NitBackendFilterType.equals =>
          negate ? column.notEquals : column.equals,
        _ => throw Exception('Unsupported filter type'),
      })
          .call(
        fieldValue == null
            ? null
            : int.tryParse(
                fieldValue!,
              ),
      );
    } else if (column is ColumnString) {
      return (switch (type) {
        NitBackendFilterType.equals =>
          negate ? column.notEquals : column.equals,
        _ => throw Exception('Unsupported filter type'),
      })
          .call(
        fieldValue,
      );
    } else if (column is ColumnBool) {
      return (switch (type) {
        NitBackendFilterType.equals =>
          negate ? column.notEquals : column.equals,
        _ => throw Exception('Unsupported filter type'),
      })
          .call(
        fieldValue == null ? null : bool.tryParse(fieldValue!),
      );
    }
    // else if (column is ColumnEnum) {
    //   return (switch (type) {
    //     NitBackendFilterType.equals => column.,
    //     NitBackendFilterType.notEquals => column.notEquals,
    //     _ => throw Exception('Unsupported filter type'),
    //   })
    //       .call(
    //     fieldValue == null ? null : bool.tryParse(fieldValue!),
    //   );
    // }
    return null;
  }
}
