import 'dart:async';

import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:nit_tools_server/src/business/extensions/log_extension.dart';
import 'package:serverpod/serverpod.dart';

class InsertConfig<T extends TableRow> {
  const InsertConfig({
    required this.allowInsert,
    this.insertValidation,
    this.beforeInsertTransactionActions,
    this.beforeInsertPreProcessing,
    this.afterInsertTransactionActions,
    this.afterInsertSideEffects,
  });

  /// Срабатывает самой первой, проверяет полномочия на вставку объекта
  /// Если проверка не пройдена, на возвращается стандартное сообщение о недостаточности полномочий
  final Future<bool> Function(Session session, T model) allowInsert;

  /// Используется для проверки, что конкретно этот объект можно сохранить
  /// Например, проверяется корректность данных и отсутствие дубликатов
  /// Возвращается текст ошибки как при валидации
  final Future<String?> Function(Session session, T model)? insertValidation;

  final Future<List<ObjectWrapper>> Function(
          Session session, Transaction transaction, T model)?
      beforeInsertTransactionActions;
  final Future<T> Function(
    Session session,
    T newModel, {
    List<ObjectWrapper>? beforeInsertUpdates,
  })? beforeInsertPreProcessing;

  final Future<List<ObjectWrapper>> Function(
    Session session,
    Transaction transaction,
    T insertedModel, {
    List<ObjectWrapper>? beforeInsertUpdates,
  })? afterInsertTransactionActions;

  final Future<void> Function(
    Session session,
    T insertedModel, {
    List<ObjectWrapper>? beforeInsertUpdates,
    List<ObjectWrapper>? afterInsertUpdates,
  })? afterInsertSideEffects;

  Future<ApiResponse<int>> insert(Session session, T model) async {
    if (true != await allowInsert.call(session, model)) {
      return ApiResponse.forbidden();
    }

    if (insertValidation != null) {
      final validationError = await insertValidation!(session, model);

      if (validationError != null) {
        return ApiResponse(
          isOk: false,
          value: null,
          error: validationError,
        );
      }
    }

    List<ObjectWrapper>? beforeInsertUpdates;
    late T insertedModel;
    List<ObjectWrapper>? afterInsertUpdates;

    try {
      await session.db.transaction(
        (transaction) async {
          beforeInsertUpdates = await beforeInsertTransactionActions?.call(
            session,
            transaction,
            model,
          );

          insertedModel = await session.db.insertRow<T>(
            beforeInsertPreProcessing == null
                ? model
                : await beforeInsertPreProcessing!(
                    session,
                    model,
                    beforeInsertUpdates: beforeInsertUpdates,
                  ),
            transaction: transaction,
          );

          afterInsertUpdates = await afterInsertTransactionActions?.call(
            session,
            transaction,
            insertedModel,
            beforeInsertUpdates: beforeInsertUpdates,
          );
        },
      );
    } on DatabaseException catch (e, st) {
      session.log(
        'Failed to insert $T: $e',
        level: LogLevel.error,
        stackTrace: st,
      );

      NitAlerts.sendAlert(
        message: '⚠️ Ошибка $e при вставке $T ${model.toLogString()}',
      );

      return ApiResponse(
        isOk: false,
        value: null,
        error: 'При сохранении объекта произошла ошибка',
      );
    }

    if (afterInsertSideEffects != null) {
      unawaited(
        Future(
          () async {
            // 3. Create a new session for background work
            final newSession = await Serverpod.instance.createSession();
            try {
              await afterInsertSideEffects!(
                newSession,
                insertedModel,
                beforeInsertUpdates: beforeInsertUpdates,
                afterInsertUpdates: afterInsertUpdates,
              );
            } catch (e) {
              newSession.log(
                'Side effects failed after insert of $T with id ${insertedModel.id}',
                level: LogLevel.warning,
              );
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

    final updatedEntities = [
      if (beforeInsertUpdates != null)
        ...beforeInsertUpdates!.where(
          (e) =>
              afterInsertUpdates == null ||
              !afterInsertUpdates!.any(
                  (u) => u.className == e.className && u.modelId == e.modelId),
        ),
      ObjectWrapper(object: insertedModel),
      if (afterInsertUpdates != null) ...afterInsertUpdates!,
    ];

    return ApiResponse(
      isOk: true,
      value: insertedModel.id,
      updatedEntities: updatedEntities,
    );
  }
}
