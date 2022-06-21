// ignore_for_file: unused_import, duplicate_ignore

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:store_app/helper/utils.dart';
// ignore: unused_import
import 'package:store_app/pages/detailspage.dart';
import 'package:store_app/pages/mappage.dart';
import 'package:store_app/pages/onboardingpage.dart';
// ignore: unused_import
import 'package:store_app/pages/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
            //DetailsPage(
            //subCategory: Utils.getMockedCategories()[0].subCategory![0]),
            //SplashScreen(),
            OnBoardingPage(),
        //MapPage()
      ),
    );
  }
}
