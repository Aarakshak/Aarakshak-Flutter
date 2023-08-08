import 'package:aarakshak/screens/dashboard.dart';
import 'package:aarakshak/utils/authentication_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';
import '../ui_components/colors/color_code.dart';

class BiometricScreen extends StatefulWidget {
  const BiometricScreen({super.key});

  @override
  State<BiometricScreen> createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  final Controller controller = Get.put(Controller());
  Future<void> bringFingerPrint() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? authToken = await storage.read(key: "token");
    String? badgeID = await storage.read(key: "badgeID");
    await Future.delayed(const Duration(milliseconds: 1000));
    controller.badgeID = int.parse(badgeID!);
    await authenticate(const Dashboard());
  }

  @override
  void initState() {
    bringFingerPrint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileCardBackgroundColor,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 70),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Verify your Identity",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff062D61),
              ),
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  heightFactor: 0.7,
                  child: SvgPicture.asset(
                    'assets/images/fingerprint.svg',
                  ),
                ),
              ),
            ),
            Text(
              "Place your finger on the sensor",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
