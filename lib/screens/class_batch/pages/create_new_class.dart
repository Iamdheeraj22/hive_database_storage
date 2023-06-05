import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_local_database/bloc/class/class_cubit.dart';
import 'package:hive_local_database/custom_widgets/choose_section_dropdown.dart';
import 'package:hive_local_database/custom_widgets/custom_textfield.dart';
import 'package:hive_local_database/custom_widgets/snack_bar.dart';
import 'package:hive_local_database/custom_widgets/text_widget.dart';
import 'package:hive_local_database/hive%20local%20database/class_hive_utils.dart';
import 'package:hive_local_database/hive%20local%20database/student_hive_utils.dart';
import 'package:hive_local_database/model/class/class_batch_model.dart';
import 'package:hive_local_database/model/student/student_model.dart';
import 'package:hive_local_database/model/subject/subject_model.dart';
import 'package:hive_local_database/res/app_strings.dart';
import 'package:hive_local_database/screens/class_batch/pages/add_student_in_class.dart';
import 'package:hive_local_database/screens/class_batch/widgets/add_subject_bottomsheet.dart';
import 'package:hive_local_database/screens/class_batch/widgets/student_view.dart';
import 'package:hive_local_database/screens/class_batch/widgets/subject_view.dart';
import 'package:hive_local_database/screens/teacher/widgets/choose_class_teacher_dropdown.dart';

import '../../../model/teacher/teacher_model.dart';

class CreateClassBatch extends StatelessWidget {
  const CreateClassBatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => ClassCubit()),
    ], child: const CreateNewClassBatchPage());
  }
}

class CreateNewClassBatchPage extends StatefulWidget {
  const CreateNewClassBatchPage({Key? key}) : super(key: key);

  @override
  State<CreateNewClassBatchPage> createState() =>
      _CreateNewClassBatchPageState();
}

class _CreateNewClassBatchPageState extends State<CreateNewClassBatchPage> {
  final TextEditingController _batchStandardController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClassCubit, ClassState>(
      listener: (context, state) {
        log('${state.subjects}');
      },
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: Container(
              color: Colors.transparent,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    if (state.subjects.isEmpty) {
                      showSnackBar('Please add at least one subject!', context);
                      return;
                    }
                    if (state.students.isEmpty) {
                      showSnackBar('Please add at least one student!', context);
                      return;
                    }
                    ClassHiveDatabaseHelper.addNewClassBatch(ClassBatchModel(
                        classStandard: _batchStandardController.text.trim(),
                        classSection: state.sectionName,
                        classTeacher: state.classTeacher!,
                        subjects: state.subjects,
                        students: state.students));
                    StudentHiveDataBaseHelper.addMultipleStudents(
                        state.students);
                    showSnackBar(
                        'Class batch saved successfully in database!', context);
                    Navigator.pop(context);
                  }
                },
                child: const TextWidget(
                  data: AppStrings.kSubmitDetails,
                  textColor: Colors.white,
                ),
              ),
            ),
            appBar: AppBar(
              title: const Text(
                'Add new class batch',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              backgroundColor: Colors.blue,
              automaticallyImplyLeading: true,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: _batchStandardController,
                            onTextChanged: (v) {
                              context.read<ClassCubit>().classNameChanges(v);
                            },
                            label: 'Class Batch Standard',
                            hintText: 'Type a class batch standard!',
                            validator: (v) {
                              if (v != null && v.isNotEmpty) {
                                return null;
                              } else {
                                return 'Please enter class batch standard!';
                              }
                            },
                          ),
                          const Text(
                            'Section Name',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ChooseSectionDropdown(
                            onItemChanged: (v) {
                              context.read<ClassCubit>().changeSectionName(v);
                            },
                            validator: (v) {
                              if (v != null && v.isNotEmpty) {
                                return null;
                              } else {
                                return 'Please select the section name!';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TeacherSelectionDropdown(
                            onTeacherChanged: (teacher) {
                              if (teacher != null) {
                                context
                                    .read<ClassCubit>()
                                    .changeClassTeacher(teacher);
                                return;
                              }
                            },
                            selectedTeacher: (teacher) {
                              if (teacher != null) {
                                return null;
                              } else {
                                return 'Please select the class teacher!';
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    ///Subject List and button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget(
                          data: AppStrings.kSubjectsList,
                          fontSize: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                useSafeArea: true,
                                builder: (builder) {
                                  return AddSubjectBottomSheet(
                                    onDataSubmit: (String name,
                                        TeacherModel subjectTeacher) {
                                      context.read<ClassCubit>().addNewSubject(
                                          SubjectModel(
                                              name: name,
                                              subjectTeacher: subjectTeacher));

                                      Navigator.pop(context);
                                    },
                                  );
                                });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0.0,
                              shadowColor: Colors.transparent,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15)),
                          child: const Row(
                            children: [
                              Text('Add Subject'),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.add),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.subjects.length,
                        itemBuilder: (context, index) {
                          return SubjectView(
                            model: state.subjects[index],
                            index: index + 1,
                            onDelete: () {
                              context
                                  .read<ClassCubit>()
                                  .deleteStudentDetails(index);
                            },
                            onEdit: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  builder: (builder) {
                                    return AddSubjectBottomSheet(
                                        model: state.subjects[index],
                                        onDataSubmit: (String name,
                                            TeacherModel subjectTeacher) {
                                          context
                                              .read<ClassCubit>()
                                              .changeSubjectDetails(
                                                  SubjectModel(
                                                      name: name,
                                                      subjectTeacher:
                                                          subjectTeacher),
                                                  index);

                                          Navigator.pop(context);
                                        });
                                  });
                            },
                          );
                        }),

                    const SizedBox(
                      height: 10,
                    ),

                    ///Student List and button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Students List',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => AddStudent(
                                          onDataSubmit: (name, fatherName,
                                              motherName, classStandard) {
                                            context
                                                .read<ClassCubit>()
                                                .addStudent(StudentModel(
                                                    fullName: name,
                                                    fatherName: fatherName,
                                                    motherName: motherName,
                                                    classStandard: classStandard
                                                        .toString()));
                                            Navigator.pop(context);
                                          },
                                          onCancel: () {
                                            Navigator.pop(context);
                                          },
                                        )));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0.0,
                              shadowColor: Colors.transparent,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15)),
                          child: const Row(
                            children: [
                              Text('Add Student'),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.add),
                            ],
                          ),
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.students.length,
                      itemBuilder: (context, index) {
                        return StudentView(
                          model: state.students[index],
                          index: index + 1,
                        );
                      },
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
