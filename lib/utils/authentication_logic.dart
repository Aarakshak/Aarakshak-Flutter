import 'package:aarakshak/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

Future<void> authenticate(BuildContext context) async {
  final localAuth = LocalAuthentication();

  bool canCheckBiometrics = await localAuth.canCheckBiometrics;
  if (canCheckBiometrics) {
    bool didAuthenticate = await localAuth.authenticate(
      localizedReason: 'Please authenticate to access the app.',
      options: const AuthenticationOptions(
        biometricOnly: true
      ),
    );

    if (didAuthenticate) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    } else {
      print("Failed");
    }
  } else {

  }
}
