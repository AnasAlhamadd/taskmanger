import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitledtaskmanger/Feature/splah_screen/data/static/list_onboarding.dart';

class CustomImageAndIndicator extends StatelessWidget {
  const CustomImageAndIndicator(
      {super.key, required this.imageSrc, required this.curentpage});
  final String imageSrc;
  final int curentpage;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 34),
        child: SvgPicture.asset(imageSrc),
      ),
      SizedBox(
        height: 15.0.h,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ...List.generate(
            onBoardingList.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: 27,
                    height: 4,
                    decoration: BoxDecoration(
                      color: curentpage == index
                          ? Colors.white
                          : Colors.white.withOpacity(.3),
                      borderRadius: BorderRadius.circular(43),
                    ),
                  ),
                )),
      ]),
    ]);
  }
}
