import 'package:demo/models/class_model.dart';
import 'package:demo/pages/class_page/class_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/database/class_data.dart';

class BookTile extends StatelessWidget {
  final ClassModel classes;
  BookTile({required this.classes});

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
                
              },
              leading: Icon(Icons.book),
              title: Text(classes.subject),
            ),
          ],
        ),
      ),
    );
  }
}
