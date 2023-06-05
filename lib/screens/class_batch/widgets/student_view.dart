import 'package:flutter/material.dart';
import 'package:hive_local_database/custom_widgets/text_widget.dart';
import 'package:hive_local_database/model/student/student_model.dart';

class StudentView extends StatelessWidget {
  const StudentView({Key? key, required this.model, required this.index})
      : super(key: key);
  final StudentModel model;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100)),
              child: TextWidget(
                data: index.toString(),
                textColor: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.fullName,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Text(
                //   'Student Father Name :- ${model.fatherName}',
                //   style: const TextStyle(fontSize: 16, color: Colors.black),
                // ),
                // const SizedBox(
                //   height: 5,
                // ),
                // Text(
                //   'Student Mother Name :- ${model.fullName}',
                //   style: const TextStyle(fontSize: 16, color: Colors.black),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
