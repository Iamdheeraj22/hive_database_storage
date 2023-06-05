import 'package:flutter/material.dart';
import 'package:hive_local_database/utils/temp_list.dart';

class ChooseSectionDropdown extends StatelessWidget {
  const ChooseSectionDropdown(
      {Key? key, required this.onItemChanged, this.validator})
      : super(key: key);
  final Function(String) onItemChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
        hint: const Text(
          'Please select section name!',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        items: sectionName
            .map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(
                    e,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ))
            .toList(),
        onChanged: (v) {
          if (v != null) {
            onItemChanged(v);
          }
        });
  }
}
