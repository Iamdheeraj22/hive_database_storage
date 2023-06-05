import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_local_database/custom_widgets/custom_textfield.dart';
import 'package:hive_local_database/custom_widgets/text_widget.dart';
import 'package:hive_local_database/model/subject/subject_model.dart';
import 'package:hive_local_database/model/teacher/teacher_model.dart';
import 'package:hive_local_database/res/app_strings.dart';
import 'package:hive_local_database/screens/teacher/widgets/choose_class_teacher_dropdown.dart';

class AddSubjectBottomSheet extends StatefulWidget {
  const AddSubjectBottomSheet(
      {Key? key, required this.onDataSubmit, this.model})
      : super(key: key);
  final Function(String name, TeacherModel model) onDataSubmit;
  final SubjectModel? model;
  @override
  State<AddSubjectBottomSheet> createState() => _AddSubjectBottomSheetState();
}

class _AddSubjectBottomSheetState extends State<AddSubjectBottomSheet> {
  final TextEditingController _subjectName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  TeacherModel? selectedTeacher;

  @override
  void initState() {
    super.initState();
    if (widget.model != null) {
      _subjectName.text = widget.model!.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextWidget(
                data: AppStrings.kAddSubject,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  hintText: AppStrings.kEnterTheSubjectName,
                  controller: _subjectName,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return 'Please type name of class batch!';
                    }
                  },
                  label: AppStrings.kSubjectName),
              const SizedBox(
                height: 10,
              ),
              TeacherSelectionDropdown(
                editTeacher:
                    widget.model != null ? widget.model!.subjectTeacher : null,
                labelText: AppStrings.kSubjectTeacher,
                onTeacherChanged: (teacher) {
                  selectedTeacher = teacher;
                  log('Selected teacher :- $teacher');
                },
                selectedTeacher: (teacher) {
                  if (teacher != null) {
                    return null;
                  } else {
                    return 'Please select subject teacher!';
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      if (widget.model != null) {
                        widget.onDataSubmit(_subjectName.text.toString(),
                            widget.model!.subjectTeacher);
                        return;
                      }
                      widget.onDataSubmit(
                          _subjectName.text.toString(), selectedTeacher!);
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const TextWidget(
                    textColor: Colors.white,
                    data: AppStrings.kAddSubject,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
