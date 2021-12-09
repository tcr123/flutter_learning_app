import 'package:demo/database/enrolled_data.dart';
import 'package:demo/models/Id.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/models/class_model.dart';
import 'package:demo/pages/home/list/class_tile.dart';

class EbookPage extends StatefulWidget {
  const EbookPage({Key? key}) : super(key: key);

  @override
  _EbookPageState createState() => _EbookPageState();
}

class _EbookPageState extends State<EbookPage>
    with SingleTickerProviderStateMixin {
  String class_code = '';
  String class_name = '';
  String lecture_name = '';
  String subject = '';
  late TabController _controller;
  TextEditingController editingController = TextEditingController();
  List<ClassModel>? classList;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
    classList = [];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = Provider.of<Id?>(context);
    final classModel = Provider.of<List<ClassModel>?>(context);

    ClassModel result;

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // just a demo for search bar
              onChanged: (value) {
                if (classModel != null) {
                  setState(() {
                    classList!.clear();
                    classList = classModel
                        .where((element) => element.class_name.contains(value))
                        .toList();
                    print(classList!.length);
                  });
                } else {
                  print("class model not found");
                }
              },
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: classList!.length,
              itemBuilder: (context, index) {
                return ClassTile(classes: classList![index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
