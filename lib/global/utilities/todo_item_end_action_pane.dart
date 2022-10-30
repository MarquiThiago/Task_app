import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../provider/todo_provider.dart';
import 'my_button.dart';

class TodoItemEndActionPane extends StatelessWidget {
  const TodoItemEndActionPane({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (value) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Delete Task',
              style: Theme.of(context).textTheme.headline6,
            ),
            content: Text(
                'Are you sure you want to delete the task "${todo.title}"?'),
            actions: [
              MyButton(
                text: 'Delete',
                onPressed: () {
                  Provider.of<TodoProvider>(
                    context,
                    listen: false,
                  ).removeTodo(todo);
                  Navigator.of(context).pop();
                },
              ),
              MyButton(
                text: 'Cancel',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      icon: Icons.delete,
      backgroundColor: Theme.of(context).errorColor,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
