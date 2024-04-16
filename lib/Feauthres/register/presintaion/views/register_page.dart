import 'package:flutter/material.dart';
import 'package:untitledtaskmanger/Feauthres/register/presintaion/views/widget/custom_multi_login_signup.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
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
