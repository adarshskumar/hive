import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1) //primary key to identify table
class StudentModel {

  @HiveField(0)
   int? id;

  @HiveField(1) //0'th column
  final String name;

  @HiveField(2) //first col
  final String age;

  StudentModel({required this.name, required this.age, this.id}); //constructor
}