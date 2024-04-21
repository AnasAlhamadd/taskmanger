import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitledtaskmanger/Feature/task/prisintaion/views/widgets/custom_textfailed.dart';

Row showRangeDate() {
  return Row(
    children: [
      Expanded(
        child: CustomTextFormInAddTask(
          controller: TextEditingController(),
          onTap: () {},
          title: 'Satrt Time',
          suffixIco: const Icon(Icons.timer_sharp),
        ),
      ),
      SizedBox(
        width: 27.w,
      ),
      Expanded(
          child: CustomTextFormInAddTask(
        controller: TextEditingController(),
        onTap: () {},
        title: 'End Time',
        suffixIco: const Icon(Icons.timer_sharp),
      )),
    ],
  );
}
