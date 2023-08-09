import 'dart:convert';

import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';
import '../repository/user_repository.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  final Controller controller = Get.find();
  bool _isLoading = false;
  List abc = [];

  fetchData() async {
    setState(() {
      _isLoading = false;
    });
    final response = await User().alerts(controller.badgeID.toString());
    print(response.body);
    var data = jsonDecode(response.body);
    abc = data[0];
    print(abc);
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
        backgroundColor: Colors.white,
      ),
      body: _isLoading == true
          ? SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Upcoming Sessions",
                      style: TextStyle(
                        color: AppColors.blackText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: abc.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        DateTime parsedDate = DateTime.parse(abc[0]["startTime"]);
                        String formattedDate = '${parsedDate.year.toString().substring(2)}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}';
                        return Container(
                          height: 65,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          margin: const EdgeInsets.symmetric(vertical: 8),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${abc[index]["sessionLocation"]}",
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    formattedDate,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${abc[index]["description"]}",
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  const Text(
                                    "Day",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
