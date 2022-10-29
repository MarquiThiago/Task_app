import 'package:flutter/material.dart';
import 'package:task_app/global/data/dummy_todo.dart';
import '../models/todo.dart';
import '../theme/color_enum.dart';

class TodoList with ChangeNotifier {
  final List<Todo> _items = dummyTodos;

  List<Todo> get items {
    final task = _findTask();
    return task;
  }

  String search = '';
  ColorEnum color = ColorEnum.all;
  int get itemsCount {
    return items.length;
  }

  List<Todo> _findTask() {
    return _items.where((element) {
      return ((search == '') ||
              element.title.toUpperCase().startsWith(search.toUpperCase()) ||
              element.description
                  .toUpperCase()
                  .startsWith(search.toUpperCase()) ||
              element.dateLimit
                  .toString()
                  .toUpperCase()
                  .contains(search.toUpperCase())) &&
          ((color == ColorEnum.all) || element.colorEnum == color);
    }).toList();
  }

  void searchTask(String searchString) {
    search = searchString;
    notifyListeners();
  }

  void searchTodoColor(ColorEnum colorEnum) {
    color = colorEnum;
    notifyListeners();
  }

  void saveTodo(Todo todo) {
    int index = _items.indexWhere((t) => t.id == todo.id);

    if (index >= 0) {
      _items[index] = todo;
    } else {
      _items.insert(0, todo);
    }

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    int index = _items.indexWhere((t) => t.id == todo.id);

    if (index >= 0) {
      _items.removeWhere((t) => t.id == todo.id);
      notifyListeners();
    }
  }
}
