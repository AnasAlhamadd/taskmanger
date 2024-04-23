class TaskModel {
  final int? id;

  final String title;
  final String startTime;
  final String endTime;
  final String notes;
  final String date;
  final int color;
  final int isCompleted;

  TaskModel(
      {this.id,
      required this.title,
      required this.startTime,
      required this.endTime,
      required this.notes,
      required this.date,
      required this.color,
      required this.isCompleted});
  factory TaskModel.fromJson(Map<String, dynamic> JsonData) {
    return TaskModel(
      id: JsonData['id'],
      title: JsonData['title'],
      startTime: JsonData['startTime'],
      endTime: JsonData['endTime'],
      notes: JsonData['notes'],
      date: JsonData['date'],
      color: JsonData['color'],
      isCompleted: JsonData['isCompleted'],
    );
  }
}
