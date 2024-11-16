import 'package:nit_tools_server/src/extra_classes/api_response.dart';
import 'package:serverpod/serverpod.dart';

import '../extra_classes/object_wrapper.dart';

class GetOneConfig<T extends TableRow> {
  const GetOneConfig({
    this.createIfMissing,
  });

  final Future<T?> Function(Session session, int id)? createIfMissing;

  Future<T?> _getObject(Session session, int id) async {
    return await session.db.findById<T>(id) ??
        await createIfMissing?.call(session, id);
  }

  Future<ApiResponse<int>> call(Session session, int id) async =>
      await _getObject(session, id).then(
        (result) => ApiResponse<int>(
          isOk: result != null,
          value: result?.id,
          error: result == null ? 'Объект не найден' : null,
          updatedEntities:
              result != null ? [ObjectWrapper(object: result)] : null,
        ),
      );
}
