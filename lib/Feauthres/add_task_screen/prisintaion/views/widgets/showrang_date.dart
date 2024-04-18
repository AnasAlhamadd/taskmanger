import 'package:flutter/material.dart';
import 'package:untitledtaskmanger/Feauthres/add_task_screen/prisintaion/views/widgets/custom_textfailed.dart';

Row showRangeDate() {
  return Row(
    children: [
      Expanded(
        child: CustomTextFormInAddTask(
          controller: TextEditingController(),
          onChanged: (input) {},
          onTap: () {},
          title: 'Satrt Time',
          suffixIco: const Icon(Icons.timer_sharp),
        ),
      ),
      const SizedBox(
        width: 27,
      ),
      Expanded(
          child: CustomTextFormInAddTask(
        controller: TextEditingController(),
        onTap: () {},
        onChanged: (input) {},
        title: 'End Time',
        suffixIco: const Icon(Icons.timer_sharp),
      )),
    ],
  );
}
