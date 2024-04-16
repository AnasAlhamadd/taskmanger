import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class TaskAppBodyView extends StatelessWidget {
  const TaskAppBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'October 2,2023',
              style: Styles().textstyle28,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Today',
                style: Styles().textstyle28,
              ),
            )
          ],
        ),
      ),
    );
  }
}
