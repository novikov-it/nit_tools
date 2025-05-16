import 'package:nit_tools_server/nit_tools_server.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

final userInfoConfig = CrudConfig<UserInfo>(
  table: UserInfo.t,
  getOneCustomConfigs: [
    GetOneCustomConfig(
      filterPrototype:
          NitBackendFilter.equalsPrototype(fieldName: 'userIdentifier'),
    ),

    //      ??
    // await session.db.insertRow<UserProfile>(
    //   UserProfile(
    //     userId: model.id!,
    //     phone: model.userIdentifier,
    //   ),
    // )
  ],
);
