import 'package:flutter/material.dart';

// Dataklass som representerar en todo
class Todo {
  String title;
  bool isChecked;


  Todo({@required this.title, this.isChecked = false});
}

// Klass som står för skapandet av och referensen till alla todos
class DataHandler {
  List<Todo> todos;
  List<Todo> displayedTodos;

  DataHandler({List<Todo> todos}) {
    if (todos == null) {
      this.todos = List.generate(5, (index) => Todo(title: 'Todo $index'));
      this.displayedTodos = this.todos;
    } else {
      this.todos = this.todos;
      this.displayedTodos = this.todos;
    }
  }

}