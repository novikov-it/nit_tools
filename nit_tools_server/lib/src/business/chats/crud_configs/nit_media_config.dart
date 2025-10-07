import 'package:nit_tools_server/nit_tools_server.dart';

final nitMediaCrudConfig = CrudConfig<NitMedia>(
  table: NitMedia.t,
  // getOneById: GetOneByIdConfig(),
  getOneCustomConfigs: [
    GetOneCustomConfig(
      filterPrototype: NitBackendFilter.equalsPrototype(fieldName: 'id'),
    ),
  ],
);
