import 'package:flutter/material.dart';
import 'package:proyect_test/pages/login/login.dart';
import 'package:proyect_test/pages/singIn/sing_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "login",
      title: "entry test",
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        'singIn': (context) => const SingInScreen(),
        'login': (context) => const LoginScreen(),
      },
    );
  }
}
