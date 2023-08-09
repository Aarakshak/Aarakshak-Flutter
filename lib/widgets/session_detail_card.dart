import 'dart:convert';

import 'package:aarakshak/controller/user_controller.dart';
import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../repository/user_repository.dart';

class SessionDetailCard extends StatelessWidget {
   SessionDetailCard({super.key, required this.date});
  final String date;
  final Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 580,
        width: MediaQuery.of(context).size.width-30,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                    ),
                    child: Image.asset(
                      "assets/images/map_image.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: SvgPicture.asset(
                'assets/images/slider.svg',
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(40.0),
                ),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(top: 150),
              height: 450,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ramila Ground",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 24),
                              ),
                              Text("Chandni Chowk",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 16)),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            height: 70,
                            width: 80,
                            child: Column(
                              children: [
                                Container(
                                  height: 25,
                                  width: 80,
                                  color: const Color(0xff056ABB),
                                  child: const Center(
                                    child: Text(
                                      "APR",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: 80,
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("$date",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 24,
                                              color: AppColors
                                                  .profileCardBackgroundColor)),
                                      Text("Saturday",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              color: AppColors
                                                  .profileCardBackgroundColor)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/profile_circle.svg',
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Reporting to:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10)),
                                      Text("Satnam Singh",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("05:00 pm",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17)),
                                      Text("Check-in",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12)),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "09:00 pm",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        "Check-out",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                width: 200,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color(0xff50C878).withOpacity(0.10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "Checkpoint-1:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const Text(
                                      "06:30 pm",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/images/location_tick.svg',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                width: 200,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color(0xff056abb).withOpacity(0.10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "Checkpoint-2:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const Text(
                                      "08:00 pm",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/images/location_question.svg',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.profileCardBackgroundColor,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/info.svg',
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text("Raise an Issue",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                final response = await User().issues(controller.badgeID.toString(),controller.currentLat ?? 0,controller.currentLat ?? 0);
                                print(jsonDecode(response.body));
                              },
                              child: SvgPicture.asset(
                                'assets/images/sos.svg',
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
