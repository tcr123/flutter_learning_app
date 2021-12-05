import 'package:demo/models/class_model.dart';
import 'package:flutter/material.dart';

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
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.red[500],
              ),
              title: Text(classes.class_name),
              subtitle: Text("Subject: ${classes.subject}"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[Text("Lecture: ${classes.lecture_name}"),
              SizedBox(width: 12.0,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
