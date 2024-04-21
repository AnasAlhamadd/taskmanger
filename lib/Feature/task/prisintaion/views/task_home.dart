import 'package:flutter/material.dart';
import 'package:untitledtaskmanger/Feature/task/prisintaion/views/widgets/task_app_viewbody.dart';
import 'package:untitledtaskmanger/core/helper/constant.dart';

class TaskAppView extends StatelessWidget {
  const TaskAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: kButtonColor,
          splashColor: Colors.grey[400],
          onPressed: () {
            Navigator.of(context).pushNamed('/addtask');
          },
          child: const Icon(Icons.add),
        ),
        body: const TaskAppBodyViewbody());
  }
}
