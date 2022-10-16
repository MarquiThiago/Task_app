import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:task_app/global/utilities/field.dart';

import '../../global/utilities/consts.dart';
import '../../global/utilities/my_button.dart';
import '../../global/utilities/my_calendar.dart';
import '../../models/todo.dart';
import '../../provider/product_list.dart';

class TodoEdit extends StatefulWidget {
  const TodoEdit({Key? key}) : super(key: key);

  @override
  State<TodoEdit> createState() => _TodoEditState();
}

class _TodoEditState extends State<TodoEdit> {
  final _formKey = GlobalKey<FormState>();
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

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<TodoList>(
      context,
      listen: false,
    ).saveProduct(_formData);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('ADD TASK'),
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Field(
                text: 'Add a new task',
                initialValue: _formData['title']?.toString(),
                hint: 'title',
                lines: 1,
                onSaved: (title) => _formData['title'] = title ?? '',
              ),
              const SizedBox(
                height: 20,
              ),
              Field(
                text: 'Add the task description',
                initialValue: _formData['description']?.toString(),
                hint: 'description',
                lines: 1,
                onSaved: (description) =>
                    _formData['description'] = description ?? '',
              ),
              addVerticalSpace(20),
              Text(
                'Choose the card color',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              addVerticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                    ),
                  ),
                  addHorizontalSpace(10),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.pink[500],
                    ),
                  ),
                  addHorizontalSpace(10),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.yellow[800],
                    ),
                  ),
                  addHorizontalSpace(10),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.red[800],
                    ),
                  ),
                  addHorizontalSpace(10),
                ],
              ),
              addVerticalSpace(30),
              Text(
                'Choose a task date limit ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              addVerticalSpace(30),
              const MyCalendar(),
              addVerticalSpace(40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(text: 'save', onPressed: _submitForm),
                  addHorizontalSpace(10),
                  MyButton(
                    text: 'cancel',
                    onPressed: (() => Navigator.of(context).pop()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
