import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class CustomAppBarInAddTask extends StatelessWidget {
  const CustomAppBarInAddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/taskhome');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24.sp,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: Text(
            'Add Task',
            style: Styles().textstyle32.copyWith(fontFamily: 'Trajan'),
          ),
        )
      ],
    );
  }
}
