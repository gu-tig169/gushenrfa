import 'dart:convert';

import 'data_handler.dart';

import 'package:http/http.dart' as http;

class TodoAppAPI {
  static final String _url = 'https://todoapp-api-vldfm.ondigitalocean.app/';
  static final String _key = 'key=c8dd0d35-8556-437e-950f-c332e9efe8b9';

  static Future<List<dynamic>> getTodos() async {
    // GET /todos?key=[YOUR API KEY]
    http.Response response = await http.get('${_url}todos?$_key');

    return jsonDecode(response.body);
  }

  static void postTodo(Todo todo) async {
    // POST /todos?key=[YOUR API KEY]
    await http.post('${_url}todos?$_key',
        headers: <String, String>{'Content-Type': 'application/json'}, body: todo.toJson());
  }

  static void putTodo(Todo todo) {
    // PUT /todos/:id?key=[YOUR API KEY]
    http.put('${_url}todos/${todo.id}?$_key',
        headers: <String, String>{'Content-Type': 'application/json'}, body: todo.toJson());
  }

  static void deleteTodo(Todo todo) {
    // DELETE /todos/:id?key=[YOUR API KEY]
    http.delete('${_url}todos/${todo.id}?$_key');
  }
}
