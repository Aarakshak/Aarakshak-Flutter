import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NFCModeOn extends StatelessWidget {
  const NFCModeOn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileCardBackgroundColor,
      body: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.only(top: 40,right: 10),
              child: SvgPicture.asset(
                'assets/images/circular_close.svg',
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff062D61),
                  ),
                  child: Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      heightFactor: 0.5,
                      child: SvgPicture.asset(
                        'assets/images/nfc_icon.svg',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Hold your phone onto the tag",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
