part of 'class_cubit.dart';

@freezed
class ClassState with _$ClassState {
  const factory ClassState(
      {@Default([]) List<StudentModel> students,
      @Default([]) List<SubjectModel> subjects,
      @Default('') String className,
      @Default('') String sectionName,
      TeacherModel? classTeacher,
      @Default(false) bool isStudentAdding}) = _ClassState;
}
