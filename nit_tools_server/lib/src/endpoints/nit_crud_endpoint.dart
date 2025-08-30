import 'package:collection/collection.dart';
import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:nit_tools_server/src/business/extensions/log_extension.dart';
import 'package:serverpod/serverpod.dart';

class NitCrudEndpoint extends Endpoint {
  // Future<ApiResponse<int>> getOneById(
  //   Session session, {
  //   required String className,
  //   required int id,
  // }) async {
  //   final caller = CrudConfig.getCaller(className);

  //   if (caller?.getOneById == null) {
  //     return ApiResponse.notConfigured(source: 'получение $className по id');
  //   }
  //   return await caller!.getOneById!.call(
  //     session,
  //     id,
  //   );
  // }

  final _deepEquality = const DeepCollectionEquality();
  // final MapEquality _mapEquality = const MapEquality();

  Future<ApiResponse<int>> getOneCustom(
    Session session, {
    required String className,
    required NitBackendFilter filter,
  }) async {
    try {
      final caller = CrudConfig.getCaller(className);

      print(
        "Received getOneCustom request for $className with filter: ${filter.attributeMap}",
      );

      if (caller?.getOneCustomConfigs == null ||
          caller!.getOneCustomConfigs!.isEmpty) {
        return ApiResponse.notConfigured(source: 'получение $className');
      }

      // for (var t in caller.getOneCustomConfigs ?? []) {
      //   final k = t.filterPrototype.attributeMap;
      //   print(k);
      // }

      // final d = filter.attributeMap;
      // print(d);

      final config = caller.getOneCustomConfigs!.firstWhereOrNull(
        (e) => _deepEquality.equals(
          e.filterPrototype.attributeMap,
          filter.attributeMap,
        ),
      );

      if (config == null) {
        return ApiResponse.notConfigured(source: 'получение $className');
      }

      return await config.call(
        session,
        caller.table,
        filter,
      );
    } catch (ex) {
      NitAlerts.sendAlert(
        message:
            '⚠️ Непредвиденная ошибка $ex при получении $className с фильтром ${filter.attributeMap}',
      );
      return ApiResponse(
        isOk: false,
        value: null,
        error:
            'Непредвиденная ошибка при обработке запроса на получение $className',
      );
    }
  }

  Future<ApiResponse<List<int>>> getAll(
    Session session, {
    required String className,
    NitBackendFilter? filter,
    int? limit,
    int? offset,
  }) async {
    try {
      final caller = CrudConfig.getCaller(className);

      print(
        "Received getAll request for $className ${filter != null ? 'with filter: ${filter.attributeMap}' : ''}",
      );

      if (caller?.getAll == null) {
        return ApiResponse.notConfigured(source: 'получение списка $className');
      }

      return await caller!.getAll!.getIds(
        session,
        whereClause: filter?.prepareWhere(
          caller.table,
        ),
        limit: limit,
        offset: offset,
      );
    } catch (e) {
      NitAlerts.sendAlert(
        message:
            '⚠️ Непредвиденная ошибка $e при получении списка $className с фильтром ${filter?.attributeMap}',
      );
      return ApiResponse(
        isOk: false,
        value: null,
        error:
            'Непредвиденная ошибка при обработке запроса на получение списка $className',
      );
    }
  }

  Future<ApiResponse<int>> getCount(
    Session session, {
    required String className,
    NitBackendFilter? filter,
  }) async {
    try {
      final caller = CrudConfig.getCaller(className);

      print(
        "CRUD: getCount for $className with filter: $filter",
      );

      if (caller?.getAll == null) {
        return ApiResponse.notConfigured(
            source: 'получение количества $className');
      }

      return await caller!.getAll!.getCount(
        session,
        whereClause: filter?.prepareWhere(
          caller.table,
        ),
      );
    } catch (e) {
      NitAlerts.sendAlert(
        message:
            '⚠️ Непредвиденная ошибка $e при получении количества $className с фильтром ${filter?.attributeMap}',
      );
      return ApiResponse(
        isOk: false,
        value: null,
        error:
            'Непредвиденная ошибка при обработке запроса на получение количества $className',
      );
    }
  }

  Future<ApiResponse<List<ObjectWrapper>>> getEntityList(
    Session session, {
    required String className,
    NitBackendFilter? filter,
    int? limit,
    int? offset,
  }) async {
    try {
      final caller = CrudConfig.getCaller(className);

      print(
        "CRUD: getEntityList for $className with filter: $filter limit: $limit offset: $offset",
      );

      if (caller?.getAll == null) {
        return ApiResponse.notConfigured(source: 'получение списка $className');
      }

      return await caller!.getAll!.getEntityList(
        session,
        whereClause: filter?.prepareWhere(
          caller.table,
        ),
        limit: limit,
        offset: offset,
      );
    } catch (e) {
      NitAlerts.sendAlert(
        message:
            '⚠️ Непредвиденная ошибка $e при получении списка $className с фильтром ${filter?.attributeMap}',
      );
      return ApiResponse(
        isOk: false,
        value: null,
        error:
            'Непредвиденная ошибка при обработке запроса на получение списка $className',
      );
    }
  }

  Future<ApiResponse<List<int>>> saveModels(
    Session session, {
    required List<ObjectWrapper> wrappedModels,
  }) async {
    try {
      final res =
          ApiResponse<List<int>>(isOk: true, value: [], updatedEntities: []);
      for (ObjectWrapper model in wrappedModels) {
        final t = await saveModel(session, wrappedModel: model);

        if (t.isOk && t.value != null) {
          res.value!.add(t.value!);
          res.updatedEntities!.addAll(
            t.updatedEntities ?? [],
          );
        } else {
          return ApiResponse(
            isOk: false,
            value: null,
            error: t.error,
            warning: t.warning,
          );
        }
      }

      return res;
    } catch (e) {
      NitAlerts.sendAlert(
        message: '⚠️ Непредвиденная ошибка $e при массовом сохранении моделей',
      );
      return ApiResponse(
        isOk: false,
        value: null,
        error: 'Непредвиденная ошибка при массовом сохранении моделей',
      );
    }
  }

  Future<ApiResponse<int>> saveModel(
    Session session, {
    required ObjectWrapper wrappedModel,
  }) async {
    try {
      final className = wrappedModel.nitMappingClassname;

      if (wrappedModel.object.id == null) {
        final insertSpecificCaller =
            CrudConfig.getCaller(className)?.insertConfig;

        if (insertSpecificCaller != null) {
          return await insertSpecificCaller.insert(
            session,
            wrappedModel.object,
          );
        }
      } else {
        final updateSpecificCaller =
            CrudConfig.getCaller(className)?.updateConfig;

        if (updateSpecificCaller != null) {
          return await updateSpecificCaller.update(
            session,
            wrappedModel.object,
          );
        }
      }

      final caller = CrudConfig.getCaller(className)?.post;

      // if (caller == null ||
      //     (wrappedModel.object.id == null
      //             ? caller.allowInsert
      //             : caller.allowUpdate) ==
      //         null) {
      // final a = caller?.allowInsert;
      // final b = caller?.allowUpdate;
      if (caller == null
          // ||
          // ((wrappedModel.object.id == null && a == null) ||
          //     (wrappedModel.object.id != null && b == null))
          //     ? caller.allowInsert
          //     : caller.allowUpdate) ==
          // null
          ) {
        return ApiResponse.notConfigured(source: 'сохранение $className');
      }
      return await caller.upsert(session, wrappedModel.object);
    } catch (e, st) {
      NitAlerts.sendAlert(
        message:
            '⚠️ Непредвиденная ошибка $e при сохранении ${wrappedModel.nitMappingClassname} ${wrappedModel.object.toLogString()}',
      );
      return ApiResponse(
        isOk: false,
        value: null,
        error:
            'Непредвиденная ошибка при обработке запроса на сохранение ${wrappedModel.nitMappingClassname}',
      );
    }
  }

  Future<ApiResponse<bool>> delete(
    Session session, {
    required String className,
    required int modelId,
    // required ObjectWrapper wrappedModel,
  }) async {
    // final className = wrappedModel.nitMappingClassname;
    try {
      final deleteSpecificCaller =
          CrudConfig.getCaller(className)?.deleteConfig;

      if (deleteSpecificCaller != null) {
        return await deleteSpecificCaller.delete(
          session,
          modelId,
        );
      }

      final caller = CrudConfig.getCaller(className)?.post;

      if (caller == null) {
        return ApiResponse.notConfigured(source: 'удаление $className');
      }

      return await caller.delete(
        session,
        modelId,
      );
    } catch (ex) {
      NitAlerts.sendAlert(
        message:
            '⚠️ Непредвиденная ошибка $ex при удалении $className $modelId',
      );
      return ApiResponse(
        isOk: false,
        value: null,
        error:
            'Непредвиденная ошибка при обработке запроса на удаление $className',
      );
    }
  }
}
