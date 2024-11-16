import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:nit_tools_server/src/extra_classes/api_response.dart';
import 'package:nit_tools_server/src/extra_classes/nit_backend_filter.dart';
import 'package:serverpod/serverpod.dart';

class CrudEndpoint extends Endpoint {
  static final Map<String, CrudConfig> _serverConfiguration = {};

  static initConfiguration(List<CrudConfig> configuration) {
    _serverConfiguration.addEntries(
      configuration.map(
        (config) => MapEntry(config.className, config),
      ),
    );
  }

  Future<ApiResponse<int>> getOne(
    Session session, {
    required String className,
    required int id,
  }) async {
    final caller = _serverConfiguration[className]?.getOne;

    if (caller == null) {
      return ApiResponse.notConfigured();
    }
    return await caller.call(session, id);
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

    if (caller == null || caller.allowDelete == null) {
      return ApiResponse.notConfigured();
    }

    return await caller.delete(session, wrappedModel.object);
  }
}
