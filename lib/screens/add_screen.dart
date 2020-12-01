import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data_handler.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController _inputController = TextEditingController()..text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _inputController,
              autofocus: true,
              decoration: InputDecoration(hintText: 'What to do?'),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.white),
                  Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              onPressed: () {
                Provider.of<TodoProvider>(context, listen: false).addTodo(_inputController.text);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.keyboard_return),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
