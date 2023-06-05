import 'package:hive/hive.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
  String fullName;
  @HiveField(1)
  String fatherName;
  @HiveField(2)
  String motherName;
  @HiveField(3)
  String classStandard;

  StudentModel(
      {required this.fullName,
      required this.fatherName,
      required this.motherName,
      required this.classStandard});
}
