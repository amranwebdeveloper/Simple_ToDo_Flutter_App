import 'package:flutter/material.dart';
import 'ToDoPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "TO Do",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ToDoPage(),
    );
  }
  
}