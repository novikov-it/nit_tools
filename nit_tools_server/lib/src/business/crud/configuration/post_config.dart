import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class PostConfig<T extends TableRow> {
  const PostConfig({
    this.allowInsert,
    this.allowUpdate,
    this.allowDelete,
    this.beforeInsert,
    this.beforeUpdate,
    this.afterInsert,
    this.afterUpdate,
    this.afterDelete,
  });

  const PostConfig.simple({
    required Future<bool> Function(Session session, T model) allowAllActions,
    this.beforeInsert,
    this.beforeUpdate,
    this.afterInsert,
    this.afterUpdate,
    this.afterDelete,
  })  : allowInsert = allowAllActions,
        allowUpdate = allowAllActions,
        allowDelete = allowAllActions;

  final Future<bool> Function(Session session, T model)? allowInsert;
  final Future<bool> Function(Session session, T model)? allowUpdate;
  final Future<bool> Function(Session session, T model)? allowDelete;

  final Future<T> Function(Session session, T newModel)? beforeInsert;
  final Future<T> Function(Session session, T currentModel, T newModel)?
      beforeUpdate;

  final Future<List<TableRow>> Function(Session session, T insertedModel)?
      afterInsert;
  final Future<List<TableRow>> Function(
      Session session, T initialModel, T updatedModel)? afterUpdate;
  final Future<List<TableRow>> Function(Session session, T model)? afterDelete;

  Future<ApiResponse<int>> upsert(Session session, T model) async {
    final isInsert = model.id == null;
    if (null == (isInsert ? allowInsert : allowUpdate)) {
      return ApiResponse.notConfigured(source: 'обновление $T');
    }

    if (true !=
        await (isInsert ? allowInsert : allowUpdate)?.call(session, model)) {
      return ApiResponse.forbidden();
    }

    final initialModel =
        (isInsert || (afterUpdate == null && beforeUpdate == null))
            ? null
            : await session.db.findById<T>(model.id!);

    final updatedModel = isInsert
        ? await session.db.insertRow<T>(
            beforeInsert == null ? model : await beforeInsert!(session, model))
        : await session.db.updateRow<T>(
            beforeUpdate == null
                ? model
                : await beforeUpdate!(
                    session,
                    initialModel!,
                    model,
                  ),
          );

    final results = <TableRow>[updatedModel];

    if (isInsert && afterInsert != null) {
      results.addAll(
        await afterInsert!(
          session,
          updatedModel,
        ),
      );
    }

    if (!isInsert && afterUpdate != null) {
      results.addAll(
        await afterUpdate!(
          session,
          initialModel!,
          updatedModel,
        ),
      );
    }

    return ApiResponse(
      isOk: true,
      value: updatedModel.id,
      updatedEntities: results
          .map(
            (e) => ObjectWrapper(object: e),
          )
          .toList(),
    );
  }

  Future<ApiResponse<bool>> delete(Session session, int modelId) async {
    final T? model = await session.db.findById<T>(modelId);

    if (model == null) {
      return ApiResponse(
        isOk: true,
        value: true,
        warning: 'Объект не найден, возможно, удален ранее',
      );
    }

    if (allowDelete == null) {
      return ApiResponse.notConfigured(source: 'удаление $T');
    }

    if (true != await allowDelete?.call(session, model)) {
      return ApiResponse.forbidden();
    }

    await session.db.deleteRow(model);

    return ApiResponse(
      isOk: true,
      value: true,
      updatedEntities: [
        if (afterDelete != null)
          ...(await (afterDelete!(session, model))).map(
            (e) => ObjectWrapper(object: e),
          ),
      ],
    );
  }
}
