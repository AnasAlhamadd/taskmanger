import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class CustomTextFormInAddTask extends StatelessWidget {
  const CustomTextFormInAddTask({
    super.key,
    required this.title,
    this.readOnly = false,
    this.hintText,
    this.suffixIco,
    this.onTap,
    this.controller,
    this.validator,
  });
  final String title;
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIco;
  final void Function()? onTap;
  final bool readOnly;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles().textstyle22.copyWith(color: Colors.white),
          ),
          Padding(
              padding: EdgeInsets.only(top: 24.0.h),
              child: SizedBox(
                height: 60.h,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  readOnly: readOnly,
                  controller: controller,
                  onTap: onTap,
                  validator: validator,
                  decoration: InputDecoration(
                      suffixIcon: suffixIco,
                      hintText: hintText,
                      fillColor: Colors.grey.withOpacity(.1),
                      filled: true,
                      border: outlineInputBorder(),
                      focusedBorder: outlineInputBorder(),
                      errorBorder: outlineInputBorder(Colors.red)),
                ),
              )),
        ],
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder([Color? color]) => OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.grey.withOpacity(.1)),
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
    );
