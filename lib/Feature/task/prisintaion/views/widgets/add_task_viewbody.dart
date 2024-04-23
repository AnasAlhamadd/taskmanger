import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:untitledtaskmanger/Feature/task/data/models/task_model.dart';
import 'package:untitledtaskmanger/Feature/task/prisintaion/views/widgets/custom_appbar.dart';
import 'package:untitledtaskmanger/Feature/task/prisintaion/views/widgets/custom_textfailed.dart';
import 'package:untitledtaskmanger/Feature/task/cubit/task_cubit.dart';
import 'package:untitledtaskmanger/core/helper/constant.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';
import 'package:untitledtaskmanger/core/widgets/show_fluttertoast.dart';
import 'package:untitledtaskmanger/core/widgets/show_snak_bar.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TaskviewCubit>(context);
    return BlocConsumer<TaskviewCubit, TaskviewState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AddDateSuccess) {
          showToast(
              msg: 'The Task has been added successfully',
              toastState: ToastState.success);
          Navigator.pop(context);
        } else if (state is AddDateFaliure) {
          showsnackbar(context: context, title: state.errMesage);
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formstate,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView(
                children: [
                  const CustomAppBarInAddTask(),
                  // !Title
                  CustomTextFormInAddTask(
                      validator: (input) {
                        if (input!.isEmpty) return 'The field is empty';
                      },
                      controller: cubit.title,
                      title: 'Title',
                      hintText: 'Enter title here'),
                  // !Note

                  CustomTextFormInAddTask(
                      validator: (input) {
                        if (input!.isEmpty) return 'The field is empty';
                      },
                      controller: cubit.notes,
                      title: 'Note',
                      hintText: 'Enter note here'),
                  //!DATE
                  CustomTextFormInAddTask(
                    readOnly: true,
                    title: 'Date',
                    hintText: DateFormat.yMEd().format(cubit.dateTime),
                    suffixIco: GestureDetector(
                      onTap: () async {
                        cubit.getDate(context);
                      },
                      child: const Icon(Icons.calendar_month_rounded),
                    ),
                  ),

                  //add date range Start => end ...
                  Row(
                    children: [
                      //!start time
                      Expanded(
                        child: CustomTextFormInAddTask(
                          readOnly: true,
                          hintText: cubit.startTimeDate,
                          onTap: () async {
                            cubit.startDate(context);
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
                        hintText: cubit.endTimeDate,
                        onTap: () async {
                          cubit.endDate(context);
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
                        cubit.listColorsOfElipsic.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(left: 12.w),
                          child: GestureDetector(
                            onTap: () {
                              cubit.setCheckOnElipse(index);
                            },
                            child: CircleAvatar(
                              backgroundColor: cubit.listColorsOfElipsic[index],
                              child: cubit.curentIndex == index
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
                  BlocBuilder<TaskviewCubit, TaskviewState>(
                    builder: (context, state) {
                      if (state is AddDateLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return MaterialButton(
                          height: 50,
                          color: kButtonColor,
                          splashColor: Colors.deepPurpleAccent,
                          onPressed: () async {
                            if (cubit.formstate.currentState!.validate()) {
                              cubit.insertData(
                                  model: TaskModel(
                                      title: '${cubit.title.text}',
                                      startTime: '${cubit.startTimeDate}',
                                      endTime: '${cubit.endTimeDate}',
                                      notes: '${cubit.notes.text}',
                                      date:
                                          '${DateFormat.yMd().format(cubit.dateTime)}',
                                      color: cubit.curentIndex.toInt(),
                                      isCompleted: 0));
                            }
                          },
                          child: Text(
                            'Create task',
                            style: Styles().textstyle22.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ));
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              )),
        );
      },
    );
  }
}
