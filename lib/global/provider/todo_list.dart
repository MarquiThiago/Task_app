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
          .where((pesquisa) => pesquisa.title
              .toUpperCase()
              .startsWith(searchString.toUpperCase()))
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

  void saveProduct(Map<String, Object> data) {
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
      updateProduct(todo);
    } else {
      addProduct(todo);
    }
  }

  void addProduct(Todo todo) {
    _items.insert(0, todo);
    notifyListeners();
  }

  void updateProduct(Todo todo) {
    int index = _items.indexWhere((p) => p.id == todo.id);

    if (index >= 0) {
      _items[index] = todo;
      notifyListeners();
    }
  }

  void removeProduct(Todo todo) {
    int index = _items.indexWhere((p) => p.id == todo.id);

    if (index >= 0) {
      _items.removeWhere((p) => p.id == todo.id);
      notifyListeners();
    }
  }
}
