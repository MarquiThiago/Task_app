import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/global/utilities/field.dart';
import 'package:task_app/global/provider/note_provider.dart';
import '../../global/models/note.dart';
import '../../global/utilities/color_enum.dart';
import '../../global/utilities/space.dart';
import '../../global/utilities/my_button.dart';

class NoteEdit extends StatefulWidget {
  const NoteEdit({Key? key}) : super(key: key);

  @override
  State<NoteEdit> createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};
  ColorEnum? colorEnum;
  bool isSelected = false;
  late int _choiceIndex;

  @override
  void initState() {
    super.initState();
    _choiceIndex = 0;
  }

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
        colorEnum = note.colorEnum;
      }
    }
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    bool hasId = _formData['id'] != null;

    final note = Note(
      id: hasId ? _formData['id'] as String : Random().nextDouble().toString(),
      title: _formData['title'] as String,
      description: _formData['description'] as String,
      tag:
          Provider.of<NoteProvider>(context, listen: false).chips[_choiceIndex],
      colorEnum: colorEnum ?? ColorEnum.defaut,
    );
    Provider.of<NoteProvider>(
      context,
      listen: false,
    ).saveNote(note);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final noteController = Provider.of<NoteProvider>(
      context,
    );
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
              addVerticalSpace(30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose your task tag',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: noteController.chips.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ChoiceChip(
                          selectedColor: Colors.purple[300],
                          label: Text(noteController.chips[index]),
                          selected: _choiceIndex == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _choiceIndex = selected ? index : 0;
                            });
                          },
                        ),
                      ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
