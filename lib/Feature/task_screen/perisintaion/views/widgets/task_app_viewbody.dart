import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:untitledtaskmanger/Feature/task_screen/perisintaion/views/widgets/task_componets.dart';
import 'package:untitledtaskmanger/core/widgets/custom_button.dart';
import 'package:untitledtaskmanger/core/helper/constant.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';
import 'package:intl/intl.dart';

class TaskAppBodyViewbody extends StatelessWidget {
  const TaskAppBodyViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTask = false;
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
              const SizedBox(
                height: 20,
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
                    // New date selected
                    // setState(() {
                    //   _selectedValue = date;
                    // });
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isDismissible: true,
                      context: context,
                      builder: (context) => Container(
                        height: 250,
                        color: const Color(0xff424242),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomButton(
                                  textButton: 'Task Completed',
                                  onPressed: () {}),
                              CustomButton(
                                  color: kButtonColorSecound,
                                  textButton: 'Delete Task',
                                  onPressed: () {}),
                              CustomButton(
                                textButton: 'Cancel',
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: const TaskComponets()),
            ],
          ),
        ),
      ]),
    );
  }
}
