import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/class_model.dart';
import 'package:demo/pages/home/list/class_tile.dart';
import 'package:demo/service/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/models/customer.dart';
import 'package:demo/pages/home/customer_tile.dart';

class ClassList extends StatefulWidget {
  const ClassList({Key? key}) : super(key: key);

  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  @override
  Widget build(BuildContext context) {
    final classModel = Provider.of<List<ClassModel>?>(context);

    List<ClassModel> result = [];
    if (classModel != null) {
      result =
          (classModel.where((item) => item.lecture_name == "chun")).toList();
    }

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) {
        return ClassTile(classes: result[index]);
      },
    );
  }
}
