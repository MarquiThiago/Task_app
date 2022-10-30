import 'package:task_app/global/utilities/color_enum.dart';

class Note {
  final String id;
  final String title;
  final String description;
  final DateTime? dateLimit;
  final ColorEnum colorEnum;
  final String tag;

  Note({
    this.dateLimit,
    required this.tag,
    required this.colorEnum,
    required this.id,
    required this.title,
    required this.description,
  });
}
