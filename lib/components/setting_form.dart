import 'package:flutter/material.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({Key? key}) : super(key: key);

  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "Create",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.assignment)),
              Text("Assignment/Learning Material"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.assignment)),
              Text("Video"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.question_answer)),
              Text("ClassForum"),
            ],
          ),
        ],
      ),
    );
  }
}
