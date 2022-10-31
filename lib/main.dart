import 'package:flutter/material.dart';
import 'package:task_app/profile/pages/app.dart';
import 'global/data/user_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(const App());
}
