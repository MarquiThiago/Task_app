import 'package:flutter/material.dart';
import 'package:task_app/profile/pages/home.dart';
import 'package:task_app/profile/pages/profile_page.dart';
import '../theme/app_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoItem extends StatelessWidget {
  final String todoName;
  final bool todoDone;
  Function(bool?)? onChanged;
  Function(BuildContext) deleteFunction;

  // ignore: use_key_in_widget_constructors
  TodoItem(
      {required this.onChanged,
      required this.todoDone,
      required this.todoName,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 15,
          bottom: 10,
        ),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteFunction,
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
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12),
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppController.instance.isDark
                  ? const Color.fromARGB(240, 124, 77, 255)
                  : const Color.fromARGB(255, 225, 190, 231),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Checkbox(
                  value: todoDone,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(
                  todoName,
                  style: TextStyle(
                    color: AppController.instance.isDark
                        ? Colors.white
                        : Colors.black,
                    decoration: todoDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
