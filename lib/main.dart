import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitledtaskmanger/Feature/auth/cubit/auth_cubit.dart';
import 'package:untitledtaskmanger/Feature/task/cubit/task_cubit.dart';
import 'package:untitledtaskmanger/core/database/cache.dart';
import 'package:untitledtaskmanger/core/helper/constant.dart';
import 'package:untitledtaskmanger/core/services/services_layer.dart';
import 'package:untitledtaskmanger/firebase_options.dart';
import 'package:untitledtaskmanger/routing.dart';
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
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => TaskviewCubit()..selectData()),
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
