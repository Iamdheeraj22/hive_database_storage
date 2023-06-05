import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:hive_local_database/model/teacher/teacher_model.dart';

class TeacherHiveDatabaseHandler {
  TeacherHiveDatabaseHandler._internal();

  ///Get the all students details
  static Future<List<TeacherModel>> getStudentList() async {
    final box = await Hive.openBox<TeacherModel>('teachers');
    List<TeacherModel> teachersList = box.values.toList();
    return teachersList;
  }

  static Future<void> addNewTeacher(TeacherModel model) async {
    final box = await Hive.openBox<TeacherModel>('teachers');
    try {
      box.add(model);
      log('Teacher successfully added in database');
    } catch (e) {
      log('Error :- $e');
    }
  }
}
