import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/models/customer.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    final customers = Provider.of<List<Customer>?>(context);

    if (customers != null) {
      customers.forEach((customer) {
        print(customer.name);
        print(customer.classes);
        print(customer.token);
      });
    }

    return Container();
  }
}
