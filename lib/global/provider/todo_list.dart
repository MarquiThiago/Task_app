import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_app/global/data/dummy_todo.dart';
import '../models/todo.dart';

class TodoList with ChangeNotifier {
  final List<Todo> _items = dummyTodos;

  List<Todo> get items {
    final task = _findTask(search);
    return task;
  }

  String? search = '';
  int get itemsCount {
    return items.length;
  }

  List<Todo> _findTask(String? searchString) {
    if (searchString == null || searchString == '') {
      return _items;
    } else {
      final taskFinder = List<Todo>.from(_items)
          .where((search) =>
              search.title.toUpperCase().startsWith(searchString.toUpperCase()))
          .toList();
      if (taskFinder.isEmpty) {
        return [];
      } else {
        return taskFinder;
      }
    }
  }

  void searchTask(String? searchString) {
    search = searchString;
    notifyListeners();
  }

  void saveTodo(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final todo = Todo(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      title: data['title'] as String,
      description: data['description'] as String,
      colorTask: (data['colorTask'] == "") ? null : data['colorTask'] as int,
      dateLimit:
          (data['dateLimit'] == null) ? null : data['dateLimit'] as DateTime,
    );

    if (hasId) {
      updateTodo(todo);
    } else {
      addTodo(todo);
    }
  }

  void addTodo(Todo todo) {
    _items.insert(0, todo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    int index = _items.indexWhere((t) => t.id == todo.id);

    if (index >= 0) {
      _items[index] = todo;
      notifyListeners();
    }
  }

  void removeTodo(Todo todo) {
    int index = _items.indexWhere((t) => t.id == todo.id);

    if (index >= 0) {
      _items.removeWhere((t) => t.id == todo.id);
      notifyListeners();
    }
  }
}
