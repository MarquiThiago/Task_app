import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/note.dart';
import '../routes/app_routes.dart';

class NoteItemStartActionPane extends StatelessWidget {
  const NoteItemStartActionPane({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: ((context) => Navigator.of(context).pushNamed(
            AppRoutes.noteEdit,
            arguments: note,
          )),
      icon: Icons.edit,
      backgroundColor: Colors.blue,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
