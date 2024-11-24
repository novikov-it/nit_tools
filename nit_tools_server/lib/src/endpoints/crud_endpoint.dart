import 'package:collection/collection.dart';
import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:nit_tools_server/src/extra_classes/api_response.dart';
import 'package:serverpod/serverpod.dart';

import '../extra_classes/nit_backend_filter.dart';

class CrudEndpoint extends Endpoint {
  static final Map<String, CrudConfig> _serverConfiguration = {};

  static initConfiguration(List<CrudConfig> configuration) {
    _serverConfiguration.addEntries(
      configuration.map(
        (config) => MapEntry(config.className, config),
      ),
    );
  }

  Future<ApiResponse<int>> getOneById(
    Session session, {
    required String className,
    required int id,
  }) async {
    final caller = _serverConfiguration[className];

    if (caller?.getOneById == null) {
      return ApiResponse.notConfigured();
    }
    return await caller!.getOneById!.call(
      session,
      id,
    );
  }

  Future<ApiResponse<int>> getOneCustom(
    Session session, {
    required String className,
    required List<NitBackendFilter> filters,
  }) async {
    final caller = _serverConfiguration[className];

    if (caller?.getOneCustomConfigs == null ||
        caller!.getOneCustomConfigs!.isEmpty) {
      return ApiResponse.notConfigured();
    }

    final filteredAttrs = filters.map((e) => e.fieldName);

    final config = caller.getOneCustomConfigs!.firstWhereOrNull((e) =>
        e.attributeNames.where((a) => filteredAttrs.contains(a)).length ==
        e.attributeNames.length);

    if (config == null) {
      return ApiResponse.notConfigured();
    }

    return await config.call(
      session,
      filters,
      caller.prepareWhere(
        filters,
      ),
    );
  }

  Future<ApiResponse<List<int>>> getAll(
    Session session, {
    required String className,
    List<NitBackendFilter>? filters,
  }) async {
    final caller = _serverConfiguration[className];

    if (caller?.getAll == null) {
      return ApiResponse.notConfigured();
    }

    return await caller!.getAll!
        .call(session, whereClause: caller.prepareWhere(filters));
  }

  Future<ApiResponse<int>> saveModel(
    Session session, {
    required ObjectWrapper wrappedModel,
  }) async {
    final caller = _serverConfiguration[wrappedModel.className]?.post;

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
      return ApiResponse.notConfigured();
    }
    return await caller.upsert(session, wrappedModel.object);
  }

  Future<ApiResponse<bool>> delete(
    Session session, {
    required ObjectWrapper wrappedModel,
  }) async {
    final caller = _serverConfiguration[wrappedModel.className]?.post;

    if (caller == null) {
      return ApiResponse.notConfigured();
    }

    return await caller!.delete(session, wrappedModel.object);
  }
}
