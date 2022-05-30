import 'dart:convert';
import 'package:http/http.dart' as http;

class Sessions {
  Future<String> getLogin(String username, String password) async {
    var header = await getJwt();
    final response = await http.post(
      Uri.parse('http://dev.memry.feelycom.com/rmnd/api/access/log-in'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': header
      },
      body: jsonEncode(<String, String>{
        'email': username,
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
    var header = await getJwt();
    final response = await http.post(
      Uri.parse('http://dev.memry.feelycom.com/rmnd/api/access/sign-in'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': header
      },
      body: jsonEncode(<String, String>{
        'email': username,
        'password': password,
        'phone': phone,
      }),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 201) {
      return "Se agrego correctamente";
    } else {
      return "0";
    }
  }

  Future<String> getJwt() async {
    final response = await http.post(
      Uri.parse('http://dev.memry.feelycom.com/rmnd/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        "username": "webclient",
        "password": "Th3Fl1RtRPa55W0rd"
      }),
    );

    if (response.statusCode == 200) {
      int contador = 0;
      String token = "";
      for (var head in response.headers.values) {
        if (contador == 6) {
          token = head;
        }
        contador++;
      }
      return token;
    } else {
      return "0";
    }
  }
}
