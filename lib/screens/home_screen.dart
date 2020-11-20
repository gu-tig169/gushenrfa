import 'package:flutter/material.dart';

import '../widgets/cards.dart';
import '../data_handler.dart';
import 'add_screen.dart';


enum FilterOptions {all, done, undone}

class HomeScreen extends StatefulWidget {
  final DataHandler dataHandler;

  HomeScreen(this.dataHandler);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> _displayedTodos;
  FilterOptions _currentFilter;

  @override
  void initState() {
    super.initState();
    this._displayedTodos = widget.dataHandler.todos; 
    _currentFilter = FilterOptions.all;
  }


  void _updateUI() {
    setState(() {
      switch (_currentFilter) {
        case FilterOptions.all: _displayedTodos = widget.dataHandler.todos; break;
        case FilterOptions.done: _displayedTodos = widget.dataHandler.todos.where((todo) => todo.isChecked).toList(); break;
        case FilterOptions.undone: _displayedTodos = widget.dataHandler.todos.where((todo) => !todo.isChecked).toList(); break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo app"),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: () {
            print('Refresh list of todo cards (not functional)');
          }),
          PopupMenuButton(
            icon: Icon(Icons.sort),
            onSelected: (FilterOptions result) { 
              _currentFilter = result;
              _updateUI();
            },
            itemBuilder: (context) => <PopupMenuEntry<FilterOptions>> [
              const PopupMenuItem<FilterOptions>(
                value: FilterOptions.all,
                child: Text("All")
              ),
              const PopupMenuItem<FilterOptions>(
                value: FilterOptions.done,
                child: Text("Done")
              ),
              const PopupMenuItem<FilterOptions>(
                value: FilterOptions.undone,
                child: Text("Undone")
              )
            ]
          )
        ],
      ),
      body: Container(
        child: _todoListView()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            //Navigerar till en skärm för att skapa nya todo cards från gushenrfa/screens/add_screen.dart
            MaterialPageRoute(builder: (context) => AddScreen(widget.dataHandler)),
          ).then((value) {
            _updateUI();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }


  //ListView som skapar todo kort (från gushenrfa/cards.dart) utifrån todos-listan i dataHandler
  Widget _todoListView() {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      child: ListView.separated(
        itemBuilder: (context, index) => Container(
          child: TodoCard(
            todo: _displayedTodos[index],
            onDelete: () {
              setState(() {
                widget.dataHandler.todos.removeAt(index);
              });
              _updateUI();
            },
          ),
        ),
        itemCount: _displayedTodos.length,
        separatorBuilder: (context, index) => Divider(color: Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}
