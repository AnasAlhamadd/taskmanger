import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitledtaskmanger/core/helper/constant.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({
    super.key,
    required this.onPressed,
    required this.textButton,
  });
  final void Function()? onPressed;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Align(
        alignment: Alignment.bottomRight,
        child: MaterialButton(
          color: kButtonColor,
          minWidth: 90,
          splashColor: Colors.deepPurpleAccent,
          height: 45.h,
          onPressed: onPressed,
          child: Text(textButton),
        ),
      ),
    );
  }
}
