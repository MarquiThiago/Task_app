import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:task_app/global/provider/todo_list.dart';
import 'package:task_app/profile/pages/profilepage.dart';
import 'package:task_app/profile/pages/todo_page.dart';

import '../../global/models/todo.dart';
import '../../global/theme/app_controller.dart';
import '../../global/theme/color_enum.dart';
import 'note_page.dart';

Todo? todo;

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
    return Consumer<TodoList>(
      builder: (_, provider, __) => Scaffold(
        drawer: Drawer(
          child: Switch(
            value: AppController.instance.isDark,
            onChanged: (value) {
              setState(() {
                AppController.instance.changeTheme();
              });
            },
          ),
        ),
        appBar: AppBar(
          actions: [
            PopupMenuButton<ColorEnum>(
              color: AppController.instance.isDark
                  ? Colors.grey[850]
                  : Colors.white,
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
                provider.searchColor(value);
              },
            ),
          ],
          title: const Text(
            'TASK APP',
          ),
          elevation: 0,
        ),
        body: screens[index],
        bottomNavigationBar: NavigationBar(
          height: 55,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
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
    );
  }
}
