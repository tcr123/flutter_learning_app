import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/class_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/database/class_data.dart';

class LecturerPage extends StatefulWidget {
  String class_code;
  bool students;
  LecturerPage({Key? key, required this.class_code, required this.students}) : super(key: key);

  @override
  _LecturerPageState createState() => _LecturerPageState();
}

class _LecturerPageState extends State<LecturerPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<String> titleList = ["learning", "video", "class forum", "feedback"];

  String title = "";
  String id = "";
  ClassModel classData = ClassModel(
      class_name: "", class_code: "", subject: "", lecture_name: "", uid: "");

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
    _controller.addListener(changeTitle);
  }

  void changeTitle() {
    setState(() {
      title = titleList[_controller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      // --------------------------------------------------
      // use to determine the code of class
      final tempData = Provider.of<QuerySnapshot>(context);

      id = ClassDataBaseService().returnIdOfClass(tempData, widget.class_code);
      // print(tempData); // debugging
      // print("validity");
      classData =
          ClassDataBaseService().returnClassModel(tempData, widget.class_code);
      // print(id);
      // print("validity");
    } catch (e) {
      print(e.toString());
    }
    return Scaffold(
      appBar: AppBar(
        title: _controller.index == 0 ? Text(classData.class_name + " - " + titleList[0]) : Text(title),
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(Icons.book),
            ),
            Tab(
              icon: Icon(Icons.video_collection_outlined),
            ),
            Tab(
              icon: Icon(Icons.chat_bubble),
            ),
            Tab(
              icon: Icon(Icons.feedback_sharp),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text("hi1"),
          Text("hi2"),
          Text("hi3"),
          Text("hi4"),
        ],
      ),
    );
  }
}
