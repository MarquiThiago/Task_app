import 'package:flutter/material.dart';
import 'package:task_app/global/theme/theme.controller.dart';
import 'package:task_app/profile/pages/note_edit_page.dart';
import 'package:task_app/profile/pages/todo_edit_page.dart';
import 'package:task_app/profile/pages/products_page.dart';
import 'package:task_app/provider/note_list.dart';
import 'package:task_app/provider/product_list.dart';
import 'package:task_app/routes/app_routes.dart';
import 'package:task_app/profile/pages/profilepage.dart';
import '../../global/theme/app_controller.dart';
import 'note_page.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final screens = const [
    ProductsPage(),
    NotePage(),
    ProfilePage(),
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
                AppRoutes.productForm: (ctx) => const TodoEdit(),
                AppRoutes.noteEdit: (ctx) => const NoteEdit(),
              }),
        );
      },
    );
  }
}
