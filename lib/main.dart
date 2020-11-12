import 'package:flutter/material.dart';
import 'package:gushenrfa/screens/add_screen.dart';
import 'package:gushenrfa/screens/alt_todo.dart';
import 'cards.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Regular Todo', cardManager: CardManager()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, @required this.cardManager}) : super(key: key);

  final String title;
  final CardManager cardManager;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _onSortButtonPressed() {
    print('Sort button pressed (not functional)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(icon: Icon(Icons.remove_red_eye), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AltTodoScreen(widget.cardManager))
            );
          }),
          IconButton(icon: Icon(Icons.refresh), onPressed: () {
            print('Refresh list of todo cards');
          }),
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: _onSortButtonPressed,
          )
        ],
      ),
      body: _todoListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen(widget.cardManager)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView _todoListView() {
    return ListView.separated(
      itemBuilder: (context, index) => widget.cardManager.getCards()[index],
      itemCount: widget.cardManager.todoCards.length,
      separatorBuilder: (context, index) => const Divider(height: 0),
    );
  }
}
