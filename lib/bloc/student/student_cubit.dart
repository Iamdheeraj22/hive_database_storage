import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_local_database/custom_widgets/snack_bar.dart';
import 'package:hive_local_database/hive%20local%20database/student_hive_utils.dart';
import 'package:hive_local_database/model/student/student_model.dart';

part 'student_cubit.freezed.dart';
part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(const StudentState());

  void getStudents() async {
    emit(state.copyWith(
        students: [...await StudentHiveDataBaseHelper.getStudentList()]));
  }

  void addStudent(StudentModel model, BuildContext context) {
    StudentHiveDataBaseHelper.studentOperation(StudentOperation.add, model);
    getStudents();
    Navigator.pop(context);
    showSnackBar('Student details added successfully...', context);
  }

  void updateStudentDetails(
      StudentModel model, BuildContext context, int index) {
    StudentHiveDataBaseHelper.studentOperation(StudentOperation.update, model,
        index: index);
    getStudents();
    Navigator.pop(context);
    showSnackBar('Student details updated successfully...', context);
  }

  void deleteStudentDetails(StudentModel model, BuildContext context) {
    StudentHiveDataBaseHelper.studentOperation(StudentOperation.delete, model);
    getStudents();
    showSnackBar('Student details deleted successfully...', context);
  }

  void deleteAllStudentsDetails(BuildContext context) {
    StudentHiveDataBaseHelper.studentOperation(
        StudentOperation.deleteAll, null);
    getStudents();
    showSnackBar('Student details deleted successfully...', context);
  }
}
