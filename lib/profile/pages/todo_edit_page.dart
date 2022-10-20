import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:task_app/global/utilities/chip.dart';
import 'package:task_app/global/utilities/field.dart';

import '../../global/utilities/consts.dart';
import '../../global/utilities/my_button.dart';
import '../../models/todo.dart';
import '../../global/provider/todo_list.dart';

class TodoEdit extends StatefulWidget {
  const TodoEdit({Key? key}) : super(key: key);

  @override
  State<TodoEdit> createState() => _TodoEditState();
}

class _TodoEditState extends State<TodoEdit> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};
  DateTime? dateLimit;
  DateTime date = DateTime(2022, 12, 24);
  int? colorTask;

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
        colorTask = todo.colorTask;
        dateLimit = todo.dateLimit;
        date = todo.dateLimit ?? DateTime.now();
      }
    }
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    _formData['colorTask'] = colorTask ?? '';
    _formData['dateLimit'] = dateLimit ?? DateTime.now();

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
                lines: 3,
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
                  GestureDetector(
                    onTap: () {
                      colorTask = (Colors.blue[300])!.value;
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      radius: 17,
                    ),
                  ),
                  addHorizontalSpace(10),
                  GestureDetector(
                    onTap: () {
                      colorTask = (Colors.pink[300])!.value;
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.pink[300],
                      radius: 17,
                    ),
                  ),
                  addHorizontalSpace(10),
                  GestureDetector(
                    onTap: () {
                      colorTask = (Colors.orange[300])!.value;
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.orange[300],
                      radius: 17,
                    ),
                  ),
                  addHorizontalSpace(10),
                  GestureDetector(
                    onTap: () {
                      colorTask = (Colors.red[300])!.value;
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.red[300],
                      radius: 17,
                    ),
                  ),
                  addHorizontalSpace(10),
                  GestureDetector(
                    onTap: () {
                      colorTask = (Colors.purple[300])!.value;
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.purple[300],
                      radius: 17,
                    ),
                  ),
                ],
              ),
              addVerticalSpace(20),
              Text(
                'Choose a task date limit ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              addVerticalSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('d MMM y').format(date),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  addVerticalSpace(8),
                  MyButton(
                    text: 'select date',
                    onPressed: () async {
                      dateLimit = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (dateLimit == null) return;
                      setState(() => date = dateLimit!);
                    },
                  ),
                  addVerticalSpace(8),
                  Text(
                    'Choose your task tag',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  addVerticalSpace(8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        ChipWidget(name: 'Study'),
                        ChipWidget(name: 'Work'),
                        ChipWidget(name: 'Personal'),
                        ChipWidget(name: 'Goals'),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        ChipWidget(name: 'Shoppings'),
                        ChipWidget(name: 'Remember Later'),
                        ChipWidget(name: 'Home Tasks'),
                        ChipWidget(name: 'quotes'),
                      ],
                    ),
                  )
                ],
              ),
              addVerticalSpace(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: MyButton(text: 'save', onPressed: _submitForm)),
                  addHorizontalSpace(10),
                  Expanded(
                    child: MyButton(
                      text: 'cancel',
                      onPressed: (() => Navigator.of(context).pop()),
                    ),
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
