import 'package:avatar_glow/avatar_glow.dart';
import 'package:demo/pages/authentication/create_class/create_class.dart';
import 'package:demo/pages/authentication/join_class/join_class.dart';
import 'package:demo/service/database.dart';
import 'package:flutter/material.dart';
import 'package:demo/api/speech_api.dart';
import 'package:demo/main.dart';
import 'package:demo/service/auth.dart';
import 'package:demo/utils.dart';
import 'package:provider/provider.dart';
import 'package:demo/pages/home/customer_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String text = 'Press the button and start speaking';
  bool isListening = false;
  final AuthService _auth = AuthService();

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: DatabaseService(uid: "").customers,
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
                    }
                    if (value == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JoinClass()));
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
                      PopupMenuItem(
                        child: Text("Find E-book"),
                        value: 3,
                      ),
                    ]),
            PopupMenuButton(
                onSelected: (value) {
                  setState(() {
                    if (value == 1) {
                      _auth.signOut();
                    }
                  });
                },
                icon: Icon(Icons.settings),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("Log Out"),
                        value: 1,
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
        body: CustomerList(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: isListening,
          endRadius: 75,
          glowColor: Theme.of(context).primaryColor,
          child: FloatingActionButton(
            child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
            onPressed: toggleRecording,
          ),
        ),
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
