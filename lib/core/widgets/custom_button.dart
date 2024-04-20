import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitledtaskmanger/core/helper/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.textButton,
      required this.onPressed,
      this.color});
  final String textButton;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: MaterialButton(
        splashColor: Colors.grey[500],
        color: color ?? kButtonColor,
        height: 50.h,
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            textButton,
            style: TextStyle(
              fontSize: 28.sp,
            ),
          ),
        ),
      ),
    );
  }
}
