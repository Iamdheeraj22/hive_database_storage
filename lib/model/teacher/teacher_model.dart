import 'package:hive/hive.dart';

part 'teacher_model.g.dart';

@HiveType(typeId: 1)
class TeacherModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? subject;
  @HiveField(2)
  String? grade;
  @HiveField(3)
  int? experience;

  TeacherModel(
      {required this.name,
      required this.subject,
      required this.grade,
      required this.experience});
}
