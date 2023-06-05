import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            minimumSize: const Size(200, 50),
            padding: EdgeInsets.zero),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ));
  }
}
