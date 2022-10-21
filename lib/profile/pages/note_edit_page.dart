import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:task_app/global/utilities/field.dart';
import 'package:task_app/global/provider/note_list.dart';
import '../../global/models/note.dart';
import '../../global/utilities/chip.dart';
import '../../global/utilities/consts.dart';
import '../../global/utilities/my_button.dart';

class NoteEdit extends StatefulWidget {
  const NoteEdit({Key? key}) : super(key: key);

  @override
  State<NoteEdit> createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
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
        final note = arg as Note;
        _formData['id'] = note.id;
        _formData['title'] = note.title;
        _formData['description'] = note.description;
        colorTask = note.colorTask;
        dateLimit = note.dateLimit;
        date = note.dateLimit ?? DateTime.now();
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

    Provider.of<NoteList>(
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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Invalid title';
                  }
                  if (value.trim().length < 3) {
                    return 'Title is to short. It should have more then 3 leters';
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
              addVerticalSpace(10),
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
              addVerticalSpace(30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
