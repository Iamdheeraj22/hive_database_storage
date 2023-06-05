import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_local_database/bloc/student/student_cubit.dart';
import 'package:hive_local_database/model/student/student_model.dart';

class StudentView extends StatelessWidget {
  const StudentView(
      {Key? key,
      required this.studentModel,
      required this.onPressed,
      required this.index})
      : super(key: key);
  final StudentModel studentModel;
  final VoidCallback onPressed;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPressed,
      child: Slidable(
        key: ValueKey(index),
        startActionPane: const ActionPane(
          // dismissible: IconButton(
          //     color: Colors.green,
          //     onPressed: () {},
          //     icon: const Icon(Icons.archive)),
          motion: BehindMotion(),
          children: [
            // IconButton(
            //     color: Colors.green,
            //     onPressed: () {},
            //     icon: const Icon(Icons.archive)),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            IconButton(
                color: Colors.red,
                onPressed: () {
                  context
                      .read<StudentCubit>()
                      .deleteStudentDetails(studentModel, context);
                },
                icon: const Icon(Icons.delete)),
            IconButton(
                color: Colors.grey,
                onPressed: () {},
                icon: const Icon(Icons.close))

            // SlidableAction(
            //   onPressed: (context) {},
            //   backgroundColor: const Color(0xFFFE4A49),
            //   foregroundColor: Colors.white,
            //   icon: Icons.delete,
            //   spacing: 5.0,
            //   padding: EdgeInsets.zero,
            // ),
            // const SizedBox(
            //   width: 10,
            // ),
            // SlidableAction(
            //   onPressed: (context) {},
            //   backgroundColor: const Color(0xFF49FE52),
            //   foregroundColor: Colors.white,
            //   icon: Icons.close,
            //   spacing: 5.0,
            //   padding: EdgeInsets.zero,
            //   borderRadius: BorderRadius.circular(100),
            // ),
          ],
        ),
        child: Container(
          constraints: const BoxConstraints(minWidth: 400),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Full name :- ${studentModel.fullName}',
                style: const TextStyle(color: Colors.white),
              ),
              const Text(
                'Class :- 10',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
