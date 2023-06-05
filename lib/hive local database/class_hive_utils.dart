import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:hive_local_database/model/class/class_batch_model.dart';

class ClassHiveDatabaseHelper {
  ClassHiveDatabaseHelper._internal();

  ///Get all classes
  static Future<List<ClassBatchModel>> getClassBatches() async {
    final box = await Hive.openBox<ClassBatchModel>('classes');
    List<ClassBatchModel> classBatchesList = box.values.toList();
    return classBatchesList;
  }

  static Future<void> addNewClassBatch(ClassBatchModel classBatchModel) async {
    final box = await Hive.openBox<ClassBatchModel>('classes');
    try {
      box.add(classBatchModel);
      log('Class batch successfully added in database!');
    } catch (e) {
      log('Error :- $e');
    }
  }
}
