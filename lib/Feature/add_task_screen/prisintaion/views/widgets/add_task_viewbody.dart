import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:untitledtaskmanger/Feature/add_task_screen/cubit/addtask_cubit.dart';
import 'package:untitledtaskmanger/Feature/add_task_screen/prisintaion/views/widgets/custom_appbar.dart';
import 'package:untitledtaskmanger/Feature/add_task_screen/prisintaion/views/widgets/custom_textfailed.dart';
import 'package:untitledtaskmanger/core/helper/color.dart';
import 'package:untitledtaskmanger/core/helper/constant.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = GlobalKey<FormState>();
    return Form(
      key: formstate,
      child: BlocBuilder<AddtaskCubit, AddTaskState>(
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView(
                children: [
                  const CustomAppBarInAddTask(),
                  // !Title
                  CustomTextFormInAddTask(
                      validator: (input) {
                        if (input!.isEmpty) return 'The field is empty';
                      },
                      controller: TextEditingController(),
                      onChanged: (input) {},
                      title: 'Title',
                      hintText: 'Enter title here'),
                  // !Note

                  CustomTextFormInAddTask(
                      validator: (input) {
                        if (input!.isEmpty) return 'The field is empty';
                      },
                      controller: TextEditingController(),
                      onChanged: (input) {},
                      title: 'Note',
                      hintText: 'Enter note here'),
                  //!DATE
                  CustomTextFormInAddTask(
                    readOnly: true,
                    controller: TextEditingController(),
                    title: 'Date',
                    hintText: DateFormat.yMEd().format(
                        BlocProvider.of<AddtaskCubit>(context).dateTime),
                    suffixIco: GestureDetector(
                      onTap: () async {
                        BlocProvider.of<AddtaskCubit>(context).getDate(context);
                      },
                      child: const Icon(Icons.calendar_month_rounded),
                    ),
                  ),

                  //add date range Start => end ...
                  Row(
                    children: [
                      //!start time
<<<<<<< HEAD
=======

>>>>>>> c2fcb2b57e13b9c3ab0ecbd914375498e3291d82
                      Expanded(
                        child: CustomTextFormInAddTask(
                          readOnly: true,
                          hintText: BlocProvider.of<AddtaskCubit>(context)
                              .startTimeDate,
                          onTap: () async {
<<<<<<< HEAD
                            BlocProvider.of<AddtaskCubit>(context)
                                .startDate(context);
=======
                            TimeOfDay? pickedstartTimeDate =
                                await showTimePicker(
                                    context: context,
                                    initialTime:
                                        TimeOfDay.fromDateTime(DateTime.now()));
                            if (pickedstartTimeDate != null) {
                              // setState(() {
                              //   startTimeDate = pickedstartTimeDate.format(context);
                              // });
                            }
>>>>>>> c2fcb2b57e13b9c3ab0ecbd914375498e3291d82
                          },
                          title: 'Satrt Time',
                          suffixIco: const Icon(Icons.timer_sharp),
                        ),
                      ),
                      SizedBox(
                        width: 27.w,
                      ),
                      //!end time
                      Expanded(
                          child: CustomTextFormInAddTask(
                        hintText:
                            BlocProvider.of<AddtaskCubit>(context).endTimeDate,
                        onTap: () async {
<<<<<<< HEAD
                          BlocProvider.of<AddtaskCubit>(context)
                              .endDate(context);
=======
                          TimeOfDay? pickedendTimeDate = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(DateTime.now()
                                .add(const Duration(minutes: 45))),
                          );
                          if (pickedendTimeDate != null) {
                            // setState(() {
                            //   endTimeDate = pickedendTimeDate.format(context);
                            // });
                          }
>>>>>>> c2fcb2b57e13b9c3ab0ecbd914375498e3291d82
                        },
                        readOnly: true,
                        title: 'End Time',
                        suffixIco: const Icon(Icons.timer_sharp),
                      )),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 24.0.h),
                    child: Text(
                      'Color',
                      style: Styles().textstyle22.copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        listColorsOfElipsic.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(left: 12.w),
                          child: GestureDetector(
                            onTap: () {
<<<<<<< HEAD
                              BlocProvider.of<AddtaskCubit>(context)
                                  .setCheckOnElipse(index);
=======
                              // setState(() {
                              //   curentIndex = index;
                              // });
>>>>>>> c2fcb2b57e13b9c3ab0ecbd914375498e3291d82
                            },
                            child: CircleAvatar(
                              backgroundColor: listColorsOfElipsic[index],
                              child: BlocProvider.of<AddtaskCubit>(context)
                                          .curentIndex ==
                                      index
                                  ? const Icon(Icons.check)
                                  : null,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
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
              ));
        },
      ),
    );
  }
}
