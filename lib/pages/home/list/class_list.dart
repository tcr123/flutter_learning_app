import 'package:demo/models/class_model.dart';
import 'package:demo/pages/home/list/class_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/models/Id.dart';

class ClassList extends StatefulWidget {
  const ClassList({Key? key}) : super(key: key);

  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  @override
  Widget build(BuildContext context) {
    final classModel = Provider.of<List<ClassModel>?>(context);
    final user = Provider.of<Id?>(context);

    bool showClass = false;
    List<ClassModel> classList = [];
    if (classModel != null && user != null) {
      classList =
          classModel.where((element) => element.uid == user.user_id).toList();
    }

    if (classList.isNotEmpty) {
      showClass = true;
    }

    return showClass
        ? ListView.builder(
            itemCount: classList.length,
            itemBuilder: (context, index) {
              return ClassTile(classes: classList[index]);
            },
          )
        : Center(
            child: Text(
              "Not Classes Created",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
