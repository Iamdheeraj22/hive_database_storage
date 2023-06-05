import 'package:flutter/material.dart';
import 'package:hive_local_database/custom_widgets/custom_textfield.dart';
import 'package:hive_local_database/custom_widgets/text_widget.dart';
import 'package:hive_local_database/res/app_strings.dart';

class AddStudent extends StatefulWidget {
  const AddStudent(
      {Key? key, required this.onDataSubmit, required this.onCancel})
      : super(key: key);
  final Function(
          String name, String fatherName, String motherName, int classStandard)
      onDataSubmit;
  final VoidCallback onCancel;
  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _classStandardController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          data: AppStrings.kAddNewStudent,
          fontSize: 17,
          textColor: Colors.white,
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: _nameController,
                  label: 'Student Name',
                  validator: validator,
                  inputAction: TextInputAction.next,
                ),
                CustomTextField(
                  controller: _fatherNameController,
                  label: AppStrings.kStudentFatherName,
                  inputAction: TextInputAction.next,
                  validator: validator,
                ),
                CustomTextField(
                  controller: _motherNameController,
                  label: AppStrings.kStudentMotherName,
                  inputAction: TextInputAction.next,
                  validator: validator,
                ),
                CustomTextField(
                  controller: _classStandardController,
                  label: AppStrings.kStudentClassStandard,
                  inputAction: TextInputAction.done,
                  validator: validator,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: widget.onCancel,
                        child: const Text('Cancel')),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            widget.onDataSubmit(
                                _nameController.text.trim(),
                                _fatherNameController.text.toString(),
                                _motherNameController.text.toString(),
                                int.parse(_classStandardController.text));
                          }
                        },
                        child: const Text('Add student Details')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return 'Please fill the field details!';
    }
  }
}
