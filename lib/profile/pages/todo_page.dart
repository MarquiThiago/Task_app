import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/utilities/field.dart';
import 'package:task_app/global/utilities/my_floating_button.dart';
import '../../global/itens/todo_item.dart';
import '../../global/provider/todo_list.dart';
import '../../routes/app_routes.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoList todos = Provider.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Expanded(
              //       child: TextField(
              //     decoration: InputDecoration(
              //       prefixIcon: const Icon(Icons.search),
              //       hintText: 'search',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //     ),
              //   )),
              // ),
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
            ],
          ),
        ),
      ),
      floatingActionButton: MyFloatingButton(
        icon: Icons.add,
        onPressed: () => Navigator.of(context).pushNamed(
          AppRoutes.productForm,
        ),
      ),
    );
  }
}
