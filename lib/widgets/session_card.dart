import 'package:aarakshak/screens/bottomsheet.dart';
import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          builder: (BuildContext context) {
            return const CurrentSession();
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xa5ab8ee3)),
          color: const Color(0x11ab8ee3),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ramlila Ground",
                        style: TextStyle(
                          color: AppColors.blackText,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Chandni Chowk",
                        style: TextStyle(
                          color: AppColors.blackText,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "15 April, 2023",
                    style: TextStyle(
                      color: AppColors.blackText,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "Check-in: 05:00 pm",
                    style: TextStyle(
                      color: AppColors.blackText,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              'assets/images/tap_nfc.svg',
            ),
          ],
        ),
      ),
    );
  }
}
