import 'package:flutter/material.dart';
import 'package:task_app/global/utilities/consts.dart';

// ignore: must_be_immutable
class Field extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final text;
  // ignore: prefer_typing_uninitialized_variables
  final initialValue;
  void Function(String?)? onSaved;
  final String hint;
  final int lines;

  Field({
    Key? key,
    required this.text,
    required this.onSaved,
    required this.initialValue,
    required this.hint,
    required this.lines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        addVerticalSpace(8),
        TextFormField(
          onSaved: onSaved,
          initialValue: initialValue,
          maxLines: lines,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
