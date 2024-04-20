import 'package:flutter/material.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class CustomTitleAndBody extends StatelessWidget {
  const CustomTitleAndBody(
      {super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            title,
            style: Styles().textstyle28,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                body,
                style: Styles().textstyle16,
              ),
            ))
      ],
    );
  }
}
