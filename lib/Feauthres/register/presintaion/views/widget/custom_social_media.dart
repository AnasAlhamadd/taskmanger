import 'package:flutter/material.dart';

class CustomSocialMedia extends StatelessWidget {
  const CustomSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .2,
        ),
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/facebook.png'),
        ),
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/googlee.png'),
        ),
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/twitter.png'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .2,
        ),
      ],
    );
  }
}
