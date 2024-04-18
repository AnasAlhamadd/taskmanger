import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitledtaskmanger/Feauthres/register/presintaion/views/register_page.dart';
import 'package:untitledtaskmanger/Feauthres/splah_screen/presintaion/views/splash_view.dart';
import 'package:untitledtaskmanger/Feauthres/splah_screen/presintaion/views/widgets/onBoarding/on_Boarding_view.dart';
import 'package:untitledtaskmanger/Feauthres/add_task_screen/prisintaion/views/add_task_view.dart';
import 'package:untitledtaskmanger/Feauthres/task_screen/perisintaion/views/widgets/task_app_viewbody.dart';

class GoRouterPages {
  final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const TaskAppBodyView();
        // return const SplashView();
      },
    ),
    GoRoute(
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingView();
      },
    ),
    GoRoute(
      path: '/loginpage',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: '/taskhome',
      builder: (BuildContext context, GoRouterState state) {
        return const TaskAppBodyView();
      },
    ),
    GoRoute(
      path: '/addtask',
      builder: (BuildContext context, GoRouterState state) {
        return const AddTaskView();
      },
    ),
  ]);
}
