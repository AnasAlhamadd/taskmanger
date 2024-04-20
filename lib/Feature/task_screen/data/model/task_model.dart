class TaskModel {
  final String id;

  final String title;
  final String startTime;
  final String endTime;
  final String notes;
  final String date;
  final int color;
  final bool isCompleted;

  TaskModel(
      {required this.id,
      required this.title,
      required this.startTime,
      required this.endTime,
      required this.notes,
      required this.date,
      required this.color,
      required this.isCompleted});
}
