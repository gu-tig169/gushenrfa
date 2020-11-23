import 'package:flutter/material.dart';

import '../data_handler.dart';

class AddScreen extends StatefulWidget {
  final DataHandler dataHandler;

  AddScreen(this.dataHandler);


  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  TextEditingController _inputController = TextEditingController();

  void _onAddButtonPressed() {
    setState(() {
      widget.dataHandler.todos.add(Todo(title: _inputController.text));
    });
  }

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
              decoration: InputDecoration(
                hintText: 'What to do?'
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white
                  ),
                  Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              onPressed: () {
                _onAddButtonPressed();
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
        }
      ),
    );
  }
}