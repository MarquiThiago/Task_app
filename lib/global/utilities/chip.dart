import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChipWidget extends StatefulWidget {
  final String name;
  const ChipWidget({required this.name, super.key});

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: FilterChip(
        selected: _isSelected,
        label: Text(widget.name),
        checkmarkColor: const Color(0xff6200ee),
        labelStyle: const TextStyle(
          color: Color(0xff6200ee),
        ),
        backgroundColor: const Color(0xffededed),
        selectedColor: const Color(0xffeadffd),
        onSelected: (isSelected) {
          setState(() {
            _isSelected = isSelected;
          });
        },
      ),
    );
  }
}
