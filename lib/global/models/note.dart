class Note {
  final String id;
  final String title;
  final String description;
  final DateTime? dateLimit;
  final int? colorTask;

  Note({
    this.colorTask,
    this.dateLimit,
    required this.id,
    required this.title,
    required this.description,
  });
}
