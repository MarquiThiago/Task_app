import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/provider/note_provider.dart';

class NoteSearchField extends StatefulWidget {
  const NoteSearchField({super.key});

  @override
  State<NoteSearchField> createState() => _NoteSearchFieldState();
}

class _NoteSearchFieldState extends State<NoteSearchField> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (context, note, child) => Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 4),
        child: TextField(
          onChanged: (searchString) {
            if (_debounce?.isActive ?? false) _debounce?.cancel();
            _debounce = Timer(const Duration(milliseconds: 500), () {
              note.searchTask(searchString);
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
