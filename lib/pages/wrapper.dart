import 'package:demo/pages/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:demo/pages//home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:demo/models/Id.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Id?>(context);
    print(user);

    if (user == null)
      return Authentication();
    else {
      return HomePage();
    }
  }
}