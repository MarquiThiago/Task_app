import 'package:flutter/material.dart';
import 'package:task_app/global/provider/todo_provider.dart';
import 'package:task_app/profile/pages/app.dart';
import 'package:provider/provider.dart';
import 'global/data/user_preferences.dart';
import 'global/provider/note_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TodoProvider>(create: (context) => TodoProvider()),
      ChangeNotifierProvider<NoteProvider>(create: (context) => NoteProvider())
    ],
    child: const App(),
  ));
}
