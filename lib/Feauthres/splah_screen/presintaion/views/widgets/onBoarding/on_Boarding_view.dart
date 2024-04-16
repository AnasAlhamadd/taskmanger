import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:untitledtaskmanger/Feauthres/splah_screen/data/static/list_onboarding.dart';
import 'package:untitledtaskmanger/Feauthres/splah_screen/presintaion/views/widgets/onBoarding/custom_image_dotindicato.dart';
import 'package:untitledtaskmanger/Feauthres/splah_screen/presintaion/views/widgets/onBoarding/custom_title_body.dart';
import 'package:untitledtaskmanger/Feauthres/splah_screen/presintaion/views/widgets/onBoarding/custom-button.dart';
import 'package:untitledtaskmanger/core/helper/cache.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';
import 'package:untitledtaskmanger/services/services_layer.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController pagecontroller;
  int curentpage = 0;

  void next() {
    curentpage++;
    if (curentpage + 1 > onBoardingList.length) {
      getIt<CacheHelper>().setData(key: 'onboaring', value: true);
      context.go('/loginpage');
    } else {
      pagecontroller.animateToPage(curentpage,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
  }

  onpageCahnged(int index) {
    setState(() {
      curentpage = index;
    });
  }

  @override
  void initState() {
    pagecontroller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: PageView.builder(
            controller: pagecontroller,
            onPageChanged: (value) {
              onpageCahnged(value);
            },
            itemCount: onBoardingList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 34),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Skip',
                          style: Styles().textstyle28,
                        ),
                      ),
                    ),
                    CustomImageAndIndicator(
                      imageSrc: onBoardingList[index].image,
                      curentpage: curentpage,
                    ),
                    CustomTitleAndBody(
                        title: onBoardingList[index].title,
                        body: onBoardingList[index].body),
                    const Spacer(),
                    CustomButtonOnBoarding(
                      textButton: index != onBoardingList.length - 1
                          ? 'NEXT'
                          : 'Get Started',
                      onPressed: () {
                        next();
                      },
                    ),
                  ],
                ),
              );
            }),
      )),
    );
  }
}
