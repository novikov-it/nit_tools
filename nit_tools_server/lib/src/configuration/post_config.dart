import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:nit_tools_server/src/extra_classes/api_response.dart';
import 'package:serverpod/serverpod.dart';

class PostConfig<T extends TableRow> {
  const PostConfig({
    this.allowInsert,
    this.allowUpdate,
    this.allowDelete,
  });

  const PostConfig.simple({
    required Future<bool> Function(Session session, T model) allowAllActions,
  })  : allowInsert = allowAllActions,
        allowUpdate = allowAllActions,
        allowDelete = allowAllActions;

  final Future<bool> Function(Session session, T model)? allowInsert;
  final Future<bool> Function(Session session, T model)? allowUpdate;
  final Future<bool> Function(Session session, T model)? allowDelete;

  Future<ApiResponse<int>> upsert(Session session, T model) async {
    if (null == (model.id == null ? allowInsert : allowUpdate)) {
      return ApiResponse.notConfigured();
    }

    if (true !=
        await (model.id == null ? allowInsert : allowUpdate)
            ?.call(session, model)) {
      return ApiResponse.forbidden();
    }

    final updatedModel = model.id == null
        ? await session.db.insertRow<T>(model)
        : await session.db.updateRow<T>(model);

    return ApiResponse(isOk: true, value: updatedModel.id, updatedEntities: [
      ObjectWrapper(
        object: updatedModel,
      ),
    ]);
  }

  Future<ApiResponse<bool>> delete(Session session, T model) async {
    if (model.id == null) return ApiResponse(isOk: true, value: true);

    if (allowDelete == null) {
      return ApiResponse.notConfigured();
    }

    if (true != await allowDelete?.call(session, model)) {
      return ApiResponse.forbidden();
    }

    try {
      await session.db.deleteRow(model);

      return ApiResponse(
        isOk: true,
        value: true,
      );
    } on DatabaseException {
      return ApiResponse(
        isOk: true,
        value: true,
        warning: 'Сущность была удалена ранее',
      );
    }
  }
}
