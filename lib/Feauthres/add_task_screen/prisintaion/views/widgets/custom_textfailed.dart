import 'package:flutter/material.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class CustomTextFormInAddTask extends StatelessWidget {
  const CustomTextFormInAddTask({
    super.key,
    required this.title,
    this.onChanged,
    this.readOnly = false,
    this.hintText,
    this.suffixIco,
    this.onTap,
    this.controller,
  });
  final String title;
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIco;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles().textstyle22.copyWith(color: Colors.white),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  readOnly: readOnly,
                  controller: controller,
                  onTap: onTap,
                  onChanged: onChanged,
                  validator: (input) {
                    if (input!.isEmpty) return 'This field is empty';
                  },
                  decoration: InputDecoration(
                      suffixIcon: suffixIco,
                      hintText: hintText,
                      fillColor: Colors.grey.withOpacity(.1),
                      filled: true,
                      border: outlineInputBorder(),
                      focusedBorder: outlineInputBorder(),
                      errorBorder: outlineInputBorder()),
                ),
              )),
        ],
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder() => const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    );
