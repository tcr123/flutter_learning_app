import 'package:demo/models/customer.dart';
import 'package:flutter/material.dart';

class CustomerTile extends StatelessWidget {
  final Customer customer;
  CustomerTile({required this.customer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown,
          ),
          title: Text(customer.name),
          subtitle: Text("You have ${customer.score} token"),
        ),
      ),
    );
  }
}
