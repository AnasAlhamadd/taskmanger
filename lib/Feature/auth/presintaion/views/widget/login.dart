import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitledtaskmanger/Feature/auth/cubit/auth_cubit.dart';
import 'package:untitledtaskmanger/Feature/auth/cubit/auth_state.dart';
import 'package:untitledtaskmanger/Feature/auth/presintaion/views/widget/custom_textform_field.dart';
import 'package:untitledtaskmanger/core/database/cache.dart';
import 'package:untitledtaskmanger/core/services/services_layer.dart';
import 'package:untitledtaskmanger/core/widgets/custom_button.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';
// import 'package:untitledtaskmanger/cubit/signin_cubit.dart';
// import 'package:untitledtaskmanger/cubit/signin_state.dart';
import 'package:untitledtaskmanger/core/widgets/show_snak_bar.dart';

class CustomAllfieldsLogin extends StatefulWidget {
  const CustomAllfieldsLogin({
    super.key,
  });

  @override
  State<CustomAllfieldsLogin> createState() => _CustomAllfieldsLoginState();
}

GlobalKey<FormState> formstate = GlobalKey<FormState>();
TextEditingController? emailLoginTextController;
TextEditingController? passwordLoginTextController;
String? email;
String? password;

bool isChecked = false;

class _CustomAllfieldsLoginState extends State<CustomAllfieldsLogin> {
  @override
  void initState() {
    emailLoginTextController = TextEditingController();
    passwordLoginTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailLoginTextController!.dispose();
    passwordLoginTextController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is SignInSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (isChecked) {
              getIt<CacheHelper>().setData(key: 'login', value: true);
            }
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/taskhome', (route) => false);
          });
        } else if (state is SignInFaliure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showsnackbar(context: context, title: state.errMessage);
          });
        }
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          child: Form(
            key: formstate,
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                CustomTextField(
                    validator: (val) {
                      if (val!.isEmpty) return 'The field is empty';
                    },
                    textEditingController: emailLoginTextController,
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
                    textEditingController: passwordLoginTextController,
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
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is SignInLoading) {
                      return const CircularProgressIndicator();
                    }

                    return CustomButton(
                      textButton: 'Sign In',
                      onPressed: () async {
                        if (formstate.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context)
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
