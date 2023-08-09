import 'dart:convert';

import 'package:aarakshak/controller/user_controller.dart';
import 'package:aarakshak/repository/user_repository.dart';
import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NFCCapturingScreen extends StatefulWidget {
  const NFCCapturingScreen({super.key});

  @override
  State<NFCCapturingScreen> createState() => _NFCCapturingScreenState();
}

class _NFCCapturingScreenState extends State<NFCCapturingScreen> {
  final Controller controller = Get.find();

  Future<void> nfcStart1() async {
    bool isNfcAvailable = await NfcManager.instance.isAvailable();
    if (isNfcAvailable) {
      NfcManager.instance.startSession(
        onDiscovered: (data) async {
          if (data != null) {
            print(data.data['nfca']['identifier']);
            Ndef? ndef = Ndef.from(data);
            if (ndef == null) {
              print('Tag is not compatible with NDEF');
            } else {
              await ndef.read().then((value) {
                value.records.forEach((element) async {
                  List<int> payloadBytes = element.payload;
                  String readablePayload = utf8.decode(payloadBytes);
                  print(readablePayload);
                  int startIndex = readablePayload.indexOf('{');
                  print(startIndex);
                  String jsonData = readablePayload.substring(startIndex);
                  Map<String, dynamic> dataMap = json.decode(jsonData);
                  print("Map: $dataMap");
                  controller.latitude = dataMap["latitude"];
                  controller.longitude = dataMap["longitude"];
                  controller.radius = dataMap["radius"];
                  if (controller.latitude != null &&
                      controller.longitude != null &&
                      controller.radius != null) {
                    if (controller.dayStarted.value == false) {
                      var response = await User().startDuty(
                          controller.badgeID.toString(),
                          controller.latitude!,
                          controller.longitude!,
                          controller.radius!);
                      if (response.statusCode == 200) {
                        print(response.statusCode);
                        print(response.body);
                        controller.dayStarted.value = true;
                        controller.update();
                        Get.back();
                      } else {
                        print(response.statusCode);
                        print(response.body);
                        Get.back();
                      }
                    } else if (controller.dayEnd.value == false) {
                      var response =
                          await User().endDuty(controller.badgeID.toString());
                      if (response.statusCode == 200) {
                        print(response.statusCode);
                        print(response.body);
                        controller.dayEnd.value = true;
                        controller.update();
                        Get.back();
                      } else {
                        print(response.statusCode);
                        print(response.body);
                        Get.back();
                      }
                    }
                  } else {
                    print("Retry");
                  }
                });
              });
            }
          }
        },
      );
    }
  }

  @override
  void initState() {
    nfcStart1();
    super.initState();
  }

  @override
  void dispose() {
    NfcManager.instance.stopSession();
    controller.longitude = null;
    controller.latitude = null;
    controller.radius = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileCardBackgroundColor,
      body: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.only(top: 40, right: 10),
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
