import 'package:flutter/material.dart';
import 'package:task_app/global/utilities/consts.dart';

// ignore: must_be_immutable
class Field extends StatelessWidget {
  String text;
  final Icon? icon;
  final initialValue;
  void Function(String?)? onSaved;
  final String? hint;
  final int? lines;

  Field({
    Key? key,
    required this.text,
    this.icon,
    this.onSaved,
    this.initialValue,
    this.hint,
    this.lines,
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
            prefixIcon: icon,
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
