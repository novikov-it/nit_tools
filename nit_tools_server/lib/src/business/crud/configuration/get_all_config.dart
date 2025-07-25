import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class GetAllConfig<T extends TableRow> {
  const GetAllConfig({
    this.include,
    this.additionalEntitiesFetchFunction,
    this.defaultOrderByList,
  });

  final Include? include;
  final List<Order>? defaultOrderByList;
  final Future<List<TableRow>> Function(Session session, List<T> models)?
      additionalEntitiesFetchFunction;

  Future<ApiResponse<List<int>>> getIds(
    Session session, {
    Expression? whereClause,
    int? limit,
    int? offset,
  }) async {
    final resultItems = await session.db.find<T>(
      where: whereClause,
      include: include,
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

  Future<ApiResponse<int>> getCount(
    Session session, {
    Expression? whereClause,
  }) async {
    final result = await session.db.count<T>(
      where: whereClause,
    );

    return ApiResponse<int>(
      isOk: true,
      value: result,
    );
  }

  Future<ApiResponse<List<ObjectWrapper>>> getEntityList(
    Session session, {
    Expression? whereClause,
    int? limit,
    int? offset,
  }) async {
    final resultItems = await session.db.find<T>(
      where: whereClause,
      include: include,
      orderByList: defaultOrderByList,
      limit: limit,
      offset: offset,
    );

    return ApiResponse<List<ObjectWrapper>>(
      isOk: true,
      value: resultItems
          .map(
            (e) => ObjectWrapper(object: e),
          )
          .toList(),
      updatedEntities: [
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
