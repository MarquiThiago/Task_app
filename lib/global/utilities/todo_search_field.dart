import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todo_provider.dart';

class TodoSearchField extends StatefulWidget {
  const TodoSearchField({super.key});

  @override
  State<TodoSearchField> createState() => _TodoSearchFieldState();
}

class _TodoSearchFieldState extends State<TodoSearchField> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, todo, child) => Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 4),
        child: TextField(
          onChanged: (searchString) {
            if (_debounce?.isActive ?? false) _debounce?.cancel();
            _debounce = Timer(const Duration(milliseconds: 500), () {
              todo.searchTask(searchString);
              // do something with query
            });
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
