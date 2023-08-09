import 'package:aarakshak/screens/biometric_capturing_screen.dart';
import 'package:aarakshak/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? authToken;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  if (prefs.getBool('first_run') ?? true) {
    await storage.delete(key: 'token');
    await storage.delete(key: 'badgeID');
    prefs.setBool('first_run', false);
  }
  authToken = await storage.read(key: "token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: authToken == null ? LoginScreen() : const BiometricScreen(),
    );
  }
}
