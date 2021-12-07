import 'package:demo/pages/home/list/enrolled_tile.dart';
import 'package:demo/models/enrolled_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnrolledList extends StatefulWidget {
  const EnrolledList({Key? key}) : super(key: key);

  @override
  _EnrolledListState createState() => _EnrolledListState();
}

class _EnrolledListState extends State<EnrolledList> {
  @override
  Widget build(BuildContext context) {
    final enrolledModel = Provider.of<List<EnrolledModel>?>(context);
    bool showClass = false;

    List<EnrolledModel> enrolled = [];
    if (enrolledModel != null) enrolled = enrolledModel;

    if (enrolled.isNotEmpty) {
      showClass = true;
    }

    return showClass
        ? ListView.builder(
            itemCount: enrolled.length,
            itemBuilder: (context, index) {
              return EnrolledTile(enrolled: enrolled[index]);
            },
          )
        : Center(
            child: Text(
            "Not Classes Found",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ));
  }
}
