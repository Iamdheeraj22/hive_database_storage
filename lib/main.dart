import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_local_database/bloc/class/class_cubit.dart';
import 'package:hive_local_database/bloc/home/home_cubit.dart';
import 'package:hive_local_database/bloc/student/student_cubit.dart';
import 'package:hive_local_database/model/class/class_batch_model.dart';
import 'package:hive_local_database/model/student/student_model.dart';
import 'package:hive_local_database/model/subject/subject_model.dart';
import 'package:hive_local_database/model/teacher/teacher_model.dart';
import 'package:hive_local_database/screens/home/home_page.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(StudentModelAdapter());
  Hive.registerAdapter(TeacherModelAdapter());
  Hive.registerAdapter(ClassBatchModelAdapter());
  Hive.registerAdapter(SubjectModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=> HomeCubit()),
          BlocProvider(create: (create) => StudentCubit()),
          BlocProvider(create: (create) => ClassCubit())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ));
  }
}
