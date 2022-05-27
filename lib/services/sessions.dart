import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyect_test/services/models/login_model.dart';

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
      return "Credenciales invalidas";
    }
  }

    Future<String> getSignUP(String username, String password,String phone) async {
    final response = await http.post(
      Uri.parse('http://dev.memry.feelycom.com/rmnd/api/access/sign-in'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': username,
        'password': password,
        'phone': phone,
      }),
    );

    print(response.body);
    print(response);
    if (response.statusCode == 201) {
      return "Se agrego correctamente";
    } else {
      return "no se pudo agregar";
    }
  }
}
