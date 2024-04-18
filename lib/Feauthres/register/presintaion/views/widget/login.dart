import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:untitledtaskmanger/Feauthres/register/presintaion/views/widget/custom_textform_field.dart';
import 'package:untitledtaskmanger/core/widgets/butoon_login_signup.dart';
import 'package:untitledtaskmanger/core/helper/cache.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';
import 'package:untitledtaskmanger/cubit/signin_cubit.dart';
import 'package:untitledtaskmanger/cubit/signin_state.dart';
import 'package:untitledtaskmanger/core/widgets/show_snak_bar.dart';
import 'package:untitledtaskmanger/services/services_layer.dart';

class CustomAllfieldsLogin extends StatefulWidget {
  const CustomAllfieldsLogin({
    super.key,
  });

  @override
  State<CustomAllfieldsLogin> createState() => _CustomAllfieldsLoginState();
}

class _CustomAllfieldsLoginState extends State<CustomAllfieldsLogin> {
  String? email;
  String? password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController? emailTextController;
  late TextEditingController? passwordTextController;
  bool isChecked = false;
  @override
  void initState() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailTextController!.dispose();
    passwordTextController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninCubit, SignInState>(
      builder: (context, state) {
        if (state is SignInSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (isChecked) {
              getIt<CacheHelper>().setData(key: 'login', value: true);
            }
            context.go('/taskhome');
          });
        } else if (state is SignInFaliure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showsnackbar(context: context, title: state.errMessage);
          });
        }
        return Form(
          key: formstate,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
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
                    onChanged: (val) {
                      password = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) return 'The field is empty';
                    },
                    textEditingController: passwordTextController,
                    keyboardType: TextInputType.multiline,
                    label: const Text(
                      'Password',
                    ),
                    suffixIcon: const Icon(
                      Icons.remove_red_eye_outlined,
                      size: 28,
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        activeColor: Colors.grey[500],
                        onChanged: (val) {
                          setState(() {
                            isChecked = val as bool;
                          });
                        }),
                    Text(
                      'Remember me',
                      style: Styles().textstyle22.copyWith(color: Colors.white),
                    )
                  ],
                ),
                BlocBuilder<SigninCubit, SignInState>(
                  builder: (context, state) {
                    if (state is SignInLoading) {
                      return const CircularProgressIndicator();
                    }

                    return CustomButton(
                      textButton: 'Sign In',
                      onPressed: () async {
                        if (formstate.currentState!.validate()) {
                          BlocProvider.of<SigninCubit>(context)
                              .signIn(email: email!, password: password!);
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
