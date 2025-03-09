import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class GetAllConfig<T extends TableRow> {
  const GetAllConfig({
    this.additionalEntitiesFetchFunction,
    this.defaultOrderByList,
  });

  final List<Order>? defaultOrderByList;
  final Future<List<TableRow>> Function(Session session, List<T> models)?
      additionalEntitiesFetchFunction;

  Future<ApiResponse<List<int>>> call(
    Session session, {
    Expression? whereClause,
    int? limit,
    int? offset,
  }) async {
    final resultItems = await session.db.find<T>(
      where: whereClause,
      orderByList: defaultOrderByList,
      limit: limit,
      offset: offset,
    );

    return ApiResponse<List<int>>(
      isOk: true,
      value: [
        ...resultItems.map((e) => e.id!),
      ],
      updatedEntities: [
        ...resultItems,
        if (additionalEntitiesFetchFunction != null)
          ...(await additionalEntitiesFetchFunction!(
            session,
            resultItems,
          ))
      ]
          .map(
            (e) => ObjectWrapper(object: e),
          )
          .toList(),
    );
  }
}
