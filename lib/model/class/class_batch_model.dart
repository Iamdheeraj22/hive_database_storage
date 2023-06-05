import 'package:hive/hive.dart';
import 'package:hive_local_database/model/student/student_model.dart';
import 'package:hive_local_database/model/subject/subject_model.dart';
import 'package:hive_local_database/model/teacher/teacher_model.dart';

part 'class_batch_model.g.dart';

@HiveType(typeId: 2)
class ClassBatchModel {
  @HiveField(0)
  String classStandard;

  @HiveField(1)
  String classSection;

  @HiveField(2)
  TeacherModel classTeacher;

  @HiveField(3)
  List<SubjectModel>? subjects;

  @HiveField(4)
  List<StudentModel>? students;

  ClassBatchModel(
      {required this.classStandard,
      required this.classSection,
      required this.classTeacher,
      required this.subjects,
      required this.students});
}
