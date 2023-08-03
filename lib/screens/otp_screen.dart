import 'dart:convert';

import 'package:aarakshak/repository/user_repository.dart';
import 'package:aarakshak/screens/homepage.dart';
import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:flutter/material.dart';
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
                if(response.statusCode != 200){

                } else {
                  var responseData = jsonDecode(response.body);
                  print(responseData);
                  Get.off(const HomePage());
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
