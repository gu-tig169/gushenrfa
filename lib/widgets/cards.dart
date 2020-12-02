import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data_handler.dart';

class TodoCard extends StatefulWidget {
  final Todo todo;

  TodoCard({this.todo});

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: (widget.todo.isChecked)
            ? Theme.of(context).primaryColorLight
            : Theme.of(context).cardColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3.0,
            offset: Offset(0.0, 3.0),
          ),
        ],
      ),
      child: Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          padding: EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  color: Colors.transparent,
                  onPressed: () {
                    Provider.of<TodoProvider>(context, listen: false).removeTodo(widget.todo);
                  }),
              Expanded(
                child: Text(
                  widget.todo.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      decoration: (widget.todo.isChecked) ? TextDecoration.lineThrough : null),
                ),
              ),
              Checkbox(
                  value: widget.todo.isChecked,
                  activeColor: Color(0xFF658E5B),
                  onChanged: (bool value) {
                    Provider.of<TodoProvider>(context, listen: false)
                        .checkUncheckTodo(widget.todo, value);
                  }),
            ],
          )),
    );
  }
}
