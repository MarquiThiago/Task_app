import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/theme/app_controller.dart';
import 'package:task_app/global/utilities/my_floating_button.dart';
import '../../global/itens/todo_item.dart';
import '../../global/provider/todo_provider.dart';
import '../../global/routes/app_routes.dart';
import '../../global/utilities/color_enum.dart';
import '../../global/utilities/switch_mode.dart';

Timer? _debounce;

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoProvider todos = Provider.of(context);

    return Consumer<TodoProvider>(
      builder: (_, provider, __) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const SwitchMode(),
          title: const Text('TASK APP'),
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
                provider.searchTodoColor(value);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  onChanged: (searchString) {
                    if (_debounce?.isActive ?? false) _debounce?.cancel();
                    _debounce = Timer(const Duration(milliseconds: 500), () {
                      todos.searchTask(searchString);
                      // do something with query
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: ListView.builder(
                  itemCount: todos.itemsCount,
                  itemBuilder: (ctx, i) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        TodoItem(todos.items[i]),
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
