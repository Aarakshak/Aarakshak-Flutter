import 'package:aarakshak/controller/user_controller.dart';
import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:aarakshak/widgets/profile_card.dart';
import 'package:aarakshak/widgets/session_card.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset(
          "assets/images/title.jpg",
        ),
        actions: [
          SvgPicture.asset(
            'assets/images/new.svg',
          ),
          const SizedBox(
            width: 20,
          ),
          SvgPicture.asset(
            'assets/images/bell.svg',
          ),
          const SizedBox(
            width: 20,
          ),
          SvgPicture.asset(
            'assets/images/profile.svg',
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            const ProfileCard(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Current Session",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            const SessionCard(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Local Events",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // shadow color
                          spreadRadius: 1, // how spread out the shadow is
                          blurRadius: 5, // blur radius of the shadow
                          offset: const Offset(
                              0, 3), // changes the position of the shadow
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // shadow color
                          spreadRadius: 2, // how spread out the shadow is
                          blurRadius: 5, // blur radius of the shadow
                          offset: const Offset(
                              0, 3), // changes the position of the shadow
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // shadow color
                          spreadRadius: 2, // how spread out the shadow is
                          blurRadius: 5, // blur radius of the shadow
                          offset: const Offset(
                              0, 3), // changes the position of the shadow
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
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
