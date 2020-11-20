import 'package:flutter/material.dart';
import 'package:gushenrfa/screens/home_screen.dart';
import 'data_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Kallar på HomeScreen från home_screen.dart
      home: HomeScreen(DataHandler()),
      debugShowCheckedModeBanner: false,
    );
  }
}


