import 'package:flutter/material.dart';
import 'package:task_app/global/data/dummy_note.dart';
import 'package:task_app/global/theme/color_enum.dart';
import '../models/note.dart';

class NoteList with ChangeNotifier {
  final List<Note> _items = dummyNotes;

  List<Note> get items {
    final task = _findTask();
    return task;
  }

  String search = '';
  ColorEnum color = ColorEnum.all;
  int get itemsCount {
    return items.length;
  }

  List<Note> _findTask() {
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

  void searchNoteColor(ColorEnum colorEnum) {
    color = colorEnum;
    notifyListeners();
  }

  void saveNote(Note note) {
    int index = _items.indexWhere((n) => n.id == note.id);

    if (index >= 0) {
      _items[index] = note;
    } else {
      _items.insert(0, note);
    }

    notifyListeners();
  }

  void removeNote(Note note) {
    int index = _items.indexWhere((n) => n.id == note.id);

    if (index >= 0) {
      _items.removeWhere((n) => n.id == note.id);
      notifyListeners();
    }
  }
}
