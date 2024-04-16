import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:untitledtaskmanger/core/helper/cache.dart';
import 'package:untitledtaskmanger/core/helper/constant.dart';
import 'package:untitledtaskmanger/services/services_layer.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool isScreenLogo = false;

  Future<void> loadlogo() async {
    Timer(const Duration(seconds: 3), () {
      bool onBoarding = getIt<CacheHelper>().getData(key: 'onboaring') ?? false;
      bool loginPage = getIt<CacheHelper>().getData(key: 'login') ?? false;
      if (loginPage && onBoarding) {
        context.go('/taskhome');
      } else {
        onBoarding ? context.go('/loginpage') : context.go('/onboarding');
      }
    });
  }

  @override
  void initState() {
    loadlogo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: SvgPicture.asset(
            klogo,
          ),
        ),
      ),
    );
  }
}
