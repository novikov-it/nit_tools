import 'package:collection/collection.dart';
import 'package:nit_tools_server/nit_tools_server.dart';
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
    final caller = CrudConfig.getCaller(className);

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
  }

  Future<ApiResponse<List<int>>> getAll(
    Session session, {
    required String className,
    NitBackendFilter? filter,
    int? limit,
    int? offset,
  }) async {
    final caller = CrudConfig.getCaller(className);

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
  }

  Future<ApiResponse<List<ObjectWrapper>>> getEntityList(
    Session session, {
    required String className,
    NitBackendFilter? filter,
    int? limit,
    int? offset,
  }) async {
    final caller = CrudConfig.getCaller(className);

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
  }

  Future<ApiResponse<List<int>>> saveModels(
    Session session, {
    required List<ObjectWrapper> wrappedModels,
  }) async {
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
  }

  Future<ApiResponse<int>> saveModel(
    Session session, {
    required ObjectWrapper wrappedModel,
  }) async {
    final className = wrappedModel.nitMappingClassname;
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
  }

  Future<ApiResponse<bool>> delete(
    Session session, {
    required String className,
    required int modelId,
    // required ObjectWrapper wrappedModel,
  }) async {
    // final className = wrappedModel.nitMappingClassname;

    final caller = CrudConfig.getCaller(className)?.post;

    if (caller == null) {
      return ApiResponse.notConfigured(source: 'удаление $className');
    }

    return await caller.delete(
      session,
      modelId,
    );
  }
}
