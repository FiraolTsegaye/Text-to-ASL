import 'package:flutter/material.dart';
// import 'package:first/HomePage.dart';
import 'intro.dart';
// import 'package:first/EthSL_text.dart';
// import 'package:first/Eth_file_picker.dart';
// import 'package:first/Start2.dart';
// import 'package:first/Start.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: introPage(),
    );
  }
}
