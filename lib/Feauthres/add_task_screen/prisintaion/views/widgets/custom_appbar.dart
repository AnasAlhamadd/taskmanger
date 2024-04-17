import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class CustomAppBarInAddTask extends StatelessWidget {
  const CustomAppBarInAddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).go('/taskhome');
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Add Task',
            style: Styles().textstyle32.copyWith(fontFamily: 'Trajan'),
          ),
        )
      ],
    );
  }
}
