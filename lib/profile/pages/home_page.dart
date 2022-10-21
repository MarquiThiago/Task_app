import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:task_app/global/provider/note_list.dart';
import 'package:task_app/global/provider/todo_list.dart';
import 'package:task_app/global/theme/theme.controller.dart';
import 'package:task_app/profile/pages/note_edit_page.dart';
import 'package:task_app/profile/pages/profile_edit_page.dart';
import 'package:task_app/profile/pages/profilepage.dart';
import 'package:task_app/profile/pages/todo_edit_page.dart';
import 'package:task_app/profile/pages/todo_info_page.dart';
import 'package:task_app/profile/pages/todo_page.dart';
import 'package:task_app/global/routes/app_routes.dart';

import '../../global/theme/app_controller.dart';
import 'note_info_page.dart';
import 'note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final screens = [
    const TodoPage(),
    const NotePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (constext, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (ctx) => NoteList(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => TodoList(),
            )
          ],
          child: MaterialApp(
              theme: AppController.instance.isDark ? Themes.dark : Themes.light,
              darkTheme: Themes.dark,
              themeMode: ThemeMode.light,
              debugShowCheckedModeBanner: false,
              home: DefaultTabController(
                length: 2,
                child: Scaffold(
                  drawer: Drawer(
                    child: Switch(
                      value: AppController.instance.isDark,
                      onChanged: (value) {
                        AppController.instance.changeTheme();
                      },
                    ),
                  ),
                  appBar: AppBar(
                    title: const Text(
                      'TASK APP',
                    ),
                    elevation: 0,
                  ),
                  body: screens[index],
                  bottomNavigationBar: NavigationBar(
                    height: 55,
                    selectedIndex: index,
                    onDestinationSelected: (index) =>
                        setState(() => this.index = index),
                    destinations: const [
                      NavigationDestination(
                        icon: Icon(Icons.list),
                        label: 'Todo\'s',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.note),
                        label: 'Notes',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),
              routes: {
                AppRoutes.todoEdit: (ctx) => const TodoEdit(),
                AppRoutes.todoInfoPage: (ctx) => const TodoInfoPage(),
                AppRoutes.todoPage: (ctx) => const TodoPage(),
                AppRoutes.noteEdit: (ctx) => const NoteEdit(),
                AppRoutes.notePage: (ctx) => const NotePage(),
                AppRoutes.noteInfoPage: (ctx) => const NoteInfoPage(),
                AppRoutes.profilePage: (ctx) => const ProfilePage(),
                AppRoutes.profileEdit: (ctx) => const EditProfilePage(),
              }),
        );
      },
    );
  }
}
