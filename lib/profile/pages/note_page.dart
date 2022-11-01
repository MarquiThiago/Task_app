import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/utilities/my_floating_button.dart';
import 'package:task_app/global/utilities/note_menu_filter.dart';
import 'package:task_app/global/utilities/note_search_field.dart';
import '../../global/itens/note_item.dart';
import '../../global/provider/note_provider.dart';
import '../../global/routes/app_routes.dart';
import '../../global/utilities/switch_mode.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteProvider notes = Provider.of<NoteProvider>(context);
    return Consumer<NoteProvider>(
      builder: (_, provider, __) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const SwitchMode(),
          title: const Text('TASK APP'),
          actions: const [
            NoteMenuFilter(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NoteSearchField(),
              Expanded(
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
              Text(
                notes.itemsCount <= 1
                    ? 'Você tem ${notes.itemsCount} item a sua lista!'
                    : 'Você tem ${notes.itemsCount} itens nesta lista!',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: MyFloatingButton(
          icon: Icons.add,
          onPressed: () => Navigator.of(context).pushNamed(
            AppRoutes.noteEdit,
          ),
        ),
      ),
    );
  }
}
