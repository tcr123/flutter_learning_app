import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/models/class_model.dart';
import 'package:demo/pages/forum/forum.dart';
import 'package:demo/pages/home/list/feedback_list.dart';
import 'package:demo/pages/home/list/learning_list.dart';
import 'package:demo/pages/home/list/video_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/database/class_data.dart';
import 'package:demo/utils.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:demo/api/speech_api.dart';

class LecturerPage extends StatefulWidget {
  String class_code;
  bool students;
  LecturerPage({Key? key, required this.class_code, required this.students})
      : super(key: key);

  @override
  _LecturerPageState createState() => _LecturerPageState();
}

class _LecturerPageState extends State<LecturerPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<String> titleList = [
    "learning material",
    "video",
    "class forum",
    "feedback"
  ];

  String title = "learning material";
  String id = "";
  ClassModel classData = ClassModel(
      class_name: "", class_code: "", subject: "", lecture_name: "", uid: "");

  // for voice assistant
  String text = 'Press the button and start speaking';
  bool isListening = false;

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
      print(classData.class_name);
      // print(id);
      // print("validity");
    } catch (e) {
      print(e.toString());
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
          LearningList(),
          VideoList(),
          ForumPage(students: widget.students,),
          FeedbackList(),
        ],
      ),
      floatingActionButton: widget.students
          ? Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(32, 4, 0, 0),
              child: AvatarGlow(
                  animate: isListening,
                  endRadius: 75,
                  glowColor: Theme.of(context).primaryColor,
                  child: FloatingActionButton(
                    child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
                    onPressed: toggleRecording,
                  ),
                ),
            ),
          )
          : FloatingActionButton(
                child: Icon(Icons.add, size: 36),
                onPressed: () {},
              ),
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
        onResult: (text) => setState(() => this.text = text),
        onListening: (isListening) {
          setState(() => this.isListening = isListening);

          if (!isListening) {
            Future.delayed(Duration(seconds: 1), () {
              Utils.scanText(text);
            });
          }
        },
      );
}
