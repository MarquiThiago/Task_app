import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/provider/todo_provider.dart';
import 'package:task_app/global/utilities/consts.dart';
import 'package:task_app/global/utilities/todo_item_end_action_pane.dart';
import '../routes/app_routes.dart';
import '../models/todo.dart';
import '../utilities/todo_item_start_action_pane.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;

  const TodoItem(
    this.todo, {
    Key? key,
  }) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  DateTime date = DateTime(2022, 12, 24);
  @override
  Widget build(BuildContext context) {
    final TodoProvider todos = Provider.of(context);
    return Consumer<TodoProvider>(
      builder: (_, provider, __) => Slidable(
        startActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [TodoItemStartActionPane(todo: widget.todo)]),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [TodoItemEndActionPane(todo: widget.todo)],
        ),
        child: Card(
          color: widget.todo.isDone
              ? widget.todo.colorEnum.color.withAlpha(100)
              : widget.todo.colorEnum.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              onTap: () => Navigator.of(context).pushNamed(
                AppRoutes.todoInfoPage,
                arguments: widget.todo,
              ),
              leading: Checkbox(
                value: widget.todo.isDone,
                onChanged: (value) => setState(() {
                  widget.todo.isDone = !widget.todo.isDone;
                }),
                activeColor: Colors.black,
              ),
              title: Text(
                widget.todo.title,
                style: TextStyle(
                  color: Colors.black,
                  decoration: widget.todo.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.todo.description,
                    style: TextStyle(
                      color: Colors.black,
                      decoration: widget.todo.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Text(
                          DateFormat('d MMM y')
                              .format(widget.todo.dateLimit ?? DateTime.now()),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      Chip(
                        label: Text(
                          widget.todo.tag,
                          style: TextStyle(
                            fontSize: 14,
                            decoration: widget.todo.isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        backgroundColor:
                            widget.todo.colorEnum.color.withAlpha(100),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
