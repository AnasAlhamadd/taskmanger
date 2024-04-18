import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitledtaskmanger/Feauthres/add_task_screen/prisintaion/views/widgets/custom_appbar.dart';
import 'package:untitledtaskmanger/Feauthres/add_task_screen/prisintaion/views/widgets/custom_textfailed.dart';
import 'package:untitledtaskmanger/core/helper/color.dart';
import 'package:untitledtaskmanger/core/helper/constant.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  int curentIndex = 0;
  bool val = false;
  DateTime dateTime = DateTime.now();
  String startTimeDate = DateFormat('hh:mm a').format(DateTime.now());
  String endTimeDate = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formstate,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              const CustomAppBarInAddTask(),
              const SizedBox(
                height: 48.0,
              ),
              // !Title
              CustomTextFormInAddTask(
                  controller: TextEditingController(),
                  onChanged: (input) {},
                  title: 'Title',
                  hintText: 'Enter title here'),
              // !Note

              CustomTextFormInAddTask(
                  controller: TextEditingController(),
                  onChanged: (input) {},
                  title: 'Note',
                  hintText: 'Enter note here'),
              //!DATE
              CustomTextFormInAddTask(
                readOnly: true,
                controller: TextEditingController(),
                onChanged: (input) {},
                onTap: () {},
                title: 'Date',
                hintText: DateFormat.yMEd().format(dateTime),
                suffixIco: GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                      );
                      if (pickedDate != null && pickedDate != dateTime) {
                        setState(() {
                          dateTime = pickedDate;
                        });
                      }
                    },
                    child: const Icon(Icons.calendar_month_rounded)),
              ),

              //add date range Start => end ...
              Row(
                children: [
                  //!start time

                  Expanded(
                    child: CustomTextFormInAddTask(
                      readOnly: true,
                      hintText: startTimeDate,
                      onTap: () async {
                        TimeOfDay? pickedstartTimeDate = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(DateTime.now()));
                        if (pickedstartTimeDate != null) {
                          setState(() {
                            startTimeDate = pickedstartTimeDate.format(context);
                          });
                        }
                      },
                      title: 'Satrt Time',
                      suffixIco: const Icon(Icons.timer_sharp),
                    ),
                  ),
                  const SizedBox(
                    width: 27,
                  ),
                  //!end time
                  Expanded(
                      child: CustomTextFormInAddTask(
                    hintText: endTimeDate,
                    onTap: () async {
                      TimeOfDay? pickedendTimeDate = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            DateTime.now().add(const Duration(minutes: 45))),
                      );
                      if (pickedendTimeDate != null) {
                        setState(() {
                          endTimeDate = pickedendTimeDate.format(context);
                        });
                      }
                    },
                    readOnly: true,
                    title: 'End Time',
                    suffixIco: const Icon(Icons.timer_sharp),
                  )),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  'Color',
                  style: Styles().textstyle22.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  ...List.generate(
                    listColorsOfElipsic.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            curentIndex = index;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: listColorsOfElipsic[index],
                          child: curentIndex == index
                              ? const Icon(Icons.check)
                              : null,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              MaterialButton(
                  height: 50,
                  color: kButtonColor,
                  splashColor: Colors.deepPurpleAccent,
                  onPressed: () {
                    if (formstate.currentState!.validate()) {}
                  },
                  child: Text(
                    'Create task',
                    style: Styles().textstyle22.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 50,
              ),
            ],
          )),
    );
  }
}
