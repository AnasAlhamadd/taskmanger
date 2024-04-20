import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.suffixIcon,
    required this.keyboardType,
    required this.onChanged,
    required this.textEditingController,
    required this.validator,
    required this.label,
  });
  final Icon? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final String? Function(String?) validator;
  final Widget? label;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      margin: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      child: TextFormField(
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: textEditingController,
        onChanged: onChanged,
        maxLines: null,
        expands: true,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            label: label,
            suffixIcon: suffixIcon,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            filled: true,
            fillColor: Colors.grey.withOpacity(.30),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
            border: buildBorder()),
      ),
    );
  }
}

InputBorder buildBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(6.0),
      right: Radius.circular(6.0),
    ),
  );
}
