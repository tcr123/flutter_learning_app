import 'package:demo/database/enrolled_data.dart';
import 'package:demo/models/Id.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/models/class_model.dart';
import 'package:demo/pages/home/list/class_tile.dart';

class JoinClass extends StatefulWidget {
  const JoinClass({Key? key}) : super(key: key);

  @override
  _JoinClassState createState() => _JoinClassState();
}

class _JoinClassState extends State<JoinClass>
    with SingleTickerProviderStateMixin {
  String class_code = '';
  String class_name = '';
  String lecture_name = '';
  String subject = '';
  late TabController _controller;
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = Provider.of<Id?>(context);
    final classModel = Provider.of<List<ClassModel>?>(context);

    ClassModel result;
    List<ClassModel> classList = [];
    if (classModel != null) {
      classList = classModel;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Join Class"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
          bottom: TabBar(
            controller: _controller,
            tabs: [
              Tab(
                text: "Join By Code",
              ),
              Tab(
                text: "Search For Class",
              ),
            ],
          ),
        ),
        body: TabBarView(controller: _controller, children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Form(
              child: Column(
                children: <Widget>[
                  Text(
                    "Enter class code to join class",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Class code",
                    ),
                    onChanged: (val) {
                      setState(() {
                        class_code = val;
                      });
                    },
                  ),
                  SizedBox(
                    width: size.height * 0.03,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[400],
                    ),
                    onPressed: () async {
                      if (classModel != null && user != null) {
                        try {
                          result = classModel
                              .where(
                                  (element) => element.class_code == class_code)
                              .first;
                          class_name = result.class_name;
                          subject = result.subject;
                          lecture_name = result.lecture_name;
                          await EnrolledDataBaseService(uid: user.user_id)
                              .updateEnrolledData(class_name, class_code,
                                  subject, lecture_name);
                        } catch (e) {
                          print(e.toString());
                        }
                      } else {
                        print("class model not found");
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Join",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    // just a demo for search bar
                    onChanged: (value) {},
                    controller: editingController,
                    decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: classList.length,
                    itemBuilder: (context, index) {
                      return ClassTile(classes: classList[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ]
      )
    );
  }
}
