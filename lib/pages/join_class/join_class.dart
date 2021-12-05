import 'package:flutter/material.dart';

class JoinClass extends StatefulWidget {
  const JoinClass({Key? key}) : super(key: key);

  @override
  _JoinClassState createState() => _JoinClassState();
}

class _JoinClassState extends State<JoinClass> {
  String class_code = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Join Class"),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[400],
              ),
              onPressed: () {},
              child: Text(
                "Join",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(
              width: size.width*0.01,
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Container(
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
              ],
            ),
          ),
        ));
  }
}
