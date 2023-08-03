import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String baseUrl = "https://violet-kitten-toga.cyclic.cloud/v1";

  Future<http.Response> login(String email, String password) async {
    Uri loginUri = Uri.parse("$baseUrl/user/login");
    final response = await http.post(
      loginUri,
      body: jsonEncode(
        {
          "emailId": email,
          "password": password,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print(response.body);
    return response;
  }

  Future<http.Response> otpVerify(String otp, int badgeID) async {
    Uri otpVerify = Uri.parse("$baseUrl/user/verify-otp");
    final response = await http.post(
      otpVerify,
      body: jsonEncode({
        "badgeID": badgeID,
        "otp": otp,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<http.Response> userScreen(String userID) async {
    Uri loginUri = Uri.parse("$baseUrl/user/$userID");
    final response = await http.get(loginUri);
    print(response);
    return response;
  }

  Future<http.Response> currentSessionDetails(String userID) async {
    Uri loginUri = Uri.parse("$baseUrl/23456/current-session");
    final response = await http.get(loginUri);
    return response;
  }
}
