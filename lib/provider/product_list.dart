import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_app/global/data/dummy_todo.dart';

import '../models/todo.dart';

class TodoList with ChangeNotifier {
  final List<Todo> _items = dummyTodos;

  List<Todo> get items => [..._items];

  int get itemsCount {
    return _items.length;
  }

  void saveProduct(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final todo = Todo(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      title: data['title'] as String,
      description: data['description'] as String,
    );

    if (hasId) {
      updateProduct(todo);
    } else {
      addProduct(todo);
    }
  }

  void addProduct(Todo todo) {
    _items.add(todo);
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
