import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod/serverpod.dart';

/// Контекст сохранения модели.
/// Доступен на всех стадиях жизненного цикла.
class DwSaveContext<T extends TableRow> {
  final int? currentUserId;
  final bool isInsert;
  final T? initialModel;
  Transaction? transaction;

  /// Текущая модель (обновляется на каждом шаге).
  T currentModel;

  /// Обновления, сделанные до и после основного сохранения.
  final List<ObjectWrapper> beforeUpdates = [];
  final List<ObjectWrapper> afterUpdates = [];

  /// Произвольные данные между шагами.
  final Map<String, dynamic> extras = {};

  DwSaveContext({
    required this.currentUserId,
    required this.isInsert,
    required this.initialModel,
    required this.currentModel,
  });
}
