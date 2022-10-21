import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/utilities/my_floating_button.dart';

import '../../global/itens/todo_item.dart';
import '../../global/provider/todo_list.dart';
import '../../global/routes/app_routes.dart';

Timer? _debounce;

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoList todos = Provider.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
            Text(if(todos.itemsCount == 0){'Você não tem itens a sua lista'}else if(todos.itemsCount == 1){'Você tem ${todos.itemsCount} item nesta lista!'}else{'Você tem ${todos.itemsCount} itens nesta lista!'};
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
    );
  }
}

              todos.itemsCount == 0
                  ? 'Você não tem itens a sua lista'
                  : 'Você tem ${todos.itemsCount} itens nesta lista!',