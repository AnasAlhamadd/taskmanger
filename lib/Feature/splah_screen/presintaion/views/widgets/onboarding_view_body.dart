import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitledtaskmanger/Feature/splah_screen/data/static/list_onboarding.dart';
import 'package:untitledtaskmanger/Feature/splah_screen/presintaion/views/widgets/custom_image_dotindicato.dart';
import 'package:untitledtaskmanger/Feature/splah_screen/presintaion/views/widgets/custom-button.dart';
import 'package:untitledtaskmanger/Feature/splah_screen/presintaion/views/widgets/custom_title_body.dart';
import 'package:untitledtaskmanger/core/database/cache.dart';
import 'package:untitledtaskmanger/core/helper/styles.dart';
import 'package:untitledtaskmanger/core/services/services_layer.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingViewBody> {
  late PageController pagecontroller;
  int curentpage = 0;

  void next() {
    curentpage++;
    if (curentpage + 1 > onBoardingList.length) {
      getIt<CacheHelper>().setData(key: 'onboaring', value: true);
      Navigator.of(context).pushNamed('/loginpage');
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
                    SizedBox(
                      height: 20.h,
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
