import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/provider/note_provider.dart';
import '../models/note.dart';
import 'my_button.dart';

class NoteItemEndActionPane extends StatelessWidget {
  const NoteItemEndActionPane({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (value) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Delete Task',
              style: Theme.of(context).textTheme.headline6,
            ),
            content: Text(
                'Are you sure you want to delete the task "${note.title}"?'),
            actions: [
              MyButton(
                text: 'Delete',
                onPressed: () {
                  Provider.of<NoteProvider>(
                    context,
                    listen: false,
                  ).removeNote(note);
                  Navigator.of(context).pop();
                },
              ),
              MyButton(
                text: 'Cancel',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      icon: Icons.delete,
      backgroundColor: Theme.of(context).errorColor,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
