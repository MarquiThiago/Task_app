import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/utilities/note_item_end_action_pane.dart';
import 'package:task_app/global/utilities/note_item_start_action_pane.dart';
import '../models/note.dart';
import '../provider/note_provider.dart';
import '../routes/app_routes.dart';

class NoteItem extends StatefulWidget {
  final Note note;

  const NoteItem(
    this.note, {
    Key? key,
  }) : super(key: key);

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  TimeOfDay time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (context, value, child) => Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [NoteItemStartActionPane(note: widget.note)],
        ),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [NoteItemEndActionPane(note: widget.note)],
        ),
        child: Card(
          color: widget.note.colorEnum.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              onTap: () => Navigator.of(context).pushNamed(
                AppRoutes.noteInfoPage,
                arguments: widget.note,
              ),
              title: Text(widget.note.title,
                  style: Theme.of(context).textTheme.headline5),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.note.description,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 80),
                        child: Text(
                          DateFormat('d MMM y').format(DateTime.now()),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      Chip(
                        label: Text(
                          widget.note.tag,
                          style: const TextStyle(fontSize: 14),
                        ),
                        backgroundColor:
                            widget.note.colorEnum.color.withAlpha(100),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
