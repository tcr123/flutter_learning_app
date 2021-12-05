import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/class_model.dart';
import 'package:demo/pages/home/list/class_tile.dart';
import 'package:demo/service/loading.dart';
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

    bool show_class = false;
    List<ClassModel> result = [];
    if (classModel != null && user != null) {
      result =
          (classModel.where((item) => item.user_id == user.user_id)).toList();
    }

    if (result.isNotEmpty) {
      show_class = true;
    }

    return show_class ? ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return ClassTile(classes: result[index]);
        },
      ) : Center(
        child: Text(
          "Not Classes Found",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
    );
  }
}
