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

    return enrolledModel != null
        ? ListView.builder(
            itemCount: enrolledModel.length,
            itemBuilder: (context, index) {
              return EnrolledTile(enrolled: enrolledModel[index]);
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
