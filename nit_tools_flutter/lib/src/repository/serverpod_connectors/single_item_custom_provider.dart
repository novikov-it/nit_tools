import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nit_tools_client/nit_tools_client.dart';
import 'package:nit_tools_flutter/nit_tools_flutter.dart';

final singleItemCustomProviderFamilies =
    <
      Type,
      AsyncNotifierProviderFamily<
        SingleItemCustomProviderState,
        int?,
        SingleItemCustomProviderConfig
      >
    >{};

AsyncNotifierProviderFamily<
  SingleItemCustomProviderState<T>,
  int?,
  SingleItemCustomProviderConfig
>
singleItemCustomProvider<T extends SerializableModel>() {
  if (singleItemCustomProviderFamilies[T] == null) {
    singleItemCustomProviderFamilies[T] = AsyncNotifierProviderFamily<
      SingleItemCustomProviderState<T>,
      int?,
      SingleItemCustomProviderConfig
    >(SingleItemCustomProviderState<T>.new);
  }

  return singleItemCustomProviderFamilies[T]
      as AsyncNotifierProviderFamily<
        SingleItemCustomProviderState<T>,
        int?,
        SingleItemCustomProviderConfig
      >;
}

class SingleItemCustomProviderState<T extends SerializableModel>
    extends FamilyAsyncNotifier<int?, SingleItemCustomProviderConfig> {
  @override
  Future<int?> build(SingleItemCustomProviderConfig arg) async {
    final globalTimestamp = ref.watch(globalRefreshTriggerProvider);

    debugPrint(
      "Getting single ${NitRepository.typeName<T>()} with id $arg with timestamp $globalTimestamp",
    );
    // final res = await ref.getAll<T>();
    // NitRepository.ensureDefaultDescriptor<T>();

    NitRepository.addUpdatesListener<T>(_updatesListener);

    return await nitToolsCaller!.nitCrud
        .getOneCustom(
          className: NitRepository.typeName<T>(),
          filter: arg.backendFilter,
        )
        .then((response) => ref.processApiResponse<int>(response))
        .then((res) => res);
  }

  void _updatesListener(List<ObjectWrapper> wrappedModelUpdates) async {
    return await future.then((value) async {
      state = AsyncValue.data(
        wrappedModelUpdates
                .where(
                  (e) =>
                      !e.isDeleted &&
                      (arg.backendFilter.filterUpdate(e.jsonSerialization)),
                )
                .map((e) => e.modelId!)
                .firstOrNull ??
            value,
      );
    });
  }
}
