import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/todo.dart';
import '../../profile/pages/todo_info_page.dart';
import '../provider/todo_list.dart';
import '../../routes/app_routes.dart';

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
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) => Navigator.of(context).pushNamed(
                  AppRoutes.productForm,
                  arguments: widget.todo,
                )),
            icon: Icons.edit,
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (value) {
              Provider.of<TodoList>(
                context,
                listen: false,
              ).removeProduct(widget.todo);
            },
            icon: Icons.delete,
            backgroundColor: Theme.of(context).errorColor,
            borderRadius: BorderRadius.circular(12),
          )
        ],
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          AppRoutes.todoInfoPage,
          arguments: widget.todo,
        ),
        child: Card(
          color: widget.todo.isDone
              ? const Color.fromARGB(161, 147, 145, 145)
              : (widget.todo.colorTask == null)
                  ? Theme.of(context).cardColor
                  : Color(widget.todo.colorTask!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
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
                  Text(
                    DateFormat('d MMM y')
                        .format(widget.todo.dateLimit ?? DateTime.now()),
                    style: Theme.of(context).textTheme.headline4,
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
