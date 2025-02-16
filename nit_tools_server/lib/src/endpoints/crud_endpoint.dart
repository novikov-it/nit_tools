import 'package:collection/collection.dart';

import 'package:serverpod/serverpod.dart';

import '../crud/configuration/crud_config.dart';
import '../crud/fcm_token.dart';
import '../extra_classes/api_response.dart';
import '../extra_classes/nit_backend_filter.dart';
import '../extra_classes/object_wrapper.dart';

class CrudEndpoint extends Endpoint {
  static final Map<String, CrudConfig> _serverConfiguration = {};

  static userUpdatesChannel(int userId) => 'userUpdates$userId';

  static initConfiguration(List<CrudConfig> configuration) {
    _serverConfiguration.addEntries(
      [
        fcmTokenConfig,
        ...configuration,
      ].map(
        (config) => MapEntry(config.className, config),
      ),
    );
  }

  // Stream<SerializableModel> updatesStream(Session session) async* {
  //   final userId = await session.authenticated.then((auth) => auth?.userId);

  //   if (userId == null) {
  //     return;
  //   }

  //   final channel = userUpdatesChannel(userId);

  //   yield* session.messages.createStream<SerializableModel>(channel).map(
  //         (update) => update is TableRow ? ObjectWrapper.wrap(update)! : update,
  //       );
  // }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    final userId = await session.authenticated.then((auth) => auth?.userId);

    if (userId == null) {
      return;
    }

    final channel = userUpdatesChannel(userId);

    setUserObject(
      session,
      channel,
    );

    session.log('Subscribing to channel $channel');

    session.messages.addListener(
      channel,
      (update) {
        if (update is TableRow) {
          sendStreamMessage(session, ObjectWrapper.wrap(update)!);
        } else {
          sendStreamMessage(session, update);
        }
      },
    );
  }

  @override
  Future<void> streamClosed(StreamingSession session) async {
    session.messages.removeListener(getUserObject(session), (update) {
      sendStreamMessage(session, update);
    });
  }

  Future<ApiResponse<int>> getOneById(
    Session session, {
    required String className,
    required int id,
  }) async {
    final caller = _serverConfiguration[className];

    if (caller?.getOneById == null) {
      return ApiResponse.notConfigured(source: 'получение $className по id');
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
      return ApiResponse.notConfigured(source: 'получение $className');
    }

    final filteredAttrs = filters.map((e) => e.fieldName);

    final config = caller.getOneCustomConfigs!.firstWhereOrNull((e) =>
        e.attributeNames.where((a) => filteredAttrs.contains(a)).length ==
        e.attributeNames.length);

    if (config == null) {
      return ApiResponse.notConfigured(source: 'получение $className');
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
      return ApiResponse.notConfigured(source: 'получение списка $className');
    }

    return await caller!.getAll!
        .call(session, whereClause: caller.prepareWhere(filters));
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
    final caller = _serverConfiguration[wrappedModel.nitMappingClassname]?.post;

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
      return ApiResponse.notConfigured(
          source: 'сохранение ${wrappedModel.nitMappingClassname}');
    }
    return await caller.upsert(session, wrappedModel.object);
  }

  Future<ApiResponse<bool>> delete(
    Session session, {
    required String className,
    required int modelId,
    // required ObjectWrapper wrappedModel,
  }) async {
    final caller = _serverConfiguration[className]?.post;

    if (caller == null) {
      return ApiResponse.notConfigured(source: 'удаление $className');
    }

    return await caller.delete(session, modelId);
  }
}
