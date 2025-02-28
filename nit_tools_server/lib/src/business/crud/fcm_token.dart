import 'package:nit_tools_server/src/generated/fcm_token.dart';

import 'configuration/crud_config.dart';
import 'configuration/post_config.dart';

final fcmTokenConfig = CrudConfig<NitFcmToken>(
  table: NitFcmToken.t,
  post: PostConfig(
    allowInsert: (session, model) async {
      return model.userId == (await session.authenticated)?.userId;
    },
  ),
);
