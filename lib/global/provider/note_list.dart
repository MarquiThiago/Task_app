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
    if (searchString == null || searchString == '') {
      return _items;
    } else {
      final taskFinder = List<Note>.from(_items)
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
    int index = _items.indexWhere((p) => p.id == note.id);

    if (index >= 0) {
      _items[index] = note;
      notifyListeners();
    }
  }

  void removeNote(Note note) {
    int index = _items.indexWhere((p) => p.id == note.id);

    if (index >= 0) {
      _items.removeWhere((p) => p.id == note.id);
      notifyListeners();
    }
  }
}
