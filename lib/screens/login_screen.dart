import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:flutter/material.dart';

import '../controller/authentication_logic.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                              decoration: InputDecoration(
                                labelText: 'Username',
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
              GestureDetector(
                onTap: () async {
                  await authenticate(context);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
