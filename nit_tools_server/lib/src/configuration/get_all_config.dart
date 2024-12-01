import 'package:serverpod/serverpod.dart';

import '../extra_classes/api_response.dart';
import '../extra_classes/object_wrapper.dart';

class GetAllConfig<T extends TableRow> {
  const GetAllConfig({
    this.additionalEntitiesFetchFunction,
  });

  final Future<List<TableRow>> Function(Session session, List<T> models)?
      additionalEntitiesFetchFunction;

  Future<ApiResponse<List<int>>> call(
    Session session, {
    Expression? whereClause,
  }) async {
    final list = await session.db.find<T>(
      where: whereClause,
    );

    return ApiResponse<List<int>>(isOk: true, value: [
      ...list.map((e) => e.id!)
    ], updatedEntities: [
      ...list.map((e) => ObjectWrapper(object: e)),
      if (additionalEntitiesFetchFunction != null)
        ...(await (additionalEntitiesFetchFunction!(
          session,
          list,
        )))
            .map(
          (e) => ObjectWrapper(object: e),
        )
    ]);
  }
}
