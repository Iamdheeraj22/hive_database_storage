import 'package:flutter/material.dart';
import 'package:hive_local_database/custom_widgets/custom_textfield.dart';
import 'package:hive_local_database/custom_widgets/text_widget.dart';
import 'package:hive_local_database/hive%20local%20database/teacher_hive_utils.dart';
import 'package:hive_local_database/model/teacher/teacher_model.dart';
import 'package:hive_local_database/res/app_strings.dart';

class AddTeacherPage extends StatefulWidget {
  const AddTeacherPage({Key? key}) : super(key: key);
  static const String id = '/add_teacher';
  @override
  State<AddTeacherPage> createState() => _AddTeacherPageState();
}

class _AddTeacherPageState extends State<AddTeacherPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _expController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add new teacher',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: AppStrings.kTEnterName,
                  controller: _nameController,
                  label: AppStrings.kTeacherName,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return AppStrings.kEnterTeacherName;
                    }
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  hintText: AppStrings.kTEnterSubjectName,
                  controller: _subjectController,
                  label: AppStrings.kSubjectName,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return AppStrings.kPleaseEnterSubjectName;
                    }
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  hintText: AppStrings.kTEnterGrade,
                  controller: _gradeController,
                  label: AppStrings.kTeacherGrade,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return AppStrings.kPleaseEnterGrade;
                    }
                  },
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  hintText: AppStrings.kTEnterTotalExp,
                  controller: _expController,
                  label: AppStrings.kTeacherExperience,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return AppStrings.kPleaseEnterExp;
                    }
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const TextWidget(
                          data: AppStrings.kCancel,
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            TeacherHiveDatabaseHandler.addNewTeacher(
                                TeacherModel(
                                    name: _nameController.text.trim(),
                                    subject: _subjectController.text.trim(),
                                    grade: _gradeController.text.trim(),
                                    experience:
                                        int.parse(_expController.text.trim())));
                            Navigator.pop(context);
                          }
                        },
                        child: const TextWidget(
                          data: AppStrings.kSubmitDetails,
                          textColor: Colors.white,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
