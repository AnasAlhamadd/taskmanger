import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'addtask_state.dart';

class AddtaskCubit extends Cubit<AddTaskState> {
  AddtaskCubit() : super(GetDateInitial());

  //varibale
  int curentIndex = 0;
  bool val = false;

  DateTime dateTime = DateTime.now();
  String startTimeDate = DateFormat('hh:mm a').format(DateTime.now());
  String endTimeDate = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
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
}
