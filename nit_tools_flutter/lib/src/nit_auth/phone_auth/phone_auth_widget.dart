import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../config/nit_auth_config.dart';
import 'state/phone_auth_state.dart';
import 'widgets/otp_verification_widget.dart';
import 'widgets/phone_input_widget.dart';

class PhoneAuthWidget extends HookConsumerWidget {
  const PhoneAuthWidget({super.key, this.onSuccess, this.extraParams});

  final Function()? onSuccess;
  final Map<String, String>? extraParams;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(phoneAuthStateProvider);

    // final t = ref.read(navigationPathParametersProvider);

    // final t2 = ref.read(navigationPathParametersProvider);
    // final t = ref.read(NitAuthConfig.config.authExtraParamsProvider!);
    // final extra = NitAuthConfig.config.authExtraParamsProvider == null
    //     ? null
    //     : ref.watch(NitAuthConfig.config.authExtraParamsProvider!);

    return state.otpRequested
        ? OtpVerificationWidget(onSuccess: onSuccess)
        : PhoneInputWidget(extraParams: extraParams);
  }
}
