import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:untitledtaskmanger/Feature/task/data/models/task_model.dart';

part 'task_state.dart';

class TaskviewCubit extends Cubit<TaskviewState> {
  TaskviewCubit() : super(GetDateInitial());

  //varibale
  int curentIndex = 0;
  bool val = false;

  DateTime dateTime = DateTime.now();
  String startTimeDate = DateFormat('hh:mm a').format(DateTime.now());
  String endTimeDate = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController notes = TextEditingController();
//
  //get Date

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
  //get Date StartDate and EndDate

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

  //Check On Elipse
  setCheckOnElipse(int index) {
    curentIndex = index;
    emit(GetDateSuccess());
  }

  List<Color> listColorsOfElipsic = const [
    Color(0xffFF4666),
    Color(0xff66CC41),
    Color(0xffb41CCA7),
    Color(0xff4181CC),
    Color(0xffCC8441),
    Color(0xff9741CC),
  ];
  List<TaskModel> listTasks = <TaskModel>[];

  void insertDate() async {
    emit(AddDateLoading());
    try {
      //to make scren wait 2 secounds
      await Future.delayed(Duration(seconds: 2));
      listTasks.add(
        TaskModel(
          id: '1',
          title: title.text,
          startTime: startTimeDate,
          endTime: endTimeDate,
          notes: notes.text,
          date: DateFormat.yMEd().format(dateTime),
          color: curentIndex,
          isCompleted: false,
        ),
      );

      emit(AddDateSuccess());
      title.clear();
      notes.clear();
      dateTime = DateTime.now();
      startTimeDate = DateFormat('hh:mm a').format(DateTime.now());
      endTimeDate = DateFormat('hh:mm a')
          .format(DateTime.now().add(const Duration(minutes: 45)));
      curentIndex = 0;
    } catch (e) {
      emit(AddDateFaliure(
          errMesage: 'There is A Problem with the ${e.toString()}'));
    }
  }
}
