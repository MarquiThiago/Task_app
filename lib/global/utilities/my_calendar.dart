import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_app/global/utilities/consts.dart';
import 'package:task_app/global/utilities/my_button.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime date = DateTime(2022, 12, 24);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateFormat('d MMM y').format(date),
          style: Theme.of(context).textTheme.bodyText2,
        ),
        addVerticalSpace(8),
        MyButton(
          text: 'select date',
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (newDate == null) return;
            setState(() => date = newDate);
          },
        ),
      ],
    );
  }
}
