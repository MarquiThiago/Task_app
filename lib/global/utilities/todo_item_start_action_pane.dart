import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/todo.dart';
import '../routes/app_routes.dart';

class TodoItemStartActionPane extends StatelessWidget {
  const TodoItemStartActionPane({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: ((context) => Navigator.of(context).pushNamed(
            AppRoutes.todoEdit,
            arguments: todo,
          )),
      icon: Icons.edit,
      backgroundColor: Colors.blue,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
