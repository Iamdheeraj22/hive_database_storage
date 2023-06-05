import 'package:flutter/material.dart';

showSnackBar(String data, BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      elevation: 0.0,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      content: Text(
        data,
        style: const TextStyle(fontSize: 15, color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    ),
  );
}
