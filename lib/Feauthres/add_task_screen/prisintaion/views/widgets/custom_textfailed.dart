import 'package:flutter/material.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class CustomTextFormInAddTask extends StatelessWidget {
  const CustomTextFormInAddTask(
      {super.key,
      required this.title,
      required this.onChanged,
      this.hintText,
      this.suffixIco,
      this.onTap});
  final String title;
  final String? hintText;
  final Widget? suffixIco;
  final void Function(String)? onChanged;
  final void Function()? onTap;
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
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
