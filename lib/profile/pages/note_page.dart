import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/utilities/my_floating_button.dart';
import '../../global/itens/note_item.dart';
import '../../global/provider/note_list.dart';
import '../../routes/app_routes.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteList notes = Provider.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: notes.itemsCount,
          itemBuilder: (ctx, i) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                NoteItem(notes.items[i]),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: MyFloatingButton(
        icon: Icons.add,
        onPressed: () => Navigator.of(context).pushNamed(
          AppRoutes.noteEdit,
        ),
      ),
    );
  }
}
