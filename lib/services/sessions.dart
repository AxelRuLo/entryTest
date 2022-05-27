import 'dart:convert';
import 'package:http/http.dart' as http;


class Sessions {
  Future<String> getLogin(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://dev.memry.feelycom.com/rmnd/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return "Se accedio correctamente";
    } else {
      return "0";
    }
  }

  Future<String> getSignUP(
      String username, String password, String phone) async {
    final response = await http.post(
      Uri.parse('http://dev.memry.feelycom.com/rmnd/api/access/sign-in'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ3ZWJjbGllbnQiLCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoiUk9MRV9NT0JJTEVfQ0xJRU5UIn1dLCJpYXQiOjE2NTMzNTk3ODYsImV4cCI6MTY1NDIxNDQwMH0.4gkFw2pRX5S2kCTQK62myjpIKDGmjn_2gBCkb2TAi-3A7XxUfki-iLplipXJur_FjUkmcJvTbVu2rKsd1Eox9w'
      },
      body: jsonEncode(<String, String>{
        'email': username,
        'password': password,
        'phone': phone,
      }),
    );

    if (response.statusCode == 201) {
      return "Se agrego correctamente";
    } else {
      return "0";
    }
  }
}
