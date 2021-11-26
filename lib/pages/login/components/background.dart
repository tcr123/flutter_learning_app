import 'package:flutter/material.dart';

// this background will be used in login page
class Background extends StatelessWidget {
  final Widget child;
  const Background ({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 450),
              child: Text(
                "Log In",
                style: TextStyle(
                  fontSize: 48, fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03,),
            child,
          ],
        ),
      ),
    );
  }
}
