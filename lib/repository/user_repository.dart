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
    Uri userScreenData = Uri.parse("$baseUrl/user/$userID");
    final response = await http.get(userScreenData);
    return response;
  }

  Future<http.Response> currentSessionDetails(String userID) async {
    Uri currentSessionDetailsData =
        Uri.parse("$baseUrl/user/$userID/current-session");
    final response = await http.get(currentSessionDetailsData);
    return response;
  }

  Future<http.Response> alerts(String userID) async {
    Uri alerts = Uri.parse("$baseUrl/user/$userID/upcoming-sessions");
    final response = await http.get(alerts);
    return response;
  }

  Future<http.Response> previousSessions(String userID) async {
    Uri previousSessions = Uri.parse("$baseUrl/user/$userID/previous-sessions");
    final response = await http.get(previousSessions);
    return response;
  }

  Future<http.Response> startDuty(String userID) async {
    Uri startDutyUri = Uri.parse("$baseUrl/user/start-duty/3");

    var requestBody = {
      "latitude": 123.456,
      "longitude": 789.012,
      "radius": 100.0, // Change to a double value
    };

    final response = await http.post(
      startDutyUri,
      body: jsonEncode(requestBody), // Use jsonEncode to serialize the request body
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
