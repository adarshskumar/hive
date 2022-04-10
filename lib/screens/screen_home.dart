import 'package:flutter/material.dart';
import 'package:hive_db/db/functions/db_functions.dart';
import 'package:hive_db/widgets/add_student_widget.dart';
import 'package:hive_db/widgets/list_student_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AddStudentWidget(),
          Expanded(child: ListStudentWidget()),
        ],
      )),
    );
  }
}

