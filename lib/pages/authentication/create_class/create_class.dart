import 'package:flutter/material.dart';

class CreateClass extends StatefulWidget {
  const CreateClass({Key? key}) : super(key: key);

  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  String class_name = '';
  String class_code = '';
  String subject = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Class"),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[400],
              ),
              onPressed: () {},
              child: Text(
                "Create",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(width: size.width*0.01,),
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
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Class name",
                  ),
                  onChanged: (val) {
                    setState(() {
                      class_name = val;
                    });
                  },
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
                SizedBox(height: size.height * 0.03),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Subject",
                  ),
                  onChanged: (val) {
                    setState(() {
                      subject = val;
                    });
                  },
                )
              ],
            ),
          ),
        ));
  }
}
