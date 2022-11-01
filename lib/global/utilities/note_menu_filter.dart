import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/note_provider.dart';
import '../theme/app_controller.dart';
import 'color_enum.dart';

class NoteMenuFilter extends StatelessWidget {
  const NoteMenuFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (context, note, child) => PopupMenuButton<ColorEnum>(
        color: AppController.instance.isDark ? Colors.grey[850] : Colors.white,
        itemBuilder: (_) => [
          const PopupMenuItem(
            value: ColorEnum.all,
            child: Text('All'),
          ),
          ...ColorEnum.avaliableColors.map((e) => PopupMenuItem(
                value: e,
                child: Text(e.toString()),
              ))
        ],
        onSelected: (value) {
          note.searchNoteColor(value);
        },
      ),
    );
  }
}
