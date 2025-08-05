import 'dart:async';

import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

class UpdateConfig<T extends TableRow> {
  const UpdateConfig({
    required this.allowUpdate,
    this.updateValidation,
    this.beforeUpdateTransactionActions,
    this.beforeUpdatePreProcessing,
    this.afterUpdateTransactionActions,
    this.afterUpdateSideEffects,
  });

  /// Срабатывает самой первой, проверяет полномочия на вставку объекта
  /// Если проверка не пройдена, на возвращается стандартное сообщение о недостаточности полномочий
  final Future<bool> Function(Session session, T currentModel, T newModel)
      allowUpdate;

  /// Используется для проверки, что конкретно этот объект можно сохранить
  /// Например, проверяется корректность данных и отсутствие дубликатов
  /// Возвращается текст ошибки как при валидации
  final Future<String?> Function(
    Session session,
    T currentModel,
    T newModel,
  )? updateValidation;

  final Future<List<ObjectWrapper>> Function(
    Session session,
    Transaction transaction,
    T initialModel,
    T newModel,
  )? beforeUpdateTransactionActions;

  final Future<T> Function(
    Session session,
    T initialModel,
    T newModel,
  )? beforeUpdatePreProcessing;

  final Future<List<ObjectWrapper>> Function(
    Session session,
    Transaction transaction,
    T initialModel,
    T updatedModel, {
    List<ObjectWrapper>? beforeUpdateUpdates,
  })? afterUpdateTransactionActions;

  final Future<void> Function(
    Session session,
    T updatedModel, {
    List<ObjectWrapper>? beforeUpdateUpdates,
    List<ObjectWrapper>? afterUpdateUpdates,
  })? afterUpdateSideEffects;

  Future<ApiResponse<int>> update(Session session, T model) async {
    final currentModel = await session.db.findById<T>(model.id!);

    if (currentModel == null) {
      return ApiResponse(
        isOk: false,
        value: null,
        error: 'Объект с id ${model.id} не найден, возможно, удален ранее',
      );
    }

    if (true != await allowUpdate.call(session, currentModel, model)) {
      return ApiResponse.forbidden();
    }

    if (updateValidation != null) {
      final validationError =
          await updateValidation!(session, currentModel, model);

      if (validationError != null) {
        return ApiResponse(
          isOk: false,
          value: null,
          error: validationError,
        );
      }
    }

    List<ObjectWrapper>? beforeUpdateUpdates;
    late T updatedModel;
    List<ObjectWrapper>? afterUpdateUpdates;

    try {
      await session.db.transaction(
        (transaction) async {
          beforeUpdateUpdates = await beforeUpdateTransactionActions?.call(
            session,
            transaction,
            currentModel,
            model,
          );

          updatedModel = await session.db.updateRow<T>(
            beforeUpdatePreProcessing == null
                ? model
                : await beforeUpdatePreProcessing!(
                    session,
                    currentModel,
                    model,
                  ),
          );

          afterUpdateUpdates = await afterUpdateTransactionActions?.call(
            session,
            transaction,
            currentModel,
            updatedModel,
            beforeUpdateUpdates: beforeUpdateUpdates,
          );
        },
      );
    } on DatabaseException catch (e, st) {
      session.log(
        'Failed to Update $T: $e',
        level: LogLevel.error,
        stackTrace: st,
      );

      return ApiResponse(
        isOk: false,
        value: null,
        error: 'При сохранении объекта произошла ошибка',
      );
    }

    if (afterUpdateSideEffects != null) {
      unawaited(
        Future(
          () async {
            // 3. Create a new session for background work
            final newSession = await Serverpod.instance.createSession();
            try {
              await afterUpdateSideEffects!(
                newSession,
                updatedModel,
                beforeUpdateUpdates: beforeUpdateUpdates,
                afterUpdateUpdates: afterUpdateUpdates,
              );
            } catch (e) {
              newSession.log(
                  'Side effects failed after update of $T with id ${updatedModel.id}',
                  level: LogLevel.warning);
            } finally {
              await newSession.close();
            }
          },
        ),
      );
    }

    final updatedEntities = [
      if (beforeUpdateUpdates != null) ...beforeUpdateUpdates!,
      ObjectWrapper(object: updatedModel),
      if (afterUpdateUpdates != null) ...afterUpdateUpdates!,
    ];

    return ApiResponse(
      isOk: true,
      value: updatedModel.id,
      updatedEntities: updatedEntities,
    );
  }
}
