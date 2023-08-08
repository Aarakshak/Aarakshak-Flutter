import 'dart:convert';

import 'package:aarakshak/repository/user_repository.dart';
import 'package:aarakshak/screens/dashboard.dart';
import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../controller/user_controller.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});
  final Controller controller = Get.find();
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
            Pinput(
              length: 6,
              onCompleted: (data) async {
                final response = await User().otpVerify(
                  data.toString(),
                  controller.badgeID!,
                );
                print(response.body);
                if (response.statusCode >= 300 || response.statusCode < 200) {
                  var data = jsonDecode(response.body);
                } else {
                  var data = jsonDecode(response.body);
                  FlutterSecureStorage storage = const FlutterSecureStorage();
                  await storage.write(
                      key: "badgeID", value: data["badgeID"].toString());
                  await storage.write(
                      key: "token", value: data["token"].toString());
                  Get.off(const Dashboard());
                }
              },
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
