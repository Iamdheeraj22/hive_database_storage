import 'dart:developer';

import 'package:hive/hive.dart';

import '../model/student/student_model.dart';

class StudentHiveDataBaseHelper {
  StudentHiveDataBaseHelper._internal();

  ///All methods of student database management
  /// Add new student
  /// Update student details
  /// Get the all students data
  /// Delete student details

  ///Get the all students details
  static Future<List<StudentModel>> getStudentList() async {
    final box = await Hive.openBox<StudentModel>('students');
    List<StudentModel> studentsList = box.values.toList();
    return studentsList;
  }

  static Future<void> studentOperation(
      StudentOperation operation, StudentModel? studentModel,
      {int? index}) async {
    var box = await Hive.openBox<StudentModel>('students');
    final Map<dynamic, StudentModel> deliveriesMap = box.toMap();
    if (operation == StudentOperation.add && studentModel != null) {
      try {
        box.add(studentModel);
        log('Student successfully added in database');
      } catch (e) {
        log('Error :- $e');
      }
      return;
    }
    if (operation == StudentOperation.update && studentModel != null) {
      try {
        dynamic desiredKey;
        deliveriesMap.forEach((key, value) {
          if (value == studentModel) {
            desiredKey = key;
          }
        });
        if (index != null) {
          box.putAt(index, studentModel);
        }
        log('Student successfully updated in database');
      } catch (e) {
        log('Error :- $e');
      }
      return;
    }
    if (operation == StudentOperation.delete) {
      try {
        dynamic desiredKey;
        deliveriesMap.forEach((key, value) {
          if (value == studentModel) desiredKey = key;
        });
        box.delete(desiredKey);
        log('Student successfully deleted into database');
      } catch (e) {
        log('Error :- $e');
      }
      return;
    }
    if (operation == StudentOperation.deleteAll) {
      try {
        box.deleteAll(deliveriesMap.keys);
        log('Student successfully deleted all into database');
      } catch (e) {
        log('Error :- $e');
      }
    }
  }

  static Future<void> addMultipleStudents(List<StudentModel> students) async {
    var box = await Hive.openBox<StudentModel>('students');
    try {
      for (var student in students) {
        box.add(student);
      }
      log('All Students successfully added in database');
    } catch (e) {
      log('Error :- $e');
    }
  }
}

enum StudentOperation { add, update, delete, deleteAll }
