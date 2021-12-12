import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  double _currentRatings = 1;
  String _currentFeedback = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Form") ,),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                "Feedback",
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Ratings",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              RatingBar(
                initialRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  half: Icon(
                    Icons.star_half,
                    color: Colors.yellow,
                  ),
                  empty: Icon(
                    Icons.star,
                    color: Colors.yellow[200],
                  ),
                ),
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {
                  setState(() {
                    _currentRatings = rating;
                  });
                },
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
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
