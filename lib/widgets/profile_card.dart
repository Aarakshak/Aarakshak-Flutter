import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../ui_components/colors/color_code.dart';


class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

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
                        "Head Constable",
                        style: TextStyle(color: AppColors.whiteText, fontSize: 16,fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Badge No.",
                        style: TextStyle(color: AppColors.whiteText, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "XXXXXX",
                        style: TextStyle(color: AppColors.whiteText, fontSize: 16,fontWeight: FontWeight.w700),
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
                  CircleAvatar(
                    radius: 62,
                    backgroundColor: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 1.5),
                      child: SvgPicture.asset(
                        'assets/images/blank_image.svg',
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Text(
                    "ANIL RATHORE",
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
