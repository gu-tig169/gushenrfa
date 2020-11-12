import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  TodoCard({@required this.title, this.checked = false});

  final String title;
  final bool checked;

  @override
  _TodoCardState createState() => _TodoCardState(checked);
}

class _TodoCardState extends State<TodoCard> {
  _TodoCardState(this.checked);

  bool checked = false;

  void _onDeleteButtonPressed() {
    print('Delete ${widget.title} (not functional)');
  }

  bool _onCheckBoxPressed(value) {
    setState(() {
      this.checked = value;
      print('${widget.title} ${(value) ? 'checked' : 'unchecked'} (not functional)');
    });
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      padding: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.delete_forever, color: Color(0xBF754d5a)),
            color: Colors.transparent,
            onPressed: _onDeleteButtonPressed
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Checkbox(
            value: checked, 
            activeColor: Color(0xFF658E5B),
            onChanged: _onCheckBoxPressed
          ),
        ],
      )
    );
  }
}

//CardManager håller koll på alla todo cards och alla relevanta metoder i samband med dem (get/add/delete/save/etc)
class CardManager {

  CardManager({todoCards}) {
    if (todoCards == null) {
      //Genererar en testlista om ingen kortlista är angiven vid instansering
      this.todoCards = List.generate(20, (index) => TodoCard(title: 'Todo: $index'));
    } else {
      this.todoCards = todoCards;
    }
  }

  List<TodoCard> todoCards;

  List<TodoCard> getCards() {
    return todoCards;
  }

  void addCard(String title) {
    print('Added: [$title] (not functional)');
  }

  void deleteCard(String title) {
    print('Delete [$title] (not functional)');
  }

  void saveCards(List<TodoCard> todoCards) {
    print('Save todo cards (not functional)');
  }
}