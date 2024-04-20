import 'package:flutter/material.dart';
import 'package:untitledtaskmanger/Feature/add_task_screen/prisintaion/views/add_task_view.dart';
import 'package:untitledtaskmanger/Feature/auth/presintaion/views/register_page.dart';
import 'package:untitledtaskmanger/Feature/splah_screen/presintaion/views/onboarding_view.dart';
import 'package:untitledtaskmanger/Feature/splah_screen/presintaion/views/splash_view.dart';
import 'package:untitledtaskmanger/Feature/task_screen/perisintaion/views/task_home.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  '/': (context) => const SplashView(),
  '/onboarding': (context) => const OnBoardingView(),
  '/loginpage': (context) => const RegisterPage(),
  '/taskhome': (context) => const TaskApp(),
  '/addtask': (context) => const AddTaskView(),
};