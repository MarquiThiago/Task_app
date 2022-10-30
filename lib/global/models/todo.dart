import '../utilities/color_enum.dart';

class Todo {
  final String id;
  final String title;
  final String description;
  final DateTime? dateLimit;
  final ColorEnum colorEnum;
  final String tag;

  bool isDone;

  Todo({
    this.dateLimit,
    required this.tag,
    required this.colorEnum,
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
