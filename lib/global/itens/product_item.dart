import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../models/todo.dart';
import '../../provider/product_list.dart';
import '../../routes/app_routes.dart';

class ProductItem extends StatefulWidget {
  final Todo todo;

  const ProductItem(
    this.todo, {
    Key? key,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) => Navigator.of(context).pushNamed(
                  AppRoutes.productForm,
                  arguments: widget.todo,
                )),
            icon: Icons.edit,
            backgroundColor: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (value) {
              Provider.of<TodoList>(
                context,
                listen: false,
              ).removeProduct(widget.todo);
            },
            icon: Icons.delete,
            backgroundColor: Theme.of(context).errorColor,
            borderRadius: BorderRadius.circular(12),
          )
        ],
      ),
      child: Card(
        color: widget.todo.isDone
            ? const Color.fromARGB(164, 192, 154, 199)
            : Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListTile(
            leading: Checkbox(
              value: widget.todo.isDone,
              onChanged: (value) => setState(() {
                widget.todo.isDone = !widget.todo.isDone;
              }),
              activeColor: Colors.black,
            ),
            title: Text(
              widget.todo.title,
              style: TextStyle(
                color: Colors.black,
                decoration: widget.todo.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              widget.todo.description,
              style: TextStyle(
                color: Colors.black,
                decoration: widget.todo.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
