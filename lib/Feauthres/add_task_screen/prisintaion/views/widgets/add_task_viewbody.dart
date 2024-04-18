import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitledtaskmanger/Feauthres/add_task_screen/prisintaion/views/widgets/custom_appbar.dart';
import 'package:untitledtaskmanger/Feauthres/add_task_screen/prisintaion/views/widgets/custom_textfailed.dart';
import 'package:untitledtaskmanger/Feauthres/add_task_screen/prisintaion/views/widgets/showrang_date.dart';
import 'package:untitledtaskmanger/core/helper/color.dart';
import 'package:untitledtaskmanger/core/helper/constant.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';
import 'package:untitledtaskmanger/services/services_layer.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const CustomAppBarInAddTask(),
            const SizedBox(
              height: 48.0,
            ),
            CustomTextFormInAddTask(
                controller: TextEditingController(),
                onChanged: (input) {
                  print(input);
                },
                title: 'Title',
                hintText: 'Enter title here'),
            CustomTextFormInAddTask(
                controller: TextEditingController(),
                onChanged: (input) {},
                title: 'Note',
                hintText: 'Enter note here'),
            CustomTextFormInAddTask(
              controller: TextEditingController(),
              onChanged: (input) {},
              onTap: () {},
              title: 'Date',
              hintText: 'Enter date here',
              suffixIco: const Icon(Icons.date_range_rounded),
            ),
            //add date range Start => end ...
            showRangeDate(),
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
                          child: CircleAvatar(
                            backgroundColor: listColorsOfElipsic[index],
                          ),
                        ))
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            MaterialButton(
                height: 50,
                color: kButtonColor,
                splashColor: Colors.deepPurpleAccent,
                onPressed: () {},
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
  }
}
