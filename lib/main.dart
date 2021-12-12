import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo/pages/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:demo/models/Id.dart';
import 'package:demo/service/auth.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Demo';

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Id?>.value(
        value: AuthService().user,
        initialData: null,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.purple),
          home: Wrapper(),
        ),
      );
    }
}