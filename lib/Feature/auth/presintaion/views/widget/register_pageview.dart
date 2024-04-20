import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitledtaskmanger/Feature/auth/presintaion/views/widget/custom_multi_login_signup.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class RegisterPageViewBody extends StatelessWidget {
  const RegisterPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.h,
          ),
          Center(
            child: Text(
              'Welcome Back ',
              style: Styles().textstyle32,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '\t Welcome Back !  Plase Enter Your details ',
              style: Styles().textstyle16,
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                CustomMultiLoaginOrSignup(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
