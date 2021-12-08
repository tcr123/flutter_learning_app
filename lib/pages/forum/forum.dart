import 'package:demo/pages/forum/forum_detail.dart';
import 'package:flutter/material.dart';
import 'package:demo/colors.dart';
import 'package:demo/models/list_entry.dart';
import 'package:demo/colors.dart';

class ForumPage extends StatefulWidget {
  bool students;
  ForumPage({Key? key, required this.students}) : super(key: key);

  @override
  _ForumPageState createState() => new _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  static final listItemsData = [
    ListEntry(
        title: "Forum1",
        icon: "test",
        description: "description1",
        views: 54,
        responses: 2,
        answered: true),
    ListEntry(
        title: "Forum2",
        icon: "test",
        description: "description2",
        views: 154,
        responses: 3,
        answered: true),
    ListEntry(
        title: "Forum 3",
        icon: "test",
        description: "description 3",
        views: 971,
        responses: 0,
        answered: false),
    ListEntry(
        title: "Forum 4",
        icon: "test",
        description: "description 4",
        views: 124,
        responses: 2,
        answered: true),
    ListEntry(
        title: "Forum 5",
        icon: "test",
        description: "description 5",
        views: 412,
        responses: 5,
        answered: true),
    ListEntry(
        title: "Forum 6",
        icon: "test",
        description: "description 6",
        views: 12,
        responses: 1,
        answered: true),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listItemsData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                  elevation: 5,
                  child: EntryItem(listItemsData[index], widget.students),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EntryItem extends StatelessWidget {
  final ListEntry entry;
  bool students;
  EntryItem(this.entry, this.students);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      decoration: BoxDecoration(
        color: AppColorsTheme.myTheme.secondaryGradientColor,
        borderRadius: BorderRadius.all(new Radius.circular(15.0)),
      ),
      child: ListTile(
        title: Text(entry.title),
        subtitle: Text(entry.description),
        leading: Icon(
          Icons.dashboard,
          color: AppColorsTheme.myTheme.primarySwatch,
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForumDetailPage(students: students,)));
        },
      ),
    );
  }
}
