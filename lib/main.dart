import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitledtaskmanger/Feature/add_task_screen/prisintaion/views/add_task_view.dart';
import 'package:untitledtaskmanger/Feature/register/presintaion/views/register_page.dart';
import 'package:untitledtaskmanger/Feature/splah_screen/presintaion/views/splash_view.dart';
import 'package:untitledtaskmanger/Feature/splah_screen/presintaion/views/widgets/onboarding_view_body.dart';
import 'package:untitledtaskmanger/Feature/task_screen/perisintaion/views/task_home.dart';
import 'package:untitledtaskmanger/core/helper/cache.dart';
import 'package:untitledtaskmanger/core/helper/constant.dart';
import 'package:untitledtaskmanger/cubit/signin_cubit.dart';
import 'package:untitledtaskmanger/cubit/signup_cubit.dart';
import 'package:untitledtaskmanger/firebase_options.dart';
import 'package:untitledtaskmanger/routing.dart';
import 'package:untitledtaskmanger/services/services_layer.dart';
import 'package:untitledtaskmanger/simple_bloc_observer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await getIt<CacheHelper>().init();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();

  runApp(
    const TaskMangerApp(),
  );
}

class TaskMangerApp extends StatelessWidget {
  const TaskMangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SigninCubit()),
          BlocProvider(create: (context) => SignUpCubit()),
        ],
        child: MaterialApp(
          routes: routes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kprimaryColor,
          ),
        ),
      ),
    );
  }
}
