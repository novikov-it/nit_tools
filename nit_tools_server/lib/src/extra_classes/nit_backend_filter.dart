import 'package:collection/collection.dart';
import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class NitBackendFilter implements SerializableModel {
  static final _listEquality = DeepCollectionEquality();
  static SerializationManagerServer get _protocol =>
      Serverpod.instance.serializationManager;

  const NitBackendFilter._({
    required this.type,
    required this.fieldName,
    required this.valueClassName,
    required this.fieldValue,
    required this.children,
    required this.negate,
  });

  final NitBackendFilterType type;
  final String? fieldName;
  final String valueClassName;
  final dynamic fieldValue;
  final List<NitBackendFilter>? children;
  final bool negate;
  // final NitBackendFilter? child;

  NitBackendFilter.andPrototype({
    required this.children,
    this.negate = false,
  })  : type = NitBackendFilterType.and,
        fieldName = null,
        valueClassName = 'List',
        fieldValue = null;

  NitBackendFilter.orPrototype({
    required this.children,
    this.negate = false,
  })  : type = NitBackendFilterType.or,
        fieldName = null,
        valueClassName = 'List',
        fieldValue = null;

  NitBackendFilter.equalsPrototype({
    required this.fieldName,
    this.negate = false,
  })  : type = NitBackendFilterType.equals,
        valueClassName = Serverpod.instance.serializationManager
                .getClassNameForObject(null) ??
            'unknown',
        fieldValue = null,
        children = null;

  factory NitBackendFilter.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return NitBackendFilter._(
      fieldName: jsonSerialization['fieldName'] as String?,
      type:
          NitBackendFilterType.fromJson((jsonSerialization['type'] as String)),
      valueClassName: jsonSerialization['valueClassName'],
      fieldValue: jsonSerialization['fieldValue'] == null
          ? null
          : _protocol.deserializeByClassName(
              {
                'className': jsonSerialization['valueClassName'],
                'data': jsonSerialization['fieldValue'],
              },
            ),
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
      'valueClassName': valueClassName,
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
            (identical(other.type, type) || other.type == type) &&
            (identical(other.valueClassName, valueClassName) ||
                other.valueClassName == valueClassName) &&
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
        valueClassName,
        fieldName,
        fieldValue,
        _listEquality.hash(children),
        negate,
      );

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

    if (column is ColumnInt && fieldValue is int?) {
      // if (type == NitBackendFilterType.inSet) {
      //   if (fieldValue == null || fieldValue!.isEmpty) {
      //     return Constant.bool(true);
      //   }

      //   return (negate ? column.notInSet : column.inSet).call(
      //     Set.from(
      //       fieldValue!.split(',').map((e) => int.tryParse(e)).where(
      //             (e) => e != null,
      //           ),
      //     ),
      //   );
      // }

      // final t = fieldValue as int?;

      // fieldValue == null
      //     ? null
      //     : int.tryParse(
      //         fieldValue!,
      //       );

      return switch (type) {
        NitBackendFilterType.equals =>
          (negate ? column.notEquals : column.equals).call(fieldValue),
        NitBackendFilterType.greaterThan =>
          negate ? column <= fieldValue : column > fieldValue,
        NitBackendFilterType.greaterThanOrEquals =>
          negate ? column < fieldValue : column >= fieldValue,
        NitBackendFilterType.lessThan =>
          negate ? column >= fieldValue : column < fieldValue,
        NitBackendFilterType.lessThanOrEquals =>
          negate ? column > fieldValue : column <= fieldValue,
        _ => throw Exception('Unsupported filter type'),
      };
    } else if (column is ColumnDouble && fieldValue is double?) {
      // if (type == NitBackendFilterType.inSet) {
      //   if (fieldValue == null || fieldValue!.isEmpty) {
      //     return Constant.bool(true);
      //   }

      //   return (negate ? column.notInSet : column.inSet).call(
      //     Set.from(
      //       fieldValue!.split(',').map((e) => int.tryParse(e)).where(
      //             (e) => e != null,
      //           ),
      //     ),
      //   );
      // }

      // final t = fieldValue as int?;

      // fieldValue == null
      //     ? null
      //     : int.tryParse(
      //         fieldValue!,
      //       );

      return switch (type) {
        NitBackendFilterType.equals =>
          (negate ? column.notEquals : column.equals).call(fieldValue),
        NitBackendFilterType.greaterThan =>
          negate ? column <= fieldValue : column > fieldValue,
        NitBackendFilterType.greaterThanOrEquals =>
          negate ? column < fieldValue : column >= fieldValue,
        NitBackendFilterType.lessThan =>
          negate ? column >= fieldValue : column < fieldValue,
        NitBackendFilterType.lessThanOrEquals =>
          negate ? column > fieldValue : column <= fieldValue,
        _ => throw Exception('Unsupported filter type'),
      };
    } else if (column is ColumnDateTime && fieldValue is DateTime?) {
      return switch (type) {
        NitBackendFilterType.equals =>
          (negate ? column.notEquals : column.equals).call(fieldValue),
        NitBackendFilterType.greaterThan =>
          negate ? column <= fieldValue : column > fieldValue,
        NitBackendFilterType.greaterThanOrEquals =>
          negate ? column < fieldValue : column >= fieldValue,
        NitBackendFilterType.lessThan =>
          negate ? column >= fieldValue : column < fieldValue,
        NitBackendFilterType.lessThanOrEquals =>
          negate ? column > fieldValue : column <= fieldValue,
        _ => throw Exception('Unsupported filter type'),
      };
    } else if (column is ColumnString && fieldValue is String?) {
      // if (type == NitBackendFilterType.inSet) {
      //   if (fieldValue == null || fieldValue!.isEmpty) {
      //     return Constant.bool(true);
      //   }

      //   return (negate ? column.notInSet : column.inSet).call(
      //     Set.from(
      //       fieldValue!.split(','),
      //     ),
      //   );
      // }

      return switch (type) {
        NitBackendFilterType.equals =>
          (negate ? column.notEquals : column.equals).call(fieldValue),
        NitBackendFilterType.ilike =>
          (negate ? column.notIlike : column.ilike).call(fieldValue),
        _ => throw Exception('Unsupported filter type'),
      };
    } else if (column is ColumnBool && fieldValue is bool?) {
      // if (type == NitBackendFilterType.inSet) {
      //   if (fieldValue == null) {
      //     return Constant.bool(true);
      //   }

      //   return (negate ? column.notInSet : column.inSet).call(
      //     Set.from(
      //       fieldValue!.split(',').map((e) => bool.tryParse(e)).where(
      //             (e) => e != null,
      //           ),
      //     ),
      //   );
      // }

      return switch (type) {
        NitBackendFilterType.equals =>
          (negate ? column.notEquals : column.equals).call(fieldValue),
        _ => throw Exception('Unsupported filter type'),
      };
    } else if (column is ColumnEnum) {
      // if (type == NitBackendFilterType.inSet) {
      //   if (fieldValue == null || fieldValue!.isEmpty) {
      //     return Constant.bool(true);
      //   }

      //   return (negate ? column.notInSet : column.inSet).call(
      //     Set.from(
      //       fieldValue!.split(',').map((e) => int.tryParse(e)).where(
      //             (e) => e != null,
      //           ),
      //     ),
      //   );
      // }

      // final t = fieldValue == null
      //     ? null
      //     : int.tryParse(
      //         fieldValue!,
      //       );

      return switch (type) {
        NitBackendFilterType.equals =>
          negate ? column.notEquals : column.equals,
        _ => throw Exception('Unsupported filter type'),
      }
          .call(
        fieldValue,
      );
    }
    throw Exception('Unsupported filter type');
  }
}

// extension Ext<T extends Enum> on ColumnEnum<T> {

//   T valueFromString(String value) =>

// }
