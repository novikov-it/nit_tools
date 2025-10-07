import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class DwDeleteConfig<T extends TableRow> {
  const DwDeleteConfig({
    this.allowDelete,
    this.afterDelete,
  });

  final Future<bool> Function(Session session, T model)? allowDelete;
  final Future<List<TableRow>> Function(Session session, T model)? afterDelete;

  Future<ApiResponse<bool>> delete(Session session, int modelId) async {
    final T? model = await session.db.findById<T>(modelId);

    if (model == null) {
      return ApiResponse(
        isOk: true,
        value: true,
        warning: 'Model not found, possibly deleted earlier',
      );
    }

    if (allowDelete == null) {
      return ApiResponse.notConfigured(source: 'delete $T');
    }

    if (true != await allowDelete?.call(session, model)) {
      return ApiResponse.forbidden();
    }

    try {
      await session.db.deleteRow(model);
    } on DatabaseException {
      return ApiResponse(
        isOk: false,
        value: false,
        error: 'Cannot delete model because other entities reference it',
      );
    }

    return ApiResponse(
      isOk: true,
      value: true,
      updatedEntities: [
        ObjectWrapper.deleted(object: model),
        if (afterDelete != null)
          ...(await afterDelete!(session, model)).map(
            (e) => ObjectWrapper(object: e),
          ),
      ],
    );
  }
}
