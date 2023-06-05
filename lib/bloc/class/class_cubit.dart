import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_local_database/model/student/student_model.dart';
import 'package:hive_local_database/model/subject/subject_model.dart';
import 'package:hive_local_database/model/teacher/teacher_model.dart';

part 'class_cubit.freezed.dart';
part 'class_state.dart';

class ClassCubit extends Cubit<ClassState> {
  ClassCubit() : super(const ClassState());

  ///This method invoked user first time appear on homepage and after creating new clas batch
  void addStudent(StudentModel studentModel) {
    emit(state.copyWith(students: [...state.students, studentModel]));
  }

  void deleteStudentDetails(int index) {
    List<SubjectModel> list = [];
    list.addAll(state.subjects);
    list.removeAt(index);
    emit(state.copyWith(subjects: list));
  }

  ///This method invoked when user change the subject details
  void changeSubjectDetails(SubjectModel subjectModel, int index) {
    log('${DateTime.now().millisecondsSinceEpoch}');
    List<SubjectModel> list = [];
    list.addAll(state.subjects);
    list.removeAt(index);
    list.insert(index, subjectModel);
    emit(state.copyWith(subjects: list));
    log('Subject details changed!');
    log('${DateTime.now().millisecondsSinceEpoch}');
  }

  void classNameChanges(String value) {
    emit(state.copyWith(className: value));
    log('Class Name :- ${state.className}');
  }

  void changeClassTeacher(TeacherModel model) {
    emit(state.copyWith(classTeacher: model));
  }

  void changeSectionName(String sectionName) {
    emit(state.copyWith(sectionName: sectionName));
    log('Class Name :- ${state.sectionName}');
  }

  void addNewSubject(SubjectModel subjectModel) {
    emit(state.copyWith(subjects: [...state.subjects, subjectModel]));
  }
}
