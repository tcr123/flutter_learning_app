import 'package:demo/models/enrolled_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/database/class_data.dart';
import 'package:demo/pages/class_page/class_page.dart';

class EnrolledTile extends StatelessWidget {
  final EnrolledModel enrolled;
  bool isClose;
  EnrolledTile({required this.enrolled, required this.isClose});

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
                    MaterialPageRoute(
                        builder: (context) => StreamProvider.value(
                            initialData: null,
                            value: ClassDataBaseService().data,
                            child: LecturerPage(
                                class_code: enrolled.class_code,
                                isClose: isClose,
                                students: true,))));
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black,
              ),
              title: Text(enrolled.class_name),
              subtitle: Text("Subject: ${enrolled.subject}"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Lecture: ${enrolled.lecture_name}"),
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
