import 'package:flutter/material.dart';
import 'package:notepad/addnote.dart';
import 'package:notepad/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:notepad/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
