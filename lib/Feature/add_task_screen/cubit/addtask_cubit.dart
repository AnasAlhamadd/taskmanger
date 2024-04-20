import 'dart:math';
<<<<<<< HEAD
=======

>>>>>>> c2fcb2b57e13b9c3ab0ecbd914375498e3291d82
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'addtask_state.dart';

class AddtaskCubit extends Cubit<AddTaskState> {
  AddtaskCubit() : super(GetDateInitial());

  //varibale
  int curentIndex = 0;
<<<<<<< HEAD
=======
  bool val = false;
>>>>>>> c2fcb2b57e13b9c3ab0ecbd914375498e3291d82
  DateTime dateTime = DateTime.now();
  String startTimeDate = DateFormat('hh:mm a').format(DateTime.now());
  String endTimeDate = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
<<<<<<< HEAD
//
  //get Date
=======

>>>>>>> c2fcb2b57e13b9c3ab0ecbd914375498e3291d82
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
<<<<<<< HEAD
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
  void setCheckOnElipse(int index) async {
    curentIndex = index;
    emit(GetDateSuccess());
  }
=======
>>>>>>> c2fcb2b57e13b9c3ab0ecbd914375498e3291d82
}
