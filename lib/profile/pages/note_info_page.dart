import 'package:flutter/material.dart';
import 'package:task_app/global/theme/app_controller.dart';
import 'package:task_app/global/utilities/space.dart';

import '../../global/models/note.dart';

class NoteInfoPage extends StatefulWidget {
  const NoteInfoPage({super.key});

  @override
  State<NoteInfoPage> createState() => _NoteInfoPageState();
}

class _NoteInfoPageState extends State<NoteInfoPage> {
  final _formData = <String, Object>{};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final note = arg as Note;
        _formData['id'] = note.id;
        _formData['title'] = note.title;
        _formData['description'] = note.description;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Item'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          color: AppController.instance.isDark
              ? Colors.grey[900]
              : Colors.grey[400],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _formData['title'].toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                addVerticalSpace(20),
                Text(
                  _formData['description'].toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
