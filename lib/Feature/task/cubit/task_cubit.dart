import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitledtaskmanger/Feature/task/data/models/task_model.dart';
import 'package:untitledtaskmanger/Feature/task/data/sqflite_helper/sqflite_helper.dart';
import 'package:untitledtaskmanger/core/services/services_layer.dart';

part 'task_state.dart';

class TaskviewCubit extends Cubit<TaskviewState> {
  TaskviewCubit() : super(GetDateInitial());

  //!varibale
  int curentIndex = 0;
  bool val = false;
  DateTime dateTime = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String startTimeDate = DateFormat('hh:mm a').format(DateTime.now());
  String endTimeDate = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController notes = TextEditingController();
  List<TaskModel> listTasks = [];

  //!get Date

  void getDate(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null && pickedDate != dateTime) {
      dateTime = pickedDate;
      emit(GetDateSuccess());
    }
  }
  //!get Date StartDate and EndDate

  void startDate(context) async {
    TimeOfDay? pickedstartTimeDate = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    if (pickedstartTimeDate != null) {
      startTimeDate = pickedstartTimeDate.format(context);
      emit(GetDateSuccess());
    }
  }

  void endDate(context) async {
    TimeOfDay? pickedendTimeDate = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
          DateTime.now().add(const Duration(minutes: 45))),
    );
    if (pickedendTimeDate != null) {
      endTimeDate = pickedendTimeDate.format(context);
      emit(GetDateSuccess());
    }
  }

  //!Check On Elipse
  void setCheckOnElipse(int index) {
    curentIndex = index;
    emit(GetDateSuccess());
  }

//!selectedDate
  void selectedDateTask(date) {
    emit(SelectedDateTaskLoading());
    selectedDate = date;
    selectData();
    emit(SelectedDateTaskSuccess());
  }

//! listColors
  List<Color> listColorsOfElipsic = const [
    Color(0xffFF4666),
    Color(0xff66CC41),
    Color(0xffb41CCA7),
    Color(0xff4181CC),
    Color(0xffCC8441),
    Color(0xff9741CC),
  ];

//!insert Data
  Future<int?> insertData({required TaskModel model}) async {
    emit(AddDateLoading());
    Future.delayed(const Duration(seconds: 2));
    try {
      await getIt<SqlDb>().mysql(
          table: 'insert',
          sql:
              'INSERT INTO tasks (title , date , notes , startTime ,endTime , color , isCompleted) VALUES ("${model.title}" ,"${model.date}" , "${model.notes}"  ,"${model.startTime}" , "${model.endTime}" , ${model.color.toInt()} , ${model.isCompleted.toInt()})');
      emit(AddDateSuccess());
      selectData();
      title.clear();
      notes.clear();
    } catch (e) {
      emit(AddDateFaliure(errMesage: 'There is A problem with Add Task'));
    }
    return null;
  }

//!select Data
  void selectData() async {
    emit(SelectDateLoading());
    try {
      List<Map<String, dynamic>> responce = await getIt<SqlDb>()
          .mysql(table: 'select', sql: 'SELECT * FROM tasks');
      listTasks = responce
          .map((e) => TaskModel.fromJson(e))
          .toList()
          .where((element) =>
              element.date == DateFormat.yMd().format(selectedDate))
          .toList();
      emit(SelectDateSuccess());
    } catch (e) {
      emit(SelectDateFaliure());
    }
  }

//!updated Data
  void updateData(id) async {
    await getIt<SqlDb>().mysql(
        table: 'update',
        sql: 'UPDATE tasks SET isCompleted = 1 WHERE id = $id');
    selectData();
  }

//!delete Data
  void deleteData(id) {
    getIt<SqlDb>()
        .mysql(table: 'delete', sql: 'DELETE FROM tasks WHERE id = $id');
    selectData();
  }
}
