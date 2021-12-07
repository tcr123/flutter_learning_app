import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  const BookList({ Key? key }) : super(key: key);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  TextEditingController editingController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // just a demo for search bar
              onChanged: (value) {},
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: classList.length,
          //     itemBuilder: (context, index) {
          //       return ClassTile(classes: classList[index]);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}