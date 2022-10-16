import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/utilities/my_floating_button.dart';
import '../../global/itens/product_item.dart';
import '../../provider/product_list.dart';
import '../../routes/app_routes.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoList todos = Provider.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: todos.itemsCount,
          itemBuilder: (ctx, i) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ProductItem(todos.items[i]),
              ],
            ),
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
