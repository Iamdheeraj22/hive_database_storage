import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      required this.data,
      this.fontWeight,
      this.textColor,
      this.fontSize})
      : super(key: key);
  final String data;
  final FontWeight? fontWeight;
  final Color? textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.w400,
          fontSize: fontSize ?? 14,
          color: textColor ?? Colors.black),
    );
  }
}
