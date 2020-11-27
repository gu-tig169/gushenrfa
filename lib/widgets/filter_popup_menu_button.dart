import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data_handler.dart';

class FilterPopupMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        tooltip: 'Press to show filtering options',
        icon: Icon(Icons.sort),
        onSelected: (FilterOptions result) {
          Provider.of<TodoProvider>(context, listen: false)
              .currentFilterOptions = result;
        },
        itemBuilder: (context) => <PopupMenuEntry<FilterOptions>>[
              const PopupMenuItem<FilterOptions>(
                  value: FilterOptions.all, child: Text("All")),
              const PopupMenuItem<FilterOptions>(
                  value: FilterOptions.done, child: Text("Done")),
              const PopupMenuItem<FilterOptions>(
                  value: FilterOptions.undone, child: Text("Undone"))
            ]);
  }
}
