/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum NitBackendFilterType implements _i1.SerializableModel {
  equals,
  greaterThan,
  greaterThanOrEquals,
  lessThan,
  lessThanOrEquals,
  like,
  ilike,
  inSet,
  and,
  or;

  static NitBackendFilterType fromJson(String name) {
    switch (name) {
      case 'equals':
        return equals;
      case 'greaterThan':
        return greaterThan;
      case 'greaterThanOrEquals':
        return greaterThanOrEquals;
      case 'lessThan':
        return lessThan;
      case 'lessThanOrEquals':
        return lessThanOrEquals;
      case 'like':
        return like;
      case 'ilike':
        return ilike;
      case 'inSet':
        return inSet;
      case 'and':
        return and;
      case 'or':
        return or;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "NitBackendFilterType"');
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
