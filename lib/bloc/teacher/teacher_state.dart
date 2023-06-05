part of 'teacher_cubit.dart';

@freezed
class TeacherState with _$TeacherState {
  const factory TeacherState({
    @Default([]) List<TeacherModel> teachers
}) = _Initial;
}
