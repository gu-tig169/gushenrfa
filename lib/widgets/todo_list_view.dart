import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data_handler.dart';
import 'cards.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Consumer<TodoProvider>(
        builder: (context, state, child) => ListView.separated(
          itemBuilder: (context, index) => Container(
            child: TodoCard(
                todo: state.displayedTodos[index],
                onDelete: () {
                  state.removeTodo(state.displayedTodos[index]);
                }),
          ),
          itemCount: state.displayedTodos.length,
          separatorBuilder: (context, index) =>
              Divider(color: Theme.of(context).scaffoldBackgroundColor),
        ),
      ),
    );
  }
}
