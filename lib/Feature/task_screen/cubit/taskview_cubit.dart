import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitledtaskmanger/Feature/task_screen/data/model/task_model.dart';

part 'taskview_state.dart';

class TaskviewCubit extends Cubit<TaskviewState> {
  TaskviewCubit() : super(TaskviewInitial());
  List<TaskModel> listTasks = [];
}
