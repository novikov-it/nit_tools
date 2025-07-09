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

  bool filterUpdate(
    Map<String, dynamic> jsonSerialization, {
    bool outerNegate = false,
  }) {
    bool shouldNegate = negate != outerNegate;

    if (type == NitBackendFilterType.and || type == NitBackendFilterType.or) {
      if (children == null || children!.isEmpty) {
        return true; // или другая логика для пустых групп
      }

      // Собираем детей, если нужно - с отрицанием
      final expressions = children!.map(
        (child) => child.filterUpdate(
          jsonSerialization,
          outerNegate: shouldNegate,
        ),
      );

      // Используем OR если фильтр такого типа или если это отрицание AND
      return expressions.reduce((a, b) =>
          shouldNegate != (type == NitBackendFilterType.or) ? a || b : a && b);
    }

    return _valueExpression(
      jsonSerialization,
      negate: shouldNegate,
    );
  }

  bool _isType<T1, T2>(Type t) => t == T1 || t == T2;

  bool _isNullableType(Type t) => _isType<T, T?>(t);

  bool _valueExpression(
    Map<String, dynamic> jsonSerialization, {
    bool negate = false,
  }) {
    // print(T.toString());
    if (T == dynamic) {
      throw Exception(
        'NitBackendFilter<$T>: тип не определён! '
        'Создайте фильтр с явным generic, например NitBackendFilter<int>().',
      );
    }
    final modelValue = NitToolsClient.protocol
        .deserialize<T?>(jsonSerialization['data'][fieldName]);

    if (type == NitBackendFilterType.equals) {
      return negate != (modelValue == fieldValue);
    }

    if (_isNullableType(int)) {
      return negate !=
          switch (type) {
            NitBackendFilterType.greaterThan => fieldValue == null ||
                (modelValue != null &&
                    ((modelValue as int) > (fieldValue as int))),
            NitBackendFilterType.greaterThanOrEquals => fieldValue == null ||
                (modelValue != null &&
                    ((modelValue as int) >= (fieldValue as int))),
            NitBackendFilterType.lessThan => fieldValue == null ||
                (modelValue != null &&
                    ((modelValue as int) < (fieldValue as int))),
            NitBackendFilterType.lessThanOrEquals => fieldValue == null ||
                (modelValue != null &&
                    ((modelValue as int) <= (fieldValue as int))),
            _ => throw Exception('Unsupported filter type'),
          };
    } else if (_isNullableType(double)) {
      return negate !=
          switch (type) {
            NitBackendFilterType.greaterThan => fieldValue == null ||
                (modelValue != null &&
                    ((modelValue as double) > (fieldValue as double))),
            NitBackendFilterType.greaterThanOrEquals => fieldValue == null ||
                (modelValue != null &&
                    ((modelValue as double) >= (fieldValue as double))),
            NitBackendFilterType.lessThan => fieldValue == null ||
                (modelValue != null &&
                    ((modelValue as double) < (fieldValue as double))),
            NitBackendFilterType.lessThanOrEquals => fieldValue == null ||
                (modelValue != null &&
                    ((modelValue as double) <= (fieldValue as double))),
            _ => throw Exception('Unsupported filter type'),
          };
    } else if (_isNullableType(DateTime)) {
      return negate !=
          switch (type) {
            NitBackendFilterType.greaterThan => fieldValue == null ||
                (modelValue != null &&
                    ((modelValue as DateTime)
                        .isAfter((fieldValue as DateTime)))),
            NitBackendFilterType.greaterThanOrEquals => fieldValue == null ||
                (modelValue != null &&
                    (modelValue == fieldValue ||
                        ((modelValue as DateTime)
                            .isAfter((fieldValue as DateTime))))),
            NitBackendFilterType.lessThan => fieldValue == null ||
                (modelValue != null &&
                    ((modelValue as DateTime)
                        .isBefore((fieldValue as DateTime)))),
            NitBackendFilterType.lessThanOrEquals => fieldValue == null ||
                (modelValue != null &&
                    (modelValue == fieldValue ||
                        ((modelValue as DateTime)
                            .isBefore((fieldValue as DateTime))))),
            _ => throw Exception('Unsupported filter type'),
          };
    } else if (_isNullableType(String)) {
      return negate !=
          switch (type) {
            NitBackendFilterType.ilike => fieldValue == null ||
                (modelValue != null &&
                    _ilikeMatch(modelValue as String, fieldValue as String)),
            _ => throw Exception('Unsupported filter type'),
          };
    }

    throw Exception('Unsupported filter type');
  }

  bool _ilikeMatch(String value, String pattern) {
    // Экранируем спецсимволы в RegExp, кроме % и _
    String escaped = RegExp.escape(pattern)
        .replaceAll('%', '<<<PERCENT>>>') // временные метки
        .replaceAll('_', '<<<UNDERSCORE>>>');

    // Преобразуем % и _ в шаблоны RegExp
    String regexPattern = escaped
        .replaceAll('<<<PERCENT>>>', '.*') // % → .*
        .replaceAll('<<<UNDERSCORE>>>', '.'); // _ → .

    // Добавляем начало и конец строки для точного совпадения
    RegExp regex =
        RegExp('^$regexPattern\$', caseSensitive: false, dotAll: true);

    return regex.hasMatch(value);
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
