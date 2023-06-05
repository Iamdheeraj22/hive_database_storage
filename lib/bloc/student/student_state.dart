part of 'student_cubit.dart';

@freezed
class StudentState with _$StudentState {
  const factory StudentState({@Default([]) List<StudentModel> students}) =
      _StudentState;
}
