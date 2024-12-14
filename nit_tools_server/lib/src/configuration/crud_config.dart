import 'package:nit_tools_server/src/configuration/get_all_config.dart';
import 'package:nit_tools_server/src/configuration/get_one_by_id.dart';
import 'package:nit_tools_server/src/configuration/get_one_custom.dart';
import 'package:nit_tools_server/src/configuration/post_config.dart';
import 'package:serverpod/serverpod.dart';

import '../extra_classes/nit_backend_filter.dart';

class CrudConfig<T extends TableRow> {
  const CrudConfig({
    required this.table,
    this.getOneById,
    this.getOneCustomConfigs,
    this.getAll,
    this.post,
  });

  final Table table;
  final GetOneByIdConfig<T>? getOneById;
  final List<GetOneCustomConfig<T>>? getOneCustomConfigs;

  final GetAllConfig<T>? getAll;
  final PostConfig<T>? post;

  String get className => T.toString();

  prepareWhere(List<NitBackendFilter>? filters) {
    if (filters == null) return null;
    Expression? where;
    for (var filter in filters) {
      print(filter.fieldName);
      final c =
          table.columns.firstWhere((col) => col.columnName == filter.fieldName);
      var ex = null;
      if (c is ColumnInt) {
        ex = c.equals(int.tryParse(filter.equalsTo));
      } else if (c is ColumnString) {
        ex = c.equals(filter.equalsTo);
      } else if (c is ColumnBool) {
        ex = c.equals(switch (filter.equalsTo) {
          'true' => true,
          'false' => false,
          _ => null,
        });
      }
      if (ex != null) {
        if (where == null) {
          where = ex;
        } else {
          where = where & ex;
        }
      }
    }

    if (where == null) return null;

    return where; // as Expression<T>;
  }
}
