import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_local_database/hive%20local%20database/class_hive_utils.dart';
import 'package:hive_local_database/model/class/class_batch_model.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  Timer? timer;

  void getAllClassBatches() async {
    emit(state.copyWith(
        classes: await ClassHiveDatabaseHelper.getClassBatches()));
  }

  void startTimer() {
    if (timer != null) {
      timer?.cancel();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.progressValue > 0) {
        emit(state.copyWith(progressValue: state.progressValue - 1));
      }
    });
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
