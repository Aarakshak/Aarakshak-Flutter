import 'package:aarakshak/screens/alertScreen.dart';
import 'package:aarakshak/screens/homepage.dart';
import 'package:aarakshak/screens/sessionScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  var index = 0.obs;
  change(int value) => index.value = value;

  // User Details
  int? badgeID;
  String? firstName;
  String? lastName;
  String? rank;
  List sessions = [];

  // Current Session Data
  DateTime? checkInTime;
  DateTime? checkOutTime;
  String? location1;

  Widget screen() {
    if (index.value == 0) {
      return const HomePage();
    } else if (index.value == 1) {
      return const AlertScreen();
    } else {
      return const SessionsScreen();
    }
  }
}