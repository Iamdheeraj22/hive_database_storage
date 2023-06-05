import 'package:flutter/material.dart';
import 'package:hive_local_database/screens/class_batch/pages/create_new_class.dart';
import 'package:hive_local_database/screens/teacher/add_teacher.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key, required this.scaffoldKey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 70,
            ),
            const SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            const Text('Hello , Dheeraj Prajapat'),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text(
                'Add New Teacher',
              ),
              onTap: () {
                closeDrawer();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddTeacherPage()));
              },
            ),
            ListTile(
              title: const Text(
                'Add New Batch',
              ),
              onTap: () {
                closeDrawer();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const CreateClassBatch()));
              },
            ),
          ],
        ),
      ),
    );
  }

  closeDrawer() {
    if (widget.scaffoldKey.currentState!.isDrawerOpen) {
      widget.scaffoldKey.currentState!.closeDrawer();
    }
  }
}
