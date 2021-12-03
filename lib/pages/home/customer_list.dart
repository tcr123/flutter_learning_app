import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/service/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/models/customer.dart';
import 'package:demo/pages/home/customer_tile.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    final customers = Provider.of<List<Customer>?>(context);

    return customers != null ? ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) {
        return CustomerTile(customer : customers[index]);
      },
    ) : Loading();
  }
}
