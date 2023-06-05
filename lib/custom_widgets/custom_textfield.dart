import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.inputType,
      this.inputAction,
      this.validator,
      required this.label,
      this.maxLines,
      this.minLines,
      this.onTextChanged})
      : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String label;
  final String? Function(String? value)? validator;
  final int? maxLines;
  final int? minLines;
  final Function(String)? onTextChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
            validator: validator,
            controller: controller,
            textInputAction: inputAction ?? TextInputAction.done,
            keyboardType: inputType ?? TextInputType.text,
            maxLines: maxLines ?? 1,
            onChanged: onTextChanged,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Colors.blue,
            decoration: InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey)),
                hintText: hintText ?? 'Enter the value',
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: InputBorder.none)),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
