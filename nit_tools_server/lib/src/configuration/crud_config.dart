import 'package:nit_tools_server/src/configuration/get_all_config.dart';
import 'package:nit_tools_server/src/configuration/get_one_config.dart';
import 'package:nit_tools_server/src/configuration/post_config.dart';
import 'package:nit_tools_server/src/extra_classes/nit_backend_filter.dart';
import 'package:serverpod/serverpod.dart';

class CrudConfig<T extends TableRow> {
  const CrudConfig({
    required this.table,
    this.getOne,
    this.getAll,
    this.post,
  });

  final Table table;
  final GetOneConfig<T>? getOne;
  final GetAllConfig<T>? getAll;
  final PostConfig<T>? post;

  String get className => T.toString();

  prepareWhere(List<NitBackendFilter>? filters) {
    Expression? where;
    for (var filter in filters ?? []) {
      final c =
          table.columns.firstWhere((col) => col.columnName == filter.fieldName);
      if (c is ColumnInt) {
        final ex = c.equals(int.tryParse(filter.equalsTo));
        if (where == null) {
          where = ex;
        } else {
          where = where & ex;
        }
      }
    }

    if (where == null) return null;

    return where as Expression<T>;
  }
}
