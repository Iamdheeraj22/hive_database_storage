import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_local_database/bloc/home/home_cubit.dart';
import 'package:hive_local_database/custom_widgets/text_widget.dart';

class ActionSnackBar extends StatelessWidget {
  const ActionSnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 20,
              width: 20,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      TextWidget(
                        data: state.progressValue.toString(),
                        textColor: Colors.white,
                      ),
                      CircularProgressIndicator(
                        strokeWidth: 3,
                        value:
                            state.progressValue.toDouble() / (5.0).toDouble(),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
