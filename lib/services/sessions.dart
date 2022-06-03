import 'dart:convert';
import 'package:http/http.dart' as http;

class Sessions {
  Future<String> getLogin(String username, String password) async {
    // var header = await getJwt();
    final response = await http.get(
        Uri.parse(
            'http://107.20.130.8/api/login/acces/${username}/${password}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      return "Se accedio correctamente";
    } else {
      return "0";
    }
  }

  Future<String> getSignUP(
      String username, String password, String phone) async {
    final response = await http.get(
      Uri.parse(
          'http://54.221.104.210/api/register/acces/${username}/${password}/${phone}'),
    );
    print(response.statusCode);
    print(response.body);

    if (response.body == "true") {
      return "Se agrego correctamente";
    } else {
      return "0";
    }
  }
}
