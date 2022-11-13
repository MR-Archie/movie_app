// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import './Screens/home.dart';
import 'Screens/description.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movieholic",
      theme: ThemeData.dark(),
      home: HomePage(),
      routes: {
        '/description': (context) => Description(),
      },
    );
  }
}
