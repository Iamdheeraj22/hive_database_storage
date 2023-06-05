import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_local_database/bloc/teacher/teacher_cubit.dart';
import 'package:hive_local_database/custom_widgets/text_widget.dart';
import 'package:hive_local_database/model/teacher/teacher_model.dart';
import 'package:hive_local_database/screens/teacher/add_teacher.dart';

class TeacherSelectionDropdown extends StatelessWidget {
  const TeacherSelectionDropdown(
      {Key? key,
      required this.onTeacherChanged,
      this.labelText,
      this.selectedTeacher,
      this.editTeacher})
      : super(key: key);
  final Function(TeacherModel?) onTeacherChanged;
  final String? labelText;
  final String? Function(TeacherModel?)? selectedTeacher;
  final TeacherModel? editTeacher;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => TeacherCubit(),
      child: ChooseClassTeacherDropdown(
        onTeacherChanged: onTeacherChanged,
        label: labelText,
        selectedTeacher: selectedTeacher,
        editTeacher: editTeacher,
      ),
    );
  }
}

class ChooseClassTeacherDropdown extends StatefulWidget {
  const ChooseClassTeacherDropdown(
      {Key? key,
      required this.onTeacherChanged,
      this.label,
      this.selectedTeacher,
      this.editTeacher})
      : super(key: key);
  final TeacherModel? editTeacher;
  final Function(TeacherModel?) onTeacherChanged;
  final String? label;
  final String? Function(TeacherModel?)? selectedTeacher;
  @override
  State<ChooseClassTeacherDropdown> createState() =>
      _ChooseClassTeacherDropdownState();
}

class _ChooseClassTeacherDropdownState
    extends State<ChooseClassTeacherDropdown> {
  @override
  void initState() {
    super.initState();
    context.read<TeacherCubit>().getAllTeachersDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          data: widget.label ?? 'Class Teacher',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<TeacherCubit, TeacherState>(
          builder: (context, state) {
            return DropdownButtonFormField<TeacherModel>(
                validator: widget.selectedTeacher,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5)),
                value: widget.editTeacher,
                hint: Text(
                  state.teachers.isEmpty
                      ? 'Please add the at least on teacher'
                      : 'Please select teacher!',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                icon: state.teachers.isEmpty
                    ? InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      const AddTeacherPage()));
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ))
                    : const Icon(Icons.keyboard_arrow_down),
                items: state.teachers
                    .map((e) => DropdownMenuItem<TeacherModel>(
                          value: e,
                          child: Text(
                            e.name ?? '',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ))
                    .toList(),
                onChanged: (v) {
                  if (v != null) {
                    widget.onTeacherChanged(v);
                  }
                });
          },
        ),
      ],
    );
  }
}
