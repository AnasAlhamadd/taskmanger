import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitledtaskmanger/Feature/task/data/models/task_model.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class TaskComponets extends StatelessWidget {
  const TaskComponets({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    List<Color> listColorsOfElipsic = const [
      Color(0xffFF4666),
      Color(0xff66CC41),
      Color(0xffb41CCA7),
      Color(0xff4181CC),
      Color(0xffCC8441),
      Color(0xff9741CC),
    ];
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: listColorsOfElipsic[taskModel.color],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            //Custom title and time and Icon
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //text Task
                Text(
                  taskModel.title,
                  style: Styles().textstyle28,
                ),
                //Custom time and Icon
                Row(
                  children: [
                    const Icon(
                      Icons.alarm,
                      size: 30,
                    ),
                    SizedBox(
                      width: 8.0.w,
                    ),
                    Text(
                      '${taskModel.startTime}- ${taskModel.endTime}',
                      style: Styles().textStyle18,
                    ),
                  ],
                ),
                //Text title
                Text(
                  taskModel.notes,
                  style: Styles().textstyle28,
                )
              ],
            ),
            const Spacer(),
            //custom Driveer and Todo Text
            const VerticalDivider(
              color: Colors.white,
              indent: 30,
              endIndent: 30,
            ),
            RotatedBox(
                quarterTurns: 3,
                child: taskModel.isCompleted
                    ? Text(
                        'Completed',
                        style:
                            Styles().textStyle18.copyWith(fontFamily: 'sans'),
                      )
                    : Text(
                        'TODO',
                        style:
                            Styles().textStyle18.copyWith(fontFamily: 'sans'),
                      )),
          ],
        ),
      ),
    );
  }
}
