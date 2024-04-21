import 'package:flutter/material.dart';
import 'package:untitledtaskmanger/Feature/auth/presintaion/views/register_page.dart';
import 'package:untitledtaskmanger/Feature/splah_screen/presintaion/views/onboarding_view.dart';
import 'package:untitledtaskmanger/Feature/splah_screen/presintaion/views/splash_view.dart';
import 'package:untitledtaskmanger/Feature/task/prisintaion/views/add_task_view.dart';
import 'package:untitledtaskmanger/Feature/task/prisintaion/views/task_home.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  '/': (context) => const SplashView(),
  '/onboarding': (context) => const OnBoardingView(),
  '/loginpage': (context) => const RegisterPage(),
  '/taskhome': (context) => const TaskAppView(),
  '/addtask': (context) => const AddTaskView(),
};
