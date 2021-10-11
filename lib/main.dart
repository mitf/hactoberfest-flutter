import 'package:flutter/material.dart';

import 'page/sign_in/sign_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
      routes: {
        'sign_in_page': (context) => SignInPage(),
      },
    );
  }
}
