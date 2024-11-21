import 'package:nit_tools_server/src/extra_classes/api_response.dart';
import 'package:serverpod/serverpod.dart';

import '../extra_classes/nit_backend_filter.dart';
import '../extra_classes/object_wrapper.dart';

class GetOneCustomConfig<T extends TableRow> {
  const GetOneCustomConfig({
    required this.attributeNames,
    this.createIfMissing,
  });

  final List<String> attributeNames;
  final Future<T?> Function(Session session, List<String> values)?
      createIfMissing;

  Future<T?> _getObject(
    Session session,
    List<NitBackendFilter> filters,
    Expression? whereClause,
  ) async {
    T? t = await session.db.findFirstRow(where: whereClause);

    if (t == null && createIfMissing != null) {
      t ??= await createIfMissing?.call(
        session,
        attributeNames
            .map((e) => filters.firstWhere((f) => f.fieldName == e).equalsTo)
            .toList(),
      );

      if (t != null) {
        t = await session.db.insertRow<T>(t);
      }
    }

    return t;
  }

  Future<ApiResponse<int>> call(
    Session session,
    List<NitBackendFilter> filters,
    Expression? whereClause,
  ) async {
    final t = await _getObject(session, filters, whereClause).then(
      (result) => ApiResponse<int>(
        isOk: result != null,
        value: result?.id,
        error: result == null ? 'Объект не найден' : null,
        updatedEntities:
            result != null ? [ObjectWrapper(object: result)] : null,
      ),
    );

    return t;
  }
}
