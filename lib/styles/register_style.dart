import 'package:flutter/material.dart';

class RegisterStyle {
  InputDecoration formPhoneStyle = InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: Colors.blue, width: 2.0),
    ),
    prefixIcon: const Icon(
      Icons.phone_android,
      color: Colors.blue,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    hintText: 'Enter the phone',
  );

  InputDecoration formUserStyle = InputDecoration(
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
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    hintText: 'Enter your email',
  );

}
