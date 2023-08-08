import 'dart:convert';
import 'dart:typed_data';

import 'package:aarakshak/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../ui_components/colors/color_code.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard(
      {Key? key, required this.rank, required this.badgeNo, required this.name})
      : super(key: key);
  final String rank;
  final String? badgeNo;
  final String name;

  final Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.profileCardBackgroundColor,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rank",
                        style: TextStyle(
                          color: AppColors.whiteText,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        rank,
                        style: TextStyle(
                            color: AppColors.whiteText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Badge No.",
                        style:
                            TextStyle(color: AppColors.whiteText, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        badgeNo ?? "XXXXXX",
                        style: TextStyle(
                            color: AppColors.whiteText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.profilePic == null
                  ? CircleAvatar(
                      radius: 62,
                      backgroundColor: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 1.5),
                        child: SvgPicture.asset(
                          'assets/images/blank_image.svg',
                          alignment: Alignment.center,
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 62,
                      backgroundColor: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(1.8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(62),
                          child: Image.memory(
                            Uint8List.fromList(
                              base64Decode(
                                  controller.profilePic!.split(",").last),
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(
                    color: AppColors.whiteText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
