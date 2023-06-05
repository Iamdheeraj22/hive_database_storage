import 'package:flutter/material.dart';
import 'package:hive_local_database/custom_widgets/text_widget.dart';
import 'package:hive_local_database/model/subject/subject_model.dart';

class SubjectView extends StatelessWidget {
  const SubjectView(
      {Key? key,
      required this.model,
      required this.index,
      required this.onDelete,
      required this.onEdit})
      : super(key: key);
  final SubjectModel model;
  final int index;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
            TextWidget(
              data: model.name,
              fontSize: 16,
            ),
            const Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: onEdit,
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 15,
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: onDelete,
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Icons.close,
                    size: 15,
                    color: Colors.white,
                  )),
            )
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     TextWidget(data: '${AppStrings.kSubjectName} :- ${model.name}'),
            //     const SizedBox(
            //       height: 10,
            //     ),
            //     TextWidget(
            //         data:
            //             '${AppStrings.kSubjectTeacher} :- ${model.subjectTeacher.name}')
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
