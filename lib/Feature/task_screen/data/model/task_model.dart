class TaskModel {
  final String id;

  final String title;
  final String startTime;
  final String endTime;
  final String notes;
  final int color;
  final bool isCompleted;

  TaskModel(
      {required this.id,
      required this.title,
      required this.startTime,
      required this.endTime,
      required this.notes,
      required this.color,
      required this.isCompleted});

  static List<TaskModel> listTasks = [
    TaskModel(
      id: '1',
      title: 'Task 1',
      startTime: '09:33 PM',
      endTime: '09:48 PM',
      notes: 'Learn Dart',
      color: 0,
      isCompleted: true,
    ),
    TaskModel(
      id: '2',
      title: 'Task 1',
      startTime: '09:33 PM',
      endTime: '09:48 PM',
      notes: 'Learn Dart',
      color: 0,
      isCompleted: true,
    ),
    // TaskModel(
    //   title: 'Task 2',
    //   startTime: '10:33 PM',
    //   endTime: '10:48 PM',
    //   notes: 'Learn Js',
    //   color: 1,
    //   isCompleted: false,
    // ),
  ];
}
