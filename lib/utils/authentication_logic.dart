import 'package:aarakshak/screens/otp_screen.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

Future<void> authenticate() async {
  final localAuth = LocalAuthentication();

  bool canCheckBiometrics = await localAuth.canCheckBiometrics;
  if (canCheckBiometrics) {
    bool didAuthenticate = await localAuth.authenticate(
      localizedReason: 'Please authenticate to access the app.',
      options: const AuthenticationOptions(biometricOnly: true),
    );

    if (didAuthenticate) {
      Get.to(OTPScreen());
    } else {
      print("Failed");
    }
  } else {}
}
