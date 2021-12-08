import 'package:demo/models/class_model.dart';
import 'package:demo/pages/class_page/class_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/database/class_data.dart';

class ClassTile extends StatelessWidget {
  final ClassModel classes;
  ClassTile({required this.classes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(
          children: <Widget>[
            ListTile(
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => StreamProvider.value(
                      initialData: null,
                      value: ClassDataBaseService().data,
                      child: LecturerPage(class_code: classes.class_code, students: false)))
                );
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black,
              ),
              title: Text(classes.class_name),
              subtitle: Text("Subject: ${classes.subject}"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Lecture: ${classes.lecture_name}"),
                SizedBox(
                  width: 12.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
