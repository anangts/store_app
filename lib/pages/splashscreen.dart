import 'package:flutter/material.dart';
import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/pages/onboarding_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 1200),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoardingPage(),
          ),
        );
      },
    );
    return const Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Center(
        child: Icon(
          Icons.local_mall_outlined,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
