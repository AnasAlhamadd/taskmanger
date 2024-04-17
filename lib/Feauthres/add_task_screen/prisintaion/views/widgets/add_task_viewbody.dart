import 'package:flutter/material.dart';
import 'package:untitledtaskmanger/Feauthres/add_task_screen/prisintaion/views/widgets/custom_appbar.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          CustomAppBarInAddTask(),
        ],
      ),
    );
  }
}
