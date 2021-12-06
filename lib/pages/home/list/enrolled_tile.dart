import 'package:demo/models/enrolled_model.dart';
import 'package:flutter/material.dart';

class EnrolledTile extends StatelessWidget {
  final EnrolledModel enrolled;
  EnrolledTile({required this.enrolled});

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
              title: Text(enrolled.class_name),
              subtitle: Text("Subject: ${enrolled.subject}"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[Text("Lecture: ${enrolled.lecture_name}"),
              SizedBox(width: 12.0,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
