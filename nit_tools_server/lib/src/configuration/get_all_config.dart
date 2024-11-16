import 'package:serverpod/serverpod.dart';

import '../extra_classes/api_response.dart';
import '../extra_classes/object_wrapper.dart';

class GetAllConfig<T extends TableRow> {
  const GetAllConfig();

  Future<ApiResponse<List<int>>> call(
    Session session, {
    Expression<T>? whereClause,
  }) async {
    final list = await session.db.find<T>(
      where: whereClause,
    );

    return ApiResponse<List<int>>(
      isOk: true,
      value: [...list.map((e) => e.id!)],
      updatedEntities: list.map((e) => ObjectWrapper(object: e)).toList(),
    );
  }
}
