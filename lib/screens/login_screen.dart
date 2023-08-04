import 'dart:convert';

import 'package:aarakshak/controller/user_controller.dart';
import 'package:aarakshak/screens/biometric_capturing_screen.dart';
import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/user_repository.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController policeID = TextEditingController();
  final TextEditingController password = TextEditingController();
  final Controller controller = Get.put(Controller());
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.profileCardBackgroundColor,
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 235,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Police ID",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.profileCardBackgroundColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextField(
                              controller: policeID,
                              decoration: InputDecoration(
                                labelText: 'Police ID',
                                labelStyle: TextStyle(
                                  color: AppColors.profileCardBackgroundColor
                                      .withOpacity(0.4),
                                  fontWeight: FontWeight.bold,
                                ),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Color(0xff056ABB),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.profileCardBackgroundColor,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextField(
                              controller: password,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: AppColors.profileCardBackgroundColor
                                      .withOpacity(0.4),
                                  fontWeight: FontWeight.bold,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: AppColors.profileCardBackgroundColor,
                                ),
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              ValueListenableBuilder<bool>(
                  valueListenable: _isLoading,
                  builder: (context, isLoading, child) {
                    if (isLoading) {
                      return const CircularProgressIndicator();
                    } else {
                      return GestureDetector(
                        onTap: () async {
                          _isLoading.value = true;
                          final response =
                              await User().login(policeID.text, password.text);
                          var data = jsonDecode(response.body);
                          if (data["badgeID"] != null) {
                            controller.badgeID = data["badgeID"];
                            _isLoading.value = false;
                            Get.off(const BiometricScreen());
                          } else {
                            print(policeID.text);
                            print(password.text);
                            print(data);
                          }
                          _isLoading.value = false;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.profileCardBackgroundColor),
                          width: 230,
                          height: 55,
                          alignment: Alignment.center,
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    }
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
