import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/provider/note_provider.dart';
import 'package:task_app/global/provider/todo_provider.dart';
import 'package:task_app/global/routes/app_routes.dart';
import 'package:task_app/profile/pages/home_page.dart';
import 'package:task_app/profile/pages/profile_edit_page.dart';
import 'package:task_app/profile/pages/profilepage.dart';
import 'package:task_app/profile/pages/todo_edit_page.dart';
import 'package:task_app/profile/pages/todo_info_page.dart';
import 'package:task_app/profile/pages/todo_page.dart';
import '../../global/theme/app_controller.dart';
import '../../global/theme/theme.controller.dart';
import 'note_edit_page.dart';
import 'note_info_page.dart';
import 'note_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoProvider>(
            create: (context) => TodoProvider()),
        ChangeNotifierProvider<NoteProvider>(
            create: (context) => NoteProvider())
      ],
      child: AnimatedBuilder(
        animation: AppController.instance,
        builder: ((context, child) => MaterialApp(
              title: 'TASK APP',
              theme: AppController.instance.isDark ? Themes.dark : Themes.light,
              darkTheme: Themes.dark,
              themeMode: ThemeMode.light,
              debugShowCheckedModeBanner: false,
              initialRoute: AppRoutes.home,
              home: const HomePage(),
              routes: {
                AppRoutes.todoEdit: (ctx) => const TodoEdit(),
                AppRoutes.todoInfoPage: (ctx) => const TodoInfoPage(),
                AppRoutes.todoPage: (ctx) => const TodoPage(),
                AppRoutes.noteEdit: (ctx) => const NoteEdit(),
                AppRoutes.notePage: (ctx) => const NotePage(),
                AppRoutes.noteInfoPage: (ctx) => const NoteInfoPage(),
                AppRoutes.profilePage: (ctx) => const ProfilePage(),
                AppRoutes.profileEdit: (ctx) => const EditProfilePage(),
              },
            )),
      ),
    );
  }
}
