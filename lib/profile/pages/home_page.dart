import 'package:flutter/material.dart';
import 'package:task_app/global/theme/theme.controller.dart';
import 'package:task_app/profile/pages/tasks_page.dart';
import '../../global/theme/app_controller.dart';
import 'note_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (constext, child) {
        return MaterialApp(
          theme: Themes.dark,
          darkTheme: Themes.dark,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 2,
            child: Scaffold(
              drawer: Drawer(
                backgroundColor: AppController.instance.isDark
                    ? const Color.fromARGB(255, 46, 29, 53)
                    : const Color.fromARGB(255, 248, 215, 255),
                child: Switch(
                  value: AppController.instance.isDark,
                  onChanged: (value) {
                    AppController.instance.changeTheme();
                  },
                ),
              ),
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'TASK APP',
                  style: TextStyle(
                    color: AppController.instance.isDark
                        ? Colors.white
                        : Colors.purple,
                  ),
                ),
                backgroundColor:
                    AppController.instance.isDark ? Colors.black : Colors.white,
                elevation: 0,
                // bottom: TabBar(
                //   labelColor: AppController.instance.isDark
                //       ? Colors.white
                //       : Colors.black,
                //   indicatorColor: Colors.purple,
                //   tabs: const [
                //     Tab(text: 'Tasks'),
                //     Tab(text: 'Notes'),
                //   ],
                // ),
              ),
              body: const TabBarView(
                children: [
                  TodoPage(),
                  NotesPage(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
