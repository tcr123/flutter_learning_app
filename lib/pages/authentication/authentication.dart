import 'package:demo/pages/authentication/login/login_page.dart';
import 'package:demo/pages/authentication/sign_up/signup_page.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authentication> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
    print(showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginPage(toggleView: toggleView);
    } else {
      return SignUpPage(toggleView: toggleView);
    }
  }
}