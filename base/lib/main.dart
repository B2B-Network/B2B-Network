import 'package:base/loginPage.dart';
import 'package:flutter/material.dart';
import 'firstPage.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.firstRoute,
      routes: {
        "/": (context) => FirstPage(),
        MyRoutes.loginPage: (context) => LoginPage(),
      },
    );
  }
}
