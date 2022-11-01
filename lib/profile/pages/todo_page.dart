import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/utilities/my_floating_button.dart';
import '../../global/itens/todo_item.dart';
import '../../global/provider/todo_provider.dart';
import '../../global/routes/app_routes.dart';
import '../../global/utilities/todo_menu_filter.dart';
import '../../global/utilities/todo_search_field.dart';
import '../../global/utilities/switch_mode.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (_, todos, __) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const SwitchMode(),
          title: const Text('TASK APP'),
          actions: const [
            TodoMenuFilter(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TodoSearchField(),
              Expanded(
                flex: 10,
                child: ListView.builder(
                  itemCount: todos.itemsCount,
                  itemBuilder: (ctx, i) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        TodoItem(
                          todo: todos.items[i],
                          toggleIsDone: () => todos.toggleIsDone(
                            todos.items[i],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                todos.itemsCount <= 1
                    ? 'Você tem ${todos.itemsCount} item a sua lista!'
                    : 'Você tem ${todos.itemsCount} itens nesta lista!',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: MyFloatingButton(
          icon: Icons.add,
          onPressed: () => Navigator.of(context).pushNamed(
            AppRoutes.todoEdit,
          ),
        ),
      ),
    );
  }
}
