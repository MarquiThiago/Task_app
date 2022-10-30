import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../provider/note_provider.dart';
import '../routes/app_routes.dart';
import '../utilities/my_button.dart';

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
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) => Navigator.of(context).pushNamed(
                  AppRoutes.noteEdit,
                  arguments: widget.note,
                )),
            icon: Icons.edit,
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (value) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Delete Task',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  content: Text(
                      'Are you sure you want to delete the task "${widget.note.title}"?'),
                  actions: [
                    MyButton(
                      text: 'Delete',
                      onPressed: () {
                        Provider.of<NoteProvider>(
                          context,
                          listen: false,
                        ).removeNote(widget.note);
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
          )
        ],
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
                        DateFormat('d MMM y')
                            .format(widget.note.dateLimit ?? DateTime.now()),
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
    );
  }
}
