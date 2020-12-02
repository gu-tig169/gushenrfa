import 'package:flutter/material.dart';
import 'package:gushenrfa/widgets/filter_popup_menu_button.dart';
import 'package:gushenrfa/widgets/todo_list_view.dart';
import 'package:provider/provider.dart';

import '../data_handler.dart';
import 'add_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 10), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App: gushenrfa"),
        actions: [
          RotationTransition(
            turns: Tween(begin: 0.0, end: 40.0).animate(_animationController),
            child: IconButton(
                tooltip: 'Press to refresh todos from interwebben',
                icon: Icon(Icons.refresh),
                onPressed: () async {
                  _animationController.forward();
                  // ignore: await_only_futures
                  await Provider.of<TodoProvider>(context, listen: false).fetchTodosFromAPI();
                  _animationController.reset();
                }),
          ),
          FilterPopupMenuButton()
        ],
      ),
      body: Container(child: TodoListView()),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Press to add a new todo',
        onPressed: () {
          Navigator.push(
            context,
            //Navigerar till en skärm för att skapa nya todo cards från gushenrfa/screens/add_screen.dart
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
