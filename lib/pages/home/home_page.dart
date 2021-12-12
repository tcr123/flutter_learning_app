import 'package:avatar_glow/avatar_glow.dart';
import 'package:demo/database/class_data.dart';
import 'package:demo/database/enrolled_data.dart';
import 'package:demo/pages/create_class/create_class.dart';
import 'package:demo/pages/ebook_page/ebook_page.dart';
import 'package:demo/pages/home/list/class_list.dart';
import 'package:demo/pages/home/list/enrolled_list.dart';
import 'package:demo/pages/join_class/join_class.dart';
import 'package:demo/service/loading.dart';
import 'package:demo/widget/substring_highlighted.dart';
import 'package:flutter/material.dart';
import 'package:demo/api/speech_api.dart';
import 'package:demo/main.dart';
import 'package:demo/service/auth.dart';
import 'package:demo/utils.dart';
import 'package:provider/provider.dart';
import 'package:demo/models/Id.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String text = 'Press the button and start speaking';
  bool isListening = false;
  bool isClose = true;
  final AuthService _auth = AuthService();

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Id?>(context);
    return user != null
        ? MultiProvider(
            providers: [
              StreamProvider.value(
                  value: ClassDataBaseService().classes, initialData: null),
              StreamProvider.value(
                  value: EnrolledDataBaseService(uid: user.user_id).enrolled,
                  initialData: null),
            ],
            child: Scaffold(
              appBar: AppBar(
                title: Text(MyApp.title),
                actions: <Widget>[
                  PopupMenuButton(
                      onSelected: (value) {
                        setState(() {
                          if (value == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateClass()));
                          } else if (value == 2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StreamProvider.value(
                                        initialData: null,
                                        value: ClassDataBaseService().classes,
                                        child: JoinClass())));
                          } 
                        });
                      },
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text("Create Class"),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: Text("Join Class"),
                              value: 2,
                            ),
                          ]),
                  PopupMenuButton(
                      onSelected: (value) {
                        setState(() {
                          if (value == 2) {
                            setState(() {
                              isClose = !isClose;
                            });
                          }
                          if (value == 3) {
                            _auth.signOut();
                          }
                        });
                      },
                      icon: Icon(Icons.settings),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text("Profile"),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: Text("Mic Button: $isClose"),
                              value: 2,
                            ),
                            PopupMenuItem(
                              child: Text("Log Out"),
                              value: 3,
                            ),
                          ]),
                ],
                bottom: TabBar(
                  controller: _controller,
                  tabs: [
                    Tab(
                      text: "Enrolled",
                    ),
                    Tab(
                      text: "Teaching",
                    ),
                    Tab(
                      text: "E-book",
                    )
                  ],
                ),
              ),
              body: TabBarView(
                controller: _controller,
                children: [
                  EnrolledList(isClose: isClose,),
                  ClassList(isClose: isClose, ),
                  EbookPage(),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: isClose
                  ? ElevatedButton(
                      child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
                      onPressed: toggleRecording,
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    )
                  : null,
            ),
          )
        : Loading();
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
