import 'package:collection/collection.dart';
import 'package:dartway_flutter/dartway_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nit_tools_client/nit_tools_client.dart' as nit_tools;
import 'package:nit_tools_flutter/nit_tools_flutter.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as auth;
import 'package:serverpod_client/serverpod_client.dart';

import '../session/nit_socket_state/nit_socket_state.dart';
import 'dw_singleton.dart';

enum UserIdMode { userProfileId, userInfoId }

class DwNitTools<
  ServerpodClientClass extends ServerpodClientShared,
  UserProfileClass extends SerializableModel
>
    extends DwFlutter {
  DwNitTools({required super.config, required this.client}) {
    setDwInstance(this);

    nit_tools.NitToolsClient.protocol = client.serializationManager;

    nitToolsCaller =
        client.moduleLookup.values.firstWhereOrNull(
              (e) => e is nit_tools.Caller,
            )
            as nit_tools.Caller?;

    if (nitToolsCaller == null) {
      throw Exception(
        'Nit Tools module not found. '
        'Add nit_tools_client module to the client.',
      );
    }

    // sessionProvider =
    //     (client.authenticationKeyManager == null)
    //         ? null
    //         : StateNotifierProvider<
    //           DwSessionStateNotifier<UserProfileClass>,
    //           DwSessionStateModel<UserProfileClass>
    //         >(
    //           (ref) => DwSessionStateNotifier<UserProfileClass>(
    //             ref,
    //             client.authenticationKeyManager as DwAuthenticationKeyManager,
    //           ),
    //         );
  }

  final ServerpodClientClass client;
  // final DwAlerts dwAlerts;
  // late final StateNotifierProvider<
  //   DwSessionStateNotifier<UserProfileClass>,
  //   DwSessionStateModel<UserProfileClass>
  // >?
  // sessionProvider;

  Future<bool> initNitTools({
    required WidgetRef ref,
    required Function() initRepositoryFunction,
    Future<int?> Function(int? userId)? customSignedInUserIdPreloadProcessing,
    UserIdMode userIdMode = UserIdMode.userInfoId,
    List<NitRepositoryDescriptor>? customRepositoryDescriptors,
    NitAuthConfig? nitAuthConfig,
  }) async {
    await super.init();

    await initRepositoryFunction();

    // for (var repo
    //     in customRepositoryDescriptors ?? <NitRepositoryDescriptor>[]) {
    //   repo.init();
    // }

    final authCaller = client.moduleLookup.values.firstWhereOrNull(
      (e) => e is auth.Caller,
    );

    if (authCaller == null) {
      throw Exception(
        'Auth module not enabled, can not init session. Add serverpod_auth module to the client',
      );
    }

    await ref
        .read(nitSessionStateProvider.notifier)
        .init(
          authModuleCaller: authCaller as auth.Caller,
          signedInUserIdPreloadProcessing:
              customSignedInUserIdPreloadProcessing ??
              (serverpodUserInfoId) async {
                if (serverpodUserInfoId != null) {
                  final profileId = await nitToolsCaller!.nitCrud
                      .getOneCustom(
                        className: 'UserProfile',
                        filter: nit_tools.NitBackendFilter<int>.value(
                          type: nit_tools.NitBackendFilterType.equals,
                          fieldName: 'userId',
                          fieldValue: serverpodUserInfoId,
                        ),
                      )
                      .then(
                        (response) => ref.processApiResponse<int>(response),
                      );

                  return userIdMode == UserIdMode.userProfileId
                      ? profileId
                      : serverpodUserInfoId;
                }
                return null;
              },
        );

    if (nitAuthConfig != null) NitAuthConfig.config = nitAuthConfig;

    return ref.read(nitSocketStateProvider.notifier).init(client: client);
  }
}
