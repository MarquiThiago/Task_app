import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/utilities/chip.dart';
import 'package:task_app/global/utilities/field.dart';
import '../../global/models/todo.dart';
import '../../global/theme/color_enum.dart';
import '../../global/utilities/chips_name.dart';
import '../../global/utilities/consts.dart';
import '../../global/utilities/my_button.dart';
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
  ColorEnum? colorEnum;
  List? chips;

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
        colorEnum = todo.colorEnum;
        dateLimit = todo.dateLimit;
        date = todo.dateLimit ?? DateTime.now();
        chips = todo.chips;
      }
    }
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    _formData['dateLimit'] = dateLimit ?? DateTime.now();

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    bool hasId = _formData['id'] != null;

    final todo = Todo(
        id: hasId
            ? _formData['id'] as String
            : Random().nextDouble().toString(),
        title: _formData['title'] as String,
        description: _formData['description'] as String,
        dateLimit: (_formData['dateLimit'] == null)
            ? null
            : _formData['dateLimit'] as DateTime,
        colorEnum: colorEnum ?? ColorEnum.defaut);
    Provider.of<TodoList>(
      context,
      listen: false,
    ).saveTodo(todo);

    Navigator.of(context).pop();
  }

  void _showDatePeacker() async {
    dateLimit = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (dateLimit == null) return;
    setState(() => date = dateLimit!);
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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Titulo iinvalido';
                  }
                  if (value.trim().length < 3) {
                    return 'Titulo muito pequeno. no minimo 3 letras.';
                  }
                  return null;
                },
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
                  ...ColorEnum.avaliableColors.map(
                    (e) => GestureDetector(
                      onTap: () {
                        colorEnum = e;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CircleAvatar(
                          backgroundColor: e.color,
                          radius: 17,
                        ),
                      ),
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
                    onPressed: _showDatePeacker,
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
                      children: [
                        ...ChipsName.chipsName
                            .map((e) => ChipWidget(name: e.name))
                      ],
                    ),
                  ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
