import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:untitledtaskmanger/Feauthres/register/presintaion/views/widget/custom_divider.dart';
import 'package:untitledtaskmanger/Feauthres/register/presintaion/views/widget/custom_social_media.dart';
import 'package:untitledtaskmanger/Feauthres/register/presintaion/views/widget/custom_textform_field.dart';
import 'package:untitledtaskmanger/core/helper/butoon_login_signup.dart';
import 'package:untitledtaskmanger/cubit/signup_cubit.dart';
import 'package:untitledtaskmanger/core/helper/show_snak_bar.dart';

class CustomAllfieldsSignUp extends StatefulWidget {
  const CustomAllfieldsSignUp({
    super.key,
  });

  @override
  State<CustomAllfieldsSignUp> createState() => _CustomAllfieldsSignUpState();
}

class _CustomAllfieldsSignUpState extends State<CustomAllfieldsSignUp> {
  late TextEditingController? passTextController;
  late TextEditingController? confirmPassTextController;
  late TextEditingController? emailTextController;
  String? email;
  String? password;
  final GlobalKey<FormState>? formstate = GlobalKey<FormState>();
  @override
  void initState() {
    passTextController = TextEditingController();
    emailTextController = TextEditingController();
    confirmPassTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passTextController!.dispose();
    confirmPassTextController!.dispose();
    emailTextController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        if (state is SignUpSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            (context).go('/loginpage');
          });
        } else if (state is SignUpFaliure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showsnackbar(context: context, title: state.errMessage);
          });
        }
        return Form(
          key: formstate,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                    validator: (val) {
                      if (val!.isEmpty) return 'The field is empty';
                    },
                    textEditingController: emailTextController,
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
                  textEditingController: passTextController,
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

                      if (confirmPassTextController!.text !=
                          passTextController!.text) {
                        return 'Password Does Not Match';
                      }
                    },
                    textEditingController: confirmPassTextController,
                    onChanged: (val) {
                      password = val;
                    },
                    suffixIcon: const Icon(FontAwesomeIcons.eye),
                    keyboardType: TextInputType.multiline,
                    label: const Text(
                      'Confirm Password',
                    )),
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    if (state is SignUpLoading) {
                      return const CircularProgressIndicator();
                    }

                    return CustomButton(
                      textButton: 'Sign Up',
                      onPressed: () async {
                        if (formstate!.currentState!.validate()) {
                          BlocProvider.of<SignUpCubit>(context)
                              .signUp(email: email!, password: password!);
                        }
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 22,
                ),
                const CustomDivider(),
                const SizedBox(
                  height: 22,
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
