import 'package:flutter/material.dart';

class Todo with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final DateTime? dateLimit;
  final int? colorTask;
  bool isDone;

  Todo({
    this.colorTask,
    this.dateLimit,
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
