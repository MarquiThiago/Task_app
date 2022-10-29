import 'package:flutter/material.dart';
import 'package:task_app/global/provider/todo_list.dart';
import 'package:task_app/profile/pages/app.dart';

import 'package:provider/provider.dart';
import 'global/data/user_preferences.dart';
import 'global/provider/note_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TodoList>(create: (context) => TodoList()),
      ChangeNotifierProvider<NoteList>(create: (context) => NoteList())
    ],
    child: const App(),
  ));
}
