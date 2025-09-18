import 'dart:async';

import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:nit_tools_server/src/business/extensions/log_extension.dart';
import 'package:serverpod/serverpod.dart';

class DeleteConfig<T extends TableRow> {
  const DeleteConfig({
    required this.allowDelete,
    this.deleteValidation,
    this.beforeDeleteTransactionActions,
    this.afterDeleteTransactionActions,
    this.afterDeleteSideEffects,
  });

  /// Срабатывает самой первой, проверяет полномочия на удаление объекта
  /// Если проверка не пройдена, на возвращается стандартное сообщение о недостаточности полномочий
  final Future<bool> Function(Session session, T model) allowDelete;

  /// Используется для проверки, что конкретно этот объект можно удалять
  /// Например, проверяется отсутствие критичных связей или иных блокеров для удаления
  /// Возвращается текст ошибки как при валидации
  final Future<String?> Function(Session session, T model)? deleteValidation;

  final Future<List<ObjectWrapper>> Function(
          Session session, Transaction transaction, T model)?
      beforeDeleteTransactionActions;
  final Future<List<ObjectWrapper>> Function(
    Session session,
    Transaction transaction,
    T model, {
    List<ObjectWrapper>? beforeDeleteUpdates,
  })? afterDeleteTransactionActions;

  final Future<void> Function(
    Session session,
    T deletedModel, {
    List<ObjectWrapper>? beforeDeleteUpdates,
    List<ObjectWrapper>? afterDeleteUpdates,
  })? afterDeleteSideEffects;

  Future<ApiResponse<bool>> delete(Session session, int modelId) async {
    final T? model = await session.db.findById<T>(modelId);

    if (model == null) {
      return ApiResponse(
        isOk: true,
        value: true,
        warning: 'Объект не найден, возможно, удален ранее',
      );
    }

    if (true != await allowDelete.call(session, model)) {
      return ApiResponse.forbidden();
    }

    if (deleteValidation != null) {
      final validationError = await deleteValidation!.call(session, model);

      if (validationError != null) {
        return ApiResponse(
          isOk: false,
          value: false,
          error: validationError,
        );
      }
    }

    List<ObjectWrapper>? beforeDeleteUpdates;
    List<ObjectWrapper>? afterDeleteUpdates;

    try {
      await session.db.transaction((transaction) async {
        beforeDeleteUpdates = await beforeDeleteTransactionActions?.call(
          session,
          transaction,
          model,
        );

        await session.db.deleteRow(model);

        afterDeleteUpdates = await afterDeleteTransactionActions?.call(
          session,
          transaction,
          model,
          beforeDeleteUpdates: beforeDeleteUpdates,
        );
      });
    } on DatabaseException catch (e, st) {
      session.log(
        'Failed to delete $T with id ${model.id}: $e',
        level: LogLevel.error,
        stackTrace: st,
      );

      NitAlerts.sendAlert(
        message: '⚠️ Ошибка $e при удалении $T ${model.toLogString()}',
      );

      return ApiResponse(
        isOk: false,
        value: false,
        error: 'При удалении объекта произошла ошибка',
      );
    }

    if (afterDeleteSideEffects != null) {
      unawaited(
        Future(
          () async {
            // 3. Create a new session for background work
            final newSession = await Serverpod.instance.createSession();
            try {
              await afterDeleteSideEffects!(
                newSession,
                model,
                beforeDeleteUpdates: beforeDeleteUpdates,
                afterDeleteUpdates: afterDeleteUpdates,
              );
            } catch (e) {
              newSession.log(
                  'Side effects failed after deletion of $T with id ${model.id}',
                  level: LogLevel.warning);
              newSession.log(
                e.toString(),
                level: LogLevel.warning,
              );
            } finally {
              await newSession.close();
            }
          },
        ),
      );
    }

    return ApiResponse(
      isOk: true,
      value: true,
      updatedEntities: [
        if (beforeDeleteUpdates != null)
          ...beforeDeleteUpdates!.where(
            (e) =>
                afterDeleteUpdates == null ||
                !afterDeleteUpdates!.any((u) =>
                    u.className == e.className && u.modelId == e.modelId),
          ),
        ObjectWrapper.deleted(object: model),
        if (afterDeleteUpdates != null) ...afterDeleteUpdates!,
      ],
    );
  }
}
