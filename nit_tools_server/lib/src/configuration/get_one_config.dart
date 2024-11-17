import 'package:nit_tools_server/src/extra_classes/api_response.dart';
import 'package:serverpod/serverpod.dart';

import '../extra_classes/object_wrapper.dart';

class GetOneConfig<T extends TableRow> {
  const GetOneConfig({
    this.createIfMissing,
    this.customAttribute,
  });

  final Future<T?> Function(Session session, int id)? createIfMissing;
  final String? customAttribute;

  Future<T?> _getObject(
    Session session,
    int id, {
    Expression? whereClause,
  }) async {
    T? t = whereClause == null
        ? await session.db.findById<T>(id)
        : await session.db.findFirstRow(where: whereClause);

    if (t == null && createIfMissing != null) {
      t ??= await createIfMissing?.call(session, id);

      if (t != null) {
        t = await session.db.insertRow<T>(t);
      }
    }

    return t;
  }

  Future<ApiResponse<int>> call(
    Session session,
    int id, {
    Expression? whereClause,
  }) async {
    final t = await _getObject(session, id, whereClause: whereClause).then(
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
