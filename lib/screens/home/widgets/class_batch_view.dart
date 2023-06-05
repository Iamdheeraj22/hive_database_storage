import 'package:flutter/material.dart';
import 'package:hive_local_database/custom_widgets/text_widget.dart';
import 'package:hive_local_database/model/class/class_batch_model.dart';
import 'package:hive_local_database/res/app_strings.dart';

class ClassBatchView extends StatelessWidget {
  const ClassBatchView({Key? key, required this.classBatch}) : super(key: key);
  final ClassBatchModel classBatch;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Class Name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    TextWidget(
                      data: classBatch.classStandard,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    //Section Name
                    Row(
                      children: [
                        const TextWidget(
                          data: '${AppStrings.kClassSection} :',
                          fontSize: 14,
                          textColor: Colors.black,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        TextWidget(
                          data: classBatch.classSection,
                          fontSize: 14,
                          textColor: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const TextWidget(
                      data: AppStrings.kTotalStudents,
                      fontSize: 13,
                    ),
                    TextWidget(
                      data: classBatch.students!.length.toString(),
                      fontSize: 13,
                    ),
                  ],
                )
              ],
            ),

            //Subjects
            const SizedBox(
              height: 15,
            ),

            const SizedBox(
              height: 5,
            ),
            // All Subjects
            Wrap(
              children: List.generate(
                  classBatch.subjects != null ? classBatch.subjects!.length : 0,
                  (index) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 2),
                        height: 40,
                        child: Chip(
                            side: const BorderSide(color: Colors.transparent),
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            label: TextWidget(
                              textColor: Colors.white,
                              data: classBatch.subjects![index].name,
                            )),
                      )),
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextWidget(
                data: 'Class Teacher : ${classBatch.classTeacher.name}',
                textColor: Colors.blue,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
