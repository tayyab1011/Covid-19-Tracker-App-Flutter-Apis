import 'package:flutter/material.dart';
import 'package:flutter_project/hello.dart';
import 'package:flutter_project/login.dart';


void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

        // textTheme: const TextTheme(
        // displayLarge: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
        //titleMedium: TextStyle(fontSize: 21,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
      ),
      home: Hello(),
    );
  }
}
