import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_app/global/data/dummy_note.dart';
import '../models/note.dart';

class NoteList with ChangeNotifier {
  final List<Note> _items = dummyNotes;

  List<Note> get items {
    final task = _findTask(search);
    return task;
  }

  String? search = '';
  int get itemsCount {
    return items.length;
  }

  List<Note> _findTask(String? searchString) {
    return _items.where((element) {
      return (searchString == null || searchString == '') ||
          element.title.toUpperCase().startsWith(searchString.toUpperCase()) ||
          element.description
              .toUpperCase()
              .startsWith(searchString.toUpperCase()) ||
          element.dateLimit
              .toString()
              .toUpperCase()
              .contains(searchString.toUpperCase()) ||
          element.colorTask
              .toString()
              .toUpperCase()
              .contains(searchString.toUpperCase());
    }).toList();
  }

  void searchTask(String? searchString) {
    switch (searchString) {
      case 'blue':
        search = 'Color(0xff64b5f6)';
        break;
      case 'pink':
        search = 'Color(0xfff06292)';
        break;
      case 'yellow':
        search = 'Color(0xffffb74d)';
        break;
      case 'red':
        search = 'Color(0xffe57373)';
        break;
      case 'purple':
        search = 'Color(0xffba68c8)';
        break;
      case 'all':
        search = '';
        break;
      default:
        search = searchString;
    }
    notifyListeners();
  }

  void saveProduct(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final note = Note(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      title: data['title'] as String,
      description: data['description'] as String,
      colorTask: (data['colorTask'] == "") ? null : data['colorTask'] as int,
      dateLimit:
          (data['dateLimit'] == null) ? null : data['dateLimit'] as DateTime,
    );

    if (hasId) {
      updateProduct(note);
    } else {
      addProduct(note);
    }
  }

  void addProduct(Note note) {
    _items.insert(0, note);
    notifyListeners();
  }

  void updateProduct(Note note) {
    int index = _items.indexWhere((n) => n.id == note.id);

    if (index >= 0) {
      _items[index] = note;
      notifyListeners();
    }
  }

  void removeNote(Note note) {
    int index = _items.indexWhere((n) => n.id == note.id);

    if (index >= 0) {
      _items.removeWhere((n) => n.id == note.id);
      notifyListeners();
    }
  }
}
