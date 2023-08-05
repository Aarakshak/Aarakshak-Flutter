import 'dart:convert';

import 'package:aarakshak/controller/user_controller.dart';
import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:aarakshak/widgets/session_screen_bottom_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../repository/user_repository.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  String initialValue = "Month";
  final Controller controller = Get.find();
  bool _isLoading = false;

  fetchData() async {
    setState(() {
      _isLoading = false;
    });

    final response = await User().previousSessions(controller.badgeID.toString());
    final data = jsonDecode(response.body);

    List<dynamic> previousSessions = data['previousSessions'];

    for (var session in previousSessions) {
      String location = session['location'];
      String date = session['date'];
      String day = session['day'];
      bool attended = session['attended'];

      print('Location: $location');
      print('Date: $date');
      print('Day: $day');
      print('Attended: $attended');
      print('---');
    }

    print(data);
    setState(() {
      _isLoading = true;
    });
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
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/profile.svg',
              height: kToolbarHeight * 0.5,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ANIL RATHORE",
                  style: TextStyle(
                    color: AppColors.profileCardBackgroundColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "Head Constable",
                  style: TextStyle(
                    color: AppColors.profileCardBackgroundColor,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          SvgPicture.asset(
            'assets/images/download.svg',
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body:_isLoading == true
          ? SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '83',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '%',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' Attendance',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '26',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: ' Days',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "of 31 Days",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: CircularProgressIndicator(
                              value: 0.83,
                              strokeWidth: 7,
                              color: AppColors.profileCardBackgroundColor,
                              backgroundColor: AppColors.circularBackground,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        color: AppColors.profileCardBackgroundColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: const Text(
                            'Select an option',
                            style: TextStyle(color: Colors.white70),
                          ),
                          dropdownColor: AppColors.profileCardBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                          icon: const Icon(
                            Icons.arrow_drop_down_circle_rounded,
                            color: Colors.white,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          isExpanded: true,
                          value: initialValue,
                          onChanged: (newValue) {
                            initialValue = newValue!;
                            setState(() {});
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'Month',
                              child: Text('Month'),
                            ),
                            DropdownMenuItem(
                              value: '3 Month',
                              child: Text('3 Month'),
                            ),
                            DropdownMenuItem(
                              value: '6 Month',
                              child: Text('6 Month'),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "Previous Sessions",
                style: TextStyle(
                  color: AppColors.blackText,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SessionScreenBottomList(),
            ],
          ),
        ),
      ):const Center(child: CircularProgressIndicator()),
    );
  }
}
