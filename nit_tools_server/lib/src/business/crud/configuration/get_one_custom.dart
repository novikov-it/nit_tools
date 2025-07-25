import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class GetOneCustomConfig<T extends TableRow> {
  const GetOneCustomConfig({
    required this.filterPrototype,
    this.include,
    this.createIfMissing,
    this.additionalEntitiesFetchFunction,
    this.populateNonPersistFieldsCallback,
  });

  final NitBackendFilter filterPrototype;
  final Include? include;
  final Future<T?> Function(
    Session session,
    NitBackendFilter filter,
  )? createIfMissing;

  final Future<T> Function(Session session, T model)?
      populateNonPersistFieldsCallback;

  final Future<List<TableRow>> Function(Session session, T model)?
      additionalEntitiesFetchFunction;

  Future<T?> _getObject(
    Session session,
    Table table,
    NitBackendFilter filter,
  ) async {
    // T? t = await session.db.findFirstRow(where: whereClause);

    // if (t == null && createIfMissing != null) {
    //   t ??= await createIfMissing?.call(
    //     session,
    //     attributeNames
    //         .map((e) => filters.firstWhere((f) => f.fieldName == e).equalsTo)
    //         .toList(),
    //   );

    //   if (t != null) {
    //     t = await session.db.insertRow<T>(t);
    //   }
    // }

    return await session.db.findFirstRow(
          where: filter.prepareWhere(table),
          include: include,
        ) ??
        await createIfMissing?.call(
          session,
          filter,
        );
  }

  Future<ApiResponse<int>> call(
    Session session,
    Table table,
    NitBackendFilter filter,
  ) async {
    final t = await _getObject(session, table, filter)
        .then((model) async =>
            populateNonPersistFieldsCallback != null && model != null
                ? await populateNonPersistFieldsCallback!(session, model)
                : model)
        .then(
          (result) async => ApiResponse<int>(
            isOk: true,
            value: result?.id,
            // error: result == null ? 'Объект не найден' : null,
            updatedEntities: result != null
                ? [
                    ObjectWrapper(object: result),
                    if (additionalEntitiesFetchFunction != null)
                      ...(await (additionalEntitiesFetchFunction!(
                              session, result)))
                          .map(
                        (e) => ObjectWrapper(object: e),
                      )
                  ]
                : null,
          ),
        );

    return t;
  }
}
