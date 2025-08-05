import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:nit_tools_server/src/business/crud/base_configs/user_info_config.dart';
import 'package:serverpod/serverpod.dart';

import '../../chats/chat_crud_configs.dart';
import '../base_configs/fcm_token.dart';

class CrudConfig<T extends TableRow> {
  static final Map<String, CrudConfig> _serverConfiguration = {};

  static initConfiguration(List<CrudConfig> configuration) {
    _serverConfiguration.addEntries(
      [
        fcmTokenConfig,
        userInfoConfig,
        ...defaultChatCrudConfigs,
        ...configuration,
      ].map(
        (config) => MapEntry(config.className, config),
      ),
    );
  }

  static CrudConfig<TableRow>? getCaller(String className) =>
      _serverConfiguration[className];

  const CrudConfig({
    required this.table,
    // this.getOneById,
    this.getOneCustomConfigs,
    this.getAll,
    this.post,
    this.insertConfig,
    this.updateConfig,
    this.deleteConfig,
  });

  final Table table;
  // final GetOneByIdConfig<T>? getOneById;
  final List<GetOneCustomConfig<T>>? getOneCustomConfigs;

  final GetAllConfig<T>? getAll;
  final PostConfig<T>? post;

  final DeleteConfig<T>? deleteConfig;
  final UpdateConfig<T>? updateConfig;
  final InsertConfig<T>? insertConfig;

  String get className => T.toString();
}
