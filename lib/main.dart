import 'package:flutter/material.dart';
import 'package:gushenrfa/screens/list_screen.dart';
import 'package:provider/provider.dart';
import 'data_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Innnesluter hela MaterialApp i ChangeNotifierProvider för att TodoProvider ska vara tillgänglig i alla screens
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(todoDataSource: TodoDataSource.api),
      builder: (context, child) => MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // Kallar på ListScreen från home_screen.dart
        home: ListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
