// import 'package:nit_tools_server/nit_tools_server.dart';
// import 'package:serverpod/serverpod.dart';

// class DeleteConfig<T extends TableRow> {
//   const DeleteConfig({
//     this.allowDelete,
//     this.beforeDeleteTransactionActions,
//     this.afterDeleteTransactionActions,
//     this.afterDeleteTriggers,
//   });

//   final Future<bool> Function(Session session, T model)? allowDelete;

//   final Future<List<ObjectWrapper>> Function(
//           Session session, Transaction transaction, T model)?
//       beforeDeleteTransactionActions;
//   final Future<List<ObjectWrapper>> Function(
//     Session session,
//     Transaction transaction,
//     T model, {
//     List<ObjectWrapper>? wrappedUpdatesFromBeforeDeleteTransactionActions,
//   })? afterDeleteTransactionActions;

//   final Future<List<TableRow>> Function(
//     Session session,
//     T model, {
//     List<ObjectWrapper>? wrappedUpdatesFromBeforeDeleteTransactionActions,
//     List<ObjectWrapper>? wrappedUpdatesFromAfterDeleteTransactionActions,
//   })? afterDeleteTriggers;

//   Future<ApiResponse<bool>> delete(Session session, int modelId) async {
//     final T? model = await session.db.findById<T>(modelId);

//     if (model == null) {
//       return ApiResponse(
//         isOk: true,
//         value: true,
//         warning: 'Объект не найден, возможно, удален ранее',
//       );
//     }

//     if (true != await allowDelete?.call(session, model)) {
//       return ApiResponse.forbidden();
//     }

//     List<ObjectWrapper>? beforeUpdates;
//     List<ObjectWrapper>? afterUpdates;

//     try {
//       await session.db.transaction((transaction) async {
//         final beforeUpdates = await beforeDeleteTransactionActions?.call(
//             session, transaction, model);

//         await session.db.deleteRow(model);

//         final afterUpdates = await afterDeleteTransactionActions?.call(
//           session,
//           transaction,
//           model,
//           wrappedUpdatesFromBeforeDeleteTransactionActions: beforeUpdates,
//         );

//         return [
//           if (beforeUpdates != null) ...beforeUpdates,
//           ObjectWrapper.deleted(object: model),
//           if (afterUpdates != null) ...afterUpdates,
//         ];
//       });
//     } on DatabaseException {
//       return ApiResponse(
//         isOk: false,
//         value: false,
//         error:
//             'Невозможно удалить объект, к которому привязаны другие сущности',
//       );
//     }

//     return ApiResponse(
//       isOk: true,
//       value: true,
//       updatedEntities: [
//         // ObjectWrapper.deleted(object: model),

//         if (afterDeleteTriggers != null)
//           ...(await (afterDeleteTriggers!(session, model))).map(
//             (e) => ObjectWrapper(object: e),
//           ),
//       ],
//     );
//   }
// }
