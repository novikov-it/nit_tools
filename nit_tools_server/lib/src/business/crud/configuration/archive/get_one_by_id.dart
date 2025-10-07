// import 'package:nit_tools_server/nit_tools_server.dart';
// import 'package:serverpod/serverpod.dart';

// class GetOneByIdConfig<T extends TableRow> {
//   const GetOneByIdConfig({
//     this.createIfMissing,
//   });

//   final Future<T?> Function(Session session, int id)? createIfMissing;

//   Future<T?> _getObject(
//     Session session,
//     int id,
//   ) async {
//     // T? t = await session.db.findById<T>(id);

//     // if (t == null && createIfMissing != null) {
//     //   t ??= await createIfMissing?.call(session, id);

//     //   if (t != null) {
//     //     t = await session.db.insertRow<T>(t);
//     //   }
//     // }

//     return await session.db.findById<T>(id) ??
//         await createIfMissing?.call(session, id);
//   }

//   Future<ApiResponse<int>> call(
//     Session session,
//     int id,
//   ) async {
//     final t = await _getObject(
//       session,
//       id,
//     ).then(
//       (result) => ApiResponse<int>(
//         isOk: result != null,
//         value: result?.id,
//         error: result == null ? 'Объект не найден' : null,
//         updatedEntities:
//             result != null ? [ObjectWrapper(object: result)] : null,
//       ),
//     );

//     return t;
//   }
// }
