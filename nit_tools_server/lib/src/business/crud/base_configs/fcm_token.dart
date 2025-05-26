import 'package:nit_tools_server/nit_tools_server.dart';

final fcmTokenConfig = CrudConfig<NitFcmToken>(
  table: NitFcmToken.t,
  post: PostConfig(
    allowInsert: (session, model) => session.isUser(model.userId),
  ),
);
