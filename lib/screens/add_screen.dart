import 'package:flutter/material.dart';
import 'package:gushenrfa/cards.dart';
import 'package:gushenrfa/main.dart';

class AddScreen extends StatelessWidget {
  AddScreen(this.cardManager);

  final CardManager cardManager;

  void _onAddButtonPressed() {
    cardManager.addCard('title');
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
              decoration: InputDecoration(
                hintText: 'What to do?'
              ),
            ),
            RaisedButton(
              color: Color(0xFF2296F3),
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
              onPressed: _onAddButtonPressed,
              
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