import 'package:task_app/global/theme/color_enum.dart';

class Note {
  final String id;
  final String title;
  final String description;
  final DateTime? dateLimit;
  final ColorEnum colorEnum;
  final int? colorTask;

  Note({
    this.colorTask,
    this.dateLimit,
    required this.colorEnum,
    required this.id,
    required this.title,
    required this.description,
  });
}
