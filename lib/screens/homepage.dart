import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:aarakshak/widgets/profile_card.dart';
import 'package:aarakshak/widgets/current_session_card.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controller/user_controller.dart';
import '../repository/user_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller controller = Get.find();
  bool _isLoading = false;

  fetchData() async {
    setState(() {
      _isLoading = false;
    });

    if (controller.rank == null) {
      final response = await User().userScreen(controller.badgeID.toString());
      final data = jsonDecode(response.body);
      controller.rank = data["rank"];
      controller.firstName = data["firstName"];
      controller.lastName = data["surname"];
      controller.sessions = data["sessions"];
      controller.profilePic = data["profilePic"];
    }

    final response1 =
        await User().currentSessionDetails(controller.badgeID.toString());
    final data1 = await jsonDecode(response1.body);
    print(data1);
    if (data1["error"] == null || data1["error"].toString().isEmpty) {
      controller.checkInTime =
          DateTime.parse(data1["checkInTime"].replaceAll('Z', ''));
      controller.checkOutTime =
          DateTime.parse(data1["checkOutTime"].replaceAll('Z', ''));
      controller.location1 = data1["location1"];
    }

    setState(() {
      _isLoading = true;
    });
  }

  notification() async {
    print("Notification Permission Asking");
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
    print("Notification Permission Asked");
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        body: _isLoading == true
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ProfileCard(
                        rank: controller.rank!,
                        badgeNo: controller.badgeID.toString(),
                        name: "${controller.firstName} ${controller.lastName}"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Current Session",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const CurrentSessionCard(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Local Events",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
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
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
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
                                  color: Colors.grey
                                      .withOpacity(0.5), // shadow color
                                  spreadRadius:
                                      2, // how spread out the shadow is
                                  blurRadius: 5, // blur radius of the shadow
                                  offset: const Offset(0,
                                      3), // changes the position of the shadow
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
