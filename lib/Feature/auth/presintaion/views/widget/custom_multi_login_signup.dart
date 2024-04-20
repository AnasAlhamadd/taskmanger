import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitledtaskmanger/Feature/auth/presintaion/views/widget/login.dart';
import 'package:untitledtaskmanger/Feature/auth/presintaion/views/widget/signup.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class CustomMultiLoaginOrSignup extends StatefulWidget {
  const CustomMultiLoaginOrSignup({super.key});

  @override
  State<CustomMultiLoaginOrSignup> createState() =>
      _CustomMultiLoaginOrSignupState();
}

class _CustomMultiLoaginOrSignupState extends State<CustomMultiLoaginOrSignup> {
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.withOpacity(.5),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    isActive = true;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: isActive
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            )
                          : const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                      color:
                          isActive ? Colors.white : Colors.grey.withOpacity(.5),
                    ),
                    child: Center(
                      child: Text('Sign In', style: Styles().textstyle22),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    isActive = false;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: isActive
                          ? const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            )
                          : const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                      color:
                          isActive ? Colors.grey.withOpacity(.5) : Colors.white,
                    ),
                    child: Center(
                      child: Text('Sign Up', style: Styles().textstyle22),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        isActive ? const CustomAllfieldsLogin() : const CustomAllfieldsSignUp(),
      ],
    );
  }
}
