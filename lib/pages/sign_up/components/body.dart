import 'package:flutter/material.dart';
import 'package:demo/pages/sign_up//components/background.dart';
import 'package:demo/components/rounded_button.dart';
import 'package:demo/components/rounded_input_field.dart';
import 'package:demo/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                // Text Button
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Already Registered? Log in Here"),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 28, 170, 0),
                child: Text(
                  "Username",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              RoundedInputField(
                hintText: "Name",
                icon: Icons.face,
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.001,),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 6, 200, 0),
                child: Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              RoundedInputField(
                hintText: "Your Email",
                icon: Icons.person,
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.001,),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 6, 175, 0),
                child: Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.02,),
              RoundedButton(
                text: "Sign Up",
                press: () {},
              ),
            ],
          ),
        )
    );
  }
}

