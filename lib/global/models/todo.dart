import '../theme/color_enum.dart';

class Todo {
  final String id;
  final String title;
  final String description;
  final DateTime? dateLimit;
  final ColorEnum colorEnum;
  final List? chips;

  bool isDone;

  Todo({
    this.dateLimit,
    this.chips,
    required this.colorEnum,
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
