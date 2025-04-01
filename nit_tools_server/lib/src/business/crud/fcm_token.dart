import 'package:nit_tools_server/nit_tools_server.dart';

final fcmTokenConfig = CrudConfig<NitFcmToken>(
  table: NitFcmToken.t,
  post: PostConfig(
    allowInsert: (session, model) async {
      return model.userId == (await session.authenticated)?.userId;
    },
  ),
);
