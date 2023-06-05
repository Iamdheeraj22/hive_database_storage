import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_local_database/hive%20local%20database/teacher_hive_utils.dart';
import 'package:hive_local_database/model/teacher/teacher_model.dart';

part 'teacher_cubit.freezed.dart';
part 'teacher_state.dart';

class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(const TeacherState());

  void getAllTeachersDetails() async {
    emit(state.copyWith(
        teachers: await TeacherHiveDatabaseHandler.getStudentList()));
  }
}
