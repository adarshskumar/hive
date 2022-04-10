import 'package:flutter/material.dart';
import 'package:hive_db/db/functions/db_functions.dart';
import 'package:hive_db/db/functions/model/data_model.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
        itemBuilder: (ctx,index) {
          final data = studentList[index];
          return ListTile(
          title: Text(data.name),
          subtitle: Text(data.age),
          trailing: IconButton(onPressed: () {
            if(data.id!=null) {
              deleteStudent(data.id!);
            }
            else {
              print('Student id is null. Unable to delete');
            }
          }, icon: Icon(Icons.delete, color: Colors.red,)),
        );
        },
        separatorBuilder: (context,index) => Divider(),
        itemCount: studentList.length,
        );
      },
    );
  }
}