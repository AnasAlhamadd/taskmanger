import 'package:flutter/material.dart';
import 'package:untitledtaskmanger/core/helper/constant.dart';

class CustomButtonLoginWithSignUp extends StatelessWidget {
  const CustomButtonLoginWithSignUp(
      {super.key, required this.textButton, required this.onPressed});
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: MaterialButton(
        splashColor: Colors.grey[500],
        color: kButtonColor,
        height: 50,
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            textButton,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }
}
