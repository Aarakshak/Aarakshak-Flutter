import 'package:aarakshak/controller/user_controller.dart';
import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    return Obx(
      () => Scaffold(
        body: controller.screen(),
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: const Duration(milliseconds: 250),
          color: AppColors.navbarColor,
          backgroundColor: Colors.transparent,
          items: <Widget>[
            Container(
              padding: controller.index.value == 0
                  ? null
                  : const EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/images/home_outlined.svg',
                    color: Colors.white,
                  ),
                  controller.index.value == 0
                      ? Container()
                      : const Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                ],
              ),
            ),
            Container(
              padding: controller.index.value == 1
                  ? null
                  : const EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/images/bell_outlined.svg',
                    color: Colors.white,
                  ),
                  controller.index.value == 1
                      ? Container()
                      : const Text(
                          "Alerts",
                          style: TextStyle(color: Colors.white),
                        ),
                ],
              ),
            ),
            Container(
              padding: controller.index.value == 2
                  ? null
                  : const EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/images/session_outlined.svg',
                    color: Colors.white,
                  ),
                  controller.index.value == 2
                      ? Container()
                      : const Text(
                          "Sessions",
                          style: TextStyle(color: Colors.white),
                        ),
                ],
              ),
            ),
          ],
          onTap: (index) {
            controller.change(index);
          },
        ),
      ),
    );
  }
}
