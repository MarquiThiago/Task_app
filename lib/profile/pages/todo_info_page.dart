import 'package:flutter/material.dart';
import 'package:task_app/global/utilities/consts.dart';
import '../../global/theme/app_controller.dart';
import '../../models/todo.dart';

class TodoInfoPage extends StatefulWidget {
  const TodoInfoPage({super.key});

  @override
  State<TodoInfoPage> createState() => _TodoInfoPageState();
}

class _TodoInfoPageState extends State<TodoInfoPage> {
  final _formData = <String, Object>{};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final todo = arg as Todo;
        _formData['id'] = todo.id;
        _formData['title'] = todo.title;
        _formData['description'] = todo.description;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          color: AppController.instance.isDark
              ? Colors.grey[900]
              : Colors.grey[400],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _formData['title'].toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                addVerticalSpace(20),
                Text(
                  _formData['description'].toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
