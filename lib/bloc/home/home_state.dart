part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {@Default([]) List<ClassBatchModel> classes,
      @Default(5) int progressValue}) = _HomeState;
}
