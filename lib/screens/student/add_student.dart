import 'package:flutter/material.dart';
import 'package:hive_local_database/custom_widgets/custom_button.dart';
import 'package:hive_local_database/custom_widgets/custom_textfield.dart';
import 'package:hive_local_database/model/student/student_model.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({Key? key, this.studentModel, this.index})
      : super(key: key);
  static const String id = '/add_student';
  final StudentModel? studentModel;
  final int? index;
  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _classNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _firstNameKey = GlobalKey<FormFieldState>();
  final _lastNameKey = GlobalKey<FormFieldState>();
  final _classKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    if (widget.studentModel != null) {
      // _firstNameController.text = widget.studentModel!.firstName ?? '';
      // _lastNameController.text = widget.studentModel!.lastName ?? '';
      // _classNameController.text =
      //     (widget.studentModel!.whichClass ?? 0).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add new student',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  key: _firstNameKey,
                  controller: _firstNameController,
                  inputType: TextInputType.text,
                  label: 'First name',
                  hintText: 'Please enter the first name!',
                  validator: (v) {
                    if (v != null && v.isNotEmpty) {
                      return null;
                    } else {
                      return 'Fill the first name!';
                    }
                  },
                ),
                CustomTextField(
                  key: _lastNameKey,
                  controller: _lastNameController,
                  inputType: TextInputType.text,
                  label: 'Last name',
                  hintText: 'Please enter last name!',
                  validator: (v) {
                    if (v != null && v.isNotEmpty) {
                      return null;
                    } else {
                      return 'Fill the last name!';
                    }
                  },
                ),
                CustomTextField(
                  key: _classKey,
                  inputType: TextInputType.number,
                  controller: _classNameController,
                  label: 'Which class studied',
                  hintText: 'Which class',
                  validator: (v) {
                    if (v != null && v.isNotEmpty) {
                      return null;
                    } else {
                      return 'Fill the class name!';
                    }
                  },
                ),
                Center(
                  child: CustomButton(
                    title: widget.studentModel != null ? 'Update' : 'Submit',
                    onPressed: () {
                      _firstNameKey.currentState?.validate();
                      _lastNameKey.currentState?.validate();
                      _classKey.currentState?.validate();
                      // if ((_formKey.currentState?.validate() ?? false)) {
                      //   final model = StudentModel(
                      //       firstName: _firstNameController.text.trim(),
                      //       lastName: _lastNameController.text.trim(),
                      //       whichClass:
                      //           int.parse(_classNameController.text.trim()));
                      //   if (widget.studentModel == null) {
                      //     context
                      //         .read<StudentCubit>()
                      //         .addStudent(model, context);
                      //   } else {
                      //     context.read<StudentCubit>().updateStudentDetails(
                      //         model, context, widget.index!);
                      //   }
                      // }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
