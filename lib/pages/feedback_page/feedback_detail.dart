import 'package:flutter/material.dart';
import 'package:demo/pages/class_page/class_page.dart';

class FeedbackDetailPage extends StatefulWidget {
  @override
  _FeedbackDetailPageState createState() => new _FeedbackDetailPageState();
}

var ForumPostArr = [
  ForumPostEntry("User1", "2 Days ago", 5,
      "Hello,\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
  ForumPostEntry("User2", "23 Hours ago", 3,
      "Pellentesque justo metus, finibus porttitor consequat vitae, tincidunt vitae quam. Vestibulum molestie sem diam. Nullam pretium semper tempus. Maecenas lobortis lacus nunc, id lacinia nunc imperdiet tempor. Mauris mi ipsum, finibus consectetur eleifend a, maximus eget lorem. Praesent a magna nibh. In congue sapien sed velit mattis sodales. Nam tempus pulvinar metus, in gravida elit tincidunt in. Curabitur sed sapien commodo, fringilla tortor eu, accumsan est. Proin tincidunt convallis dolor, a faucibus sapien auctor sodales. Duis vitae dapibus metus. Nulla sit amet porta ipsum, posuere tempor tortor.\n\nCurabitur mauris dolor, cursus et mi id, mattis sagittis velit. Duis eleifend mi et ante aliquam elementum. Ut feugiat diam enim, at placerat elit semper vitae. Phasellus vulputate quis ex eu dictum. Cras sapien magna, faucibus at lacus vel, faucibus viverra lorem. Phasellus quis dui tristique, ultricies velit non, cursus lectus. Suspendisse neque nisl, vestibulum non dui in, vulputate placerat elit. Sed at convallis mauris, eu blandit dolor. Vivamus suscipit iaculis erat eu condimentum. Aliquam erat volutpat. Curabitur posuere commodo arcu vel consectetur."),
  ForumPostEntry("User3", "2 Days ago", 5,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
  ForumPostEntry("User4", "2 Days ago", 4,
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
];

class _FeedbackDetailPageState extends State<FeedbackDetailPage> {
  @override
  Widget build(BuildContext context) {
    var questionSection = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            "How was the class today ??",
            textScaleFactor: 1.5,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconWithText(
                  Icons.laptop_mac,
                  "Technology",
                  iconColor: Colors.grey,
                ),
                IconWithText(
                  Icons.check_circle,
                  "Answered",
                  iconColor: Colors.green,
                ),
                IconWithText(Icons.remove_red_eye, "54", iconColor: Colors.grey)
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );

    var responses = Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              ForumPost(ForumPostArr[index]),
          itemCount: ForumPostArr.length,
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: Column(
        children: <Widget>[
          questionSection,
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: responses,
          )),
          TextFormField(
            decoration: InputDecoration(
              hintText: " Add Your Comment",
            ),
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }
}

class ForumPostEntry {
  final String username;
  final String hours;
  final int ratings;
  final String text;

  ForumPostEntry(
      this.username, this.hours, this.ratings, this.text);
}

class ForumPost extends StatelessWidget {
  final ForumPostEntry entry;

  ForumPost(this.entry);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple[200],
        borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple[300],
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0)),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.person,
                  size: 50.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(entry.username),
                      Text(entry.hours),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Icon(Icons.star, color: Colors.yellow[500]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, 12, 2),
                      child: Text(entry.ratings.toString()),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                    bottomLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0))),
            child: Text(entry.text),
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color iconColor;

  IconWithText(this.iconData, this.text, {required this.iconColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            this.iconData,
            color: this.iconColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(this.text),
          ),
        ],
      ),
    );
  }
}
