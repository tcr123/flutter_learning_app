import 'package:flutter/material.dart';

class FeedbackList extends StatefulWidget {
  const FeedbackList({Key? key}) : super(key: key);

  @override
  _FeedbackListState createState() => _FeedbackListState();
}

class _FeedbackListState extends State<FeedbackList> {
  List<String> materials = [
    "Indices",
    "Standard Form",
    "Consumer Mathematics: Savings and Investments, Credit and Debit Management",
    "Scale Drawings",
    "Trigonometric Ratios",
    "Angle and Tangents of Circles",
    "Plans and Elevations",
    "Loco in Two Dimension",
    "Straight Lines",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: materials.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: 3.75,
                  child: Text("Chapter $index",
                  style: TextStyle(fontSize: 20),),
                ),
                SizedBox(height: 5,),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.0),
                  elevation: 5,
                  child: ListTile(
                    title: Text(materials[index]),
                    leading: Icon(Icons.feedback, color: Colors.purple[400],),
                  ),
                ),
              ],
            ),
          ), 
        );
      });
  }
}
