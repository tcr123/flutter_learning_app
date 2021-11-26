import 'package:demo/pages/sign_up/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:demo/pages/login/components/background.dart';
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
                padding: EdgeInsets.fromLTRB(0, 24, 200, 0),
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
              SizedBox(height: size.height * 0.0001,),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 24, 175, 0),
                child: Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
                child: Text(
                  "Forgot Password???",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: size.height * 0.04,),
              RoundedButton(
                text: "LOGIN",
                press: () {},
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpPage();
                        },
                      ),
                    );
                  },
                  child: const Text("NEW TO OUR APP? CLICK HERE"),
                ),
              ),
            ],
          ),
        )
    );
  }
}

