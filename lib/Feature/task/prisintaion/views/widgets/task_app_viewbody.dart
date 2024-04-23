import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:untitledtaskmanger/Feature/task/prisintaion/views/widgets/task_componets.dart';
import 'package:untitledtaskmanger/Feature/task/cubit/task_cubit.dart';
import 'package:untitledtaskmanger/core/helper/constant.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';
import 'package:untitledtaskmanger/core/widgets/custom_button.dart';

class TaskAppBodyViewbody extends StatelessWidget {
  const TaskAppBodyViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<TaskviewCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              //date Time
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style: Styles().textstyle28,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  'Today',
                  style: Styles().textstyle28,
                ),
              )
            ],
          ),
        ),
        SliverFillRemaining(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: const EdgeInsets.only(top: 6.0),
                height: 120,
                child: DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  dayTextStyle: Styles().textStyle18,
                  dateTextStyle: Styles().textStyle18,
                  monthTextStyle: Styles().textStyle18,
                  selectionColor: kButtonColor,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    cubit.selectedDateTask(date);
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocBuilder<TaskviewCubit, TaskviewState>(
                builder: (context, state) {
                  if (state is SelectDateLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Expanded(
                    child: cubit.listTasks.isEmpty
                        ? SvgPicture.asset('assets/images/homescreen.svg')
                        : ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: cubit.listTasks.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isDismissible: true,
                                  context: context,
                                  builder: (context) => Container(
                                    height: 250,
                                    color: const Color(0xff424242),
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomButton(
                                              textButton: 'Task Completed',
                                              onPressed: () {
                                                cubit.updateData(
                                                    cubit.listTasks[index].id);
                                                Navigator.pop(context);
                                              }),
                                          CustomButton(
                                              color: kButtonColorSecound,
                                              textButton: 'Delete Task',
                                              onPressed: () {
                                                cubit.deleteData(
                                                    cubit.listTasks[index].id);
                                                Navigator.pop(context);
                                              }),
                                          CustomButton(
                                            textButton: 'Cancel',
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: TaskComponets(
                                taskModel: cubit.listTasks[index],
                              ),
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                          ),
                  );
                },
              )
            ],
          ),
        ),
      ]),
    );
  }
}
