import 'package:serverpod/serverpod.dart';

import '../extra_classes/api_response.dart';
import '../extra_classes/object_wrapper.dart';

class PostConfig<T extends TableRow> {
  const PostConfig({
    this.allowInsert,
    this.allowUpdate,
    this.allowDelete,
    this.afterInsert,
    this.afterUpdate,
    this.afterDelete,
    this.callAfterUpdateOnInsert = true,
  });

  const PostConfig.simple({
    required Future<bool> Function(Session session, T model) allowAllActions,
  })  : allowInsert = allowAllActions,
        allowUpdate = allowAllActions,
        allowDelete = allowAllActions,
        afterInsert = null,
        afterUpdate = null,
        afterDelete = null,
        callAfterUpdateOnInsert = true;

  final Future<bool> Function(Session session, T model)? allowInsert;
  final Future<bool> Function(Session session, T model)? allowUpdate;
  final Future<bool> Function(Session session, T model)? allowDelete;

  final Future<List<TableRow>> Function(Session session, T insertedModel)?
      afterInsert;
  final bool callAfterUpdateOnInsert;
  final Future<List<TableRow>> Function(Session session, T updatedModel)?
      afterUpdate;
  final Future<List<TableRow>> Function(Session session, T model)? afterDelete;

  Future<ApiResponse<int>> upsert(Session session, T model) async {
    final isInsert = model.id == null;
    if (null == (isInsert ? allowInsert : allowUpdate)) {
      return ApiResponse.notConfigured();
    }

    if (true !=
        await (isInsert ? allowInsert : allowUpdate)?.call(session, model)) {
      return ApiResponse.forbidden();
    }

    final updatedModel = isInsert
        ? await session.db.insertRow<T>(model)
        : await session.db.updateRow<T>(model);

    return ApiResponse(isOk: true, value: updatedModel.id, updatedEntities: [
      ObjectWrapper(
        object: updatedModel,
      ),
      if (isInsert && afterInsert != null)
        ...(await (afterInsert!(session, updatedModel))).map(
          (e) => ObjectWrapper(object: e),
        ),
      if ((!isInsert || callAfterUpdateOnInsert) && afterUpdate != null)
        ...(await (afterUpdate!(session, updatedModel))).map(
          (e) => ObjectWrapper(object: e),
        ),
    ]);
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
      return ApiResponse.notConfigured();
    }

    if (true != await allowDelete?.call(session, model)) {
      return ApiResponse.forbidden();
    }

    // try {
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
    // }
    // on DatabaseException {
    //   return ApiResponse(
    //     isOk: true,
    //     value: true,
    //     warning: 'Сущность была удалена ранее',
    //   );
    // }
  }
}
