import 'package:hive/hive.dart';
import 'package:hive_local_database/model/teacher/teacher_model.dart';

part 'subject_model.g.dart';

@HiveType(typeId: 3)
class SubjectModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  TeacherModel subjectTeacher;

  SubjectModel({required this.name, required this.subjectTeacher});
}
