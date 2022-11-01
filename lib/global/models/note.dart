import 'package:task_app/global/utilities/color_enum.dart';

class Note {
  final String id;
  final String title;
  final String description;
  final DateTime? date;
  final ColorEnum colorEnum;
  final String tag;

  Note({
    this.date,
    required this.tag,
    required this.colorEnum,
    required this.id,
    required this.title,
    required this.description,
  });
}
