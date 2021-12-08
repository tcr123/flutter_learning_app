import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  int _currentRatings = 1;
  String _currentFeedback = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "Feedback",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Ratings : $_currentRatings",
            style: TextStyle(fontSize: 18),
          ),
          Slider(
            value: _currentRatings.toDouble(),
            activeColor: Colors.purple[_currentRatings * 180],
            inactiveColor: Colors.purple[_currentRatings * 180],
            min: 1,
            max: 5,
            divisions: 4,
            onChanged: (val) => setState(() {
              _currentRatings = val.round();
            }),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Feedback",
            ),
            onChanged: (val) => setState(() => _currentFeedback = val),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
            child: Text("Sumbit"),
            onPressed: () async {
              
            },
          ),
        ],
      ),
    );
  }
}
