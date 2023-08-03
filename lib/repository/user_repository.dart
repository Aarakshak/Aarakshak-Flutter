import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String baseUrl = "https://helpful-calf-earmuffs.cyclic.cloud/v1";

  Future<http.Response> login(String email, String password) async {
    Uri loginUri =
        Uri.parse("$baseUrl/user/login");
    final response = await http.post(
      loginUri,
      body: jsonEncode(
        {
          "emailId": "chinmayagarwal4@gmail.com",
          "password": "12345",
        },
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return response;
  }

  Future<http.Response> otpVerify(String otp, String badgeID) async {
    Uri loginUri = Uri.parse("$baseUrl/verify-otp");
    final response =
        await http.post(loginUri, body: {"badgeID": 34567, "otp": "109665"});
    return response;
  }

  Future<http.Response> userScreen(String userID) async {
    Uri loginUri = Uri.parse("$baseUrl/23456");
    final response = await http.get(loginUri);
    return response;
  }

  Future<http.Response> currentSessionDetails(String userID) async {
    Uri loginUri = Uri.parse("$baseUrl/23456/current-session");
    final response = await http.get(loginUri);
    return response;
  }
}
