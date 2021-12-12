import 'package:flutter/material.dart';
import 'package:demo/service/auth.dart';
import 'package:demo/components/rounded_button.dart';
import 'package:demo/components/rounded_input_field.dart';
import 'package:demo/components/rounded_password_field.dart';
import 'package:demo/service/loading.dart';

class SignUpPage extends StatefulWidget {
  final Function toggleView;
  SignUpPage({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<SignUpPage> {
  final AuthService _auth = AuthService();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text('Sign Up'),
              actions: <Widget>[
                ElevatedButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Sign In'),
                  onPressed: () => widget.toggleView(),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
              child: SingleChildScrollView(
                reverse: true,
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 12, 200, 0),
                        child: Text(
                          "Email",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      RoundedInputField(
                        hintText: "Your Email",
                        icon: Icons.person,
                        validator: (val) =>
                            (val!.isEmpty) ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.0001,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 12, 175, 0),
                        child: Text(
                          "Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      RoundedPasswordField(
                        validator: (val) => val!.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      RoundedButton(
                        text: "REGISTER",
                        press: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                  error = 'please supply a valid email';
                                  loading = false;
                                }
                              );
                            }
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
