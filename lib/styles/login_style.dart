import 'package:flutter/material.dart';

class LoginStyle {
  InputDecoration userField = InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: Colors.blue, width: 2.0),
    ),
    prefixIcon: const Icon(
      Icons.people,
      color: Colors.blue,
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    hintText: 'Enter user',
  );
}
