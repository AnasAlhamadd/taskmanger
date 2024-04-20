import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class TaskComponets extends StatelessWidget {
  const TaskComponets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: Colors.red,
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
                  'Task 1',
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
                      '09:33 PM - 09:48 PM',
                      style: Styles().textStyle18,
                    ),
                  ],
                ),
                //Text title
                Text(
                  'Learn Dart',
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
              child: Text(
                'TODO',
                style: Styles().textStyle18.copyWith(fontFamily: 'sans'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
