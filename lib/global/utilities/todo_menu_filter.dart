import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/provider/todo_provider.dart';

import '../theme/app_controller.dart';
import 'color_enum.dart';

class TodoMenuFilter extends StatelessWidget {
  const TodoMenuFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, todo, child) => PopupMenuButton<ColorEnum>(
        color: AppController.instance.isDark ? Colors.grey[850] : Colors.white,
        itemBuilder: (_) => [
          const PopupMenuItem(
            value: ColorEnum.all,
            child: Text('All'),
          ),
          ...ColorEnum.avaliableColors.map((e) => PopupMenuItem(
                value: e,
                child: Text(e.toString()),
              ))
        ],
        onSelected: (value) {
          todo.searchTodoColor(value);
        },
      ),
    );
  }
}
