import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitledtaskmanger/Feature/auth/cubit/auth_cubit.dart';
import 'package:untitledtaskmanger/Feature/auth/cubit/auth_state.dart';
import 'package:untitledtaskmanger/Feature/auth/presintaion/views/widget/custom_textform_field.dart';
import 'package:untitledtaskmanger/Feature/auth/presintaion/views/widget/custom_divider.dart';
import 'package:untitledtaskmanger/Feature/auth/presintaion/views/widget/custom_social_media.dart';
import 'package:untitledtaskmanger/core/widgets/custom_button.dart';
import 'package:untitledtaskmanger/core/widgets/show_snak_bar.dart';

class CustomAllfieldsSignUp extends StatefulWidget {
  const CustomAllfieldsSignUp({
    super.key,
  });

  @override
  State<CustomAllfieldsSignUp> createState() => _CustomAllfieldsSignUpState();
}

class _CustomAllfieldsSignUpState extends State<CustomAllfieldsSignUp> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String? email;
  String? password;
  late TextEditingController passSignUpTextController;
  late TextEditingController emailSignUpTextController;
  late TextEditingController confirmPassSignUpTextController;
  @override
  void initState() {
    passSignUpTextController = TextEditingController();
    emailSignUpTextController = TextEditingController();
    confirmPassSignUpTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passSignUpTextController.dispose();
    confirmPassSignUpTextController.dispose();
    emailSignUpTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is SignUpSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushNamed('/loginpage');
          });
        } else if (state is SignUpFaliure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showsnackbar(context: context, title: state.errMessage);
          });
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: formstate,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                    validator: (val) {
                      if (val!.isEmpty) return 'The field is empty';
                    },
                    textEditingController: emailSignUpTextController,
                    onChanged: (val) {
                      email = val;
                    },
                    suffixIcon: const Icon(FontAwesomeIcons.envelope),
                    keyboardType: TextInputType.emailAddress,
                    label: const Text(
                      'Email',
                    )),
                CustomTextField(
                  validator: (val) {
                    if (val!.length < 5) {
                      return 'The field cannot be smaller two 5 letters';
                    }
                    if (val.isEmpty) return 'The field is empty';
                  },
                  textEditingController: passSignUpTextController,
                  onChanged: (val) {
                    password = val;
                  },
                  keyboardType: TextInputType.multiline,
                  label: const Text(
                    'Password',
                  ),
                  suffixIcon: const Icon(
                    FontAwesomeIcons.solidEyeSlash,
                  ),
                ),
                CustomTextField(
                    validator: (val) {
                      if (val!.isEmpty) return 'The field is empty';

                      if (confirmPassSignUpTextController.text !=
                          passSignUpTextController.text) {
                        return 'Password Does Not Match';
                      }
                    },
                    textEditingController: confirmPassSignUpTextController,
                    onChanged: (val) {
                      password = val;
                    },
                    suffixIcon: const Icon(FontAwesomeIcons.eye),
                    keyboardType: TextInputType.multiline,
                    label: const Text(
                      'Confirm Password',
                    )),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is SignUpLoading) {
                      return const CircularProgressIndicator();
                    }

                    return CustomButton(
                      textButton: 'Sign Up',
                      onPressed: () async {
                        if (formstate.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context)
                              .signUp(email: email!, password: password!);
                        }
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 22.h,
                ),
                const CustomDivider(),
                SizedBox(
                  height: 22.h,
                ),
                const CustomSocialMedia(),
              ],
            ),
          ),
        );
      },
    );
  }
}
