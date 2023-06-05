import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_local_database/bloc/home/home_cubit.dart';
import 'package:hive_local_database/custom_widgets/action_snackbar.dart';
import 'package:hive_local_database/custom_widgets/text_widget.dart';
import 'package:hive_local_database/drawer/drawer.dart';
import 'package:hive_local_database/model/student/student_model.dart';
import 'package:hive_local_database/res/app_strings.dart';
import 'package:hive_local_database/screens/class_batch/pages/create_new_class.dart';
import 'package:hive_local_database/screens/home/widgets/class_batch_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<StudentModel> students = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getAllClassBatches();
    context.read<HomeCubit>().startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(
        scaffoldKey: _scaffoldKey,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          'Hive local database management',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                  data: AppStrings.kAllClassBatches,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.classes.length,
                        itemBuilder: (context, index) {
                          return ClassBatchView(
                              classBatch: state.classes[index]);
                        });
                  },
                ),
                ActionSnackBar()
              ],
            ),
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const CreateClassBatch()))
                .then((value) {
              if (value == null) {
                context.read<HomeCubit>().getAllClassBatches();
              }
            });
          },
          child: const TextWidget(
            data: AppStrings.kAddClassBatch,
            fontSize: 15,
            textColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
