import 'package:flutter/material.dart';
import 'package:hive_db/db/functions/model/data_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier <List<StudentModel>>  studentListNotifier = ValueNotifier([]);

Future <void> addStudent(StudentModel value) async{
  final studentDB = await Hive.openBox<StudentModel>('student_db'); //opening db
  // final _id = 
  await studentDB.add(value); //adding to db
  // value.id = _id;
  studentListNotifier.value.add(value); //adding to list
  studentListNotifier.notifyListeners(); //returning
} 

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners(); // to rebuild in ui
}

//to dlt

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.delete(id);
  getAllStudents();
}