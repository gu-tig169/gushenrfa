import 'dart:convert';

import 'package:flutter/material.dart';

import 'api.dart';

// Dataklass som representerar en todo
class Todo {
  String id = '';
  String title;
  bool isChecked;

  Todo({this.id, @required this.title, this.isChecked = false});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(id: json['id'], title: json['title'], isChecked: json['done']);
  }

  String toString() {
    return 'id: $id\ntitle: $title\nisChecked: $isChecked';
  }

  String toJson() {
    return jsonEncode(<String, dynamic>{'id': id, 'title': title, 'done': isChecked});
  }
}

// Enum för vilken typ av filtrering som ska appliceras på de todos som visas
enum FilterOptions { all, done, undone }

// Enum för att specificera hur TodoProvider tillhandahåller todos
enum TodoDataSource { test, api, passed }

// Klass som står för skapande, sparande och lagrande av samt referensen till alla todos
class TodoProvider extends ChangeNotifier {
  TodoDataSource _todoDataSource;
  List<Todo> _todos = [];
  FilterOptions _currentFilterOption = FilterOptions.all;

  TodoProvider({@required todoDataSource, List<Todo> todos}) {
    _todoDataSource = todoDataSource;
    switch (todoDataSource) {
      case TodoDataSource.test:
        // Genererar och använder testlista med todos
        this._todos = List.generate(5, (index) => Todo(title: 'Todo $index'));
        break;
      case TodoDataSource.passed:
        // Använder todos som passerats som argument till konstruktorn
        this._todos = todos;
        break;
      case TodoDataSource.api:
        // Hämtar och använder todos från API
        fetchTodosFromAPI();
        break;
    }
  }

  void fetchTodosFromAPI() async {
    List<dynamic> json = await TodoAppAPI.getTodos().timeout(Duration(seconds: 10));
    List<Todo> todosFromJson = List<Todo>();
    for (int i = 0; i < json.length; i++) {
      todosFromJson.add(Todo.fromJson(Map.from(json[i])));
    }
    _todos = todosFromJson;
    notifyListeners();
  }

  // Metoder för enskilda todos //

  void addTodo(String title) {
    Todo todo = Todo(title: title);
    if (_todoDataSource == TodoDataSource.api) TodoAppAPI.postTodo(todo);
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    if (_todoDataSource == TodoDataSource.api) TodoAppAPI.deleteTodo(todo);
    _todos.remove(todo);
    notifyListeners();
  }

  void checkUncheckTodo(Todo todo, bool isChecked) {
    _todos[_todos.indexOf(todo)].isChecked = isChecked;
    if (_todoDataSource == TodoDataSource.api) TodoAppAPI.putTodo(todo);
    notifyListeners();
  }

  // Getters & Setters //

  List<Todo> filteredTodos() {
    List<Todo> result = [];
    switch (_currentFilterOption) {
      case FilterOptions.all:
        result = _todos;
        break;
      case FilterOptions.done:
        result = _todos.where((todo) => todo.isChecked).toList();
        break;
      case FilterOptions.undone:
        result = _todos.where((todo) => !todo.isChecked).toList();
        break;
    }
    return result;
  }

  List<Todo> get todos => _todos;

  set currentFilterOptions(FilterOptions filterOption) {
    _currentFilterOption = filterOption;
    notifyListeners();
  }
}
