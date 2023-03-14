import 'package:flutter/material.dart';
import 'package:store_app/helper/utils.dart';
import 'package:store_app/models/onboarding.dart';
import 'package:store_app/pages/login_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _controller = PageController();
  int _currentPage = 0;
  List colors = [
    const Color.fromARGB(255, 62, 240, 198),
    const Color.fromARGB(255, 252, 201, 60),
    const Color.fromARGB(255, 252, 136, 157)
  ];
  final List<OnBoarding> onBoarding = Utils.getOnboarding();

  // animation dot onboardscreen
  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          color: Color(0xFF000000),
        ),
        margin: const EdgeInsets.only(right: 5),
        height: 10,
        curve: Curves.easeIn,
        width: _currentPage == index ? 20 : 10);
  }

  // animation picture
  Expanded _pictureOnboard(
      double blockV, double heightScreen, double widthScreen) {
    return Expanded(
        flex: 3,
        child: PageView.builder(
            controller: _controller,
            onPageChanged: (value) => setState(() => _currentPage = value),
            itemCount: onBoarding.length,
            itemBuilder: (context, i) {
              return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(children: [
                    Image.asset('assets/imgs/${onBoarding[i].image}.png',
                        height: blockV * 35),
                    SizedBox(height: (heightScreen >= 840) ? 60 : 30),
                    Text(onBoarding[i].title!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: (widthScreen <= 550) ? 30 : 35)),
                    const SizedBox(height: 15)
                  ]));
            }));
  }

  // Begin Screen
  Widget _startPage(double widthScreen) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextButton(
              onPressed: () {
                _controller.jumpToPage(2);
              },
              style: TextButton.styleFrom(
                  elevation: 0,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: (widthScreen <= 550) ? 13 : 17,
                  )),
              child: const Text(
                "SKIP",
                style: TextStyle(color: Colors.black),
              )),
          ElevatedButton(
              onPressed: () {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 0,
                padding: (widthScreen <= 550)
                    ? const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
                    : const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                textStyle: TextStyle(fontSize: (widthScreen <= 550) ? 13 : 17),
              ),
              child: const Text("NEXT"))
        ]));
  }

  // End Screen
  Widget _endPage(BuildContext context, double widthScreen) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: (widthScreen <= 550)
                  ? const EdgeInsets.symmetric(horizontal: 100, vertical: 20)
                  : EdgeInsets.symmetric(
                      horizontal: widthScreen * 0.2, vertical: 25),
              textStyle: TextStyle(fontSize: (widthScreen <= 550) ? 13 : 17)),
          child: const Text("START"),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    double widthScreen = mediaQueryData.size.width;
    double heightScreen = mediaQueryData.size.height;
    double blockV = heightScreen / 100;

    return Scaffold(
        backgroundColor: colors[_currentPage],
        body: SafeArea(
            child: Column(children: [
          // animation picture
          _pictureOnboard(blockV, heightScreen, widthScreen),

          // animation text, dot icons and navigation button
          Expanded(
              flex: 1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // animation dot and text describtion
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(onBoarding.length,
                            (int index) => _buildDots(index: index))),

                    //controller page onboarding_page
                    _currentPage + 1 == onBoarding.length
                        ? _endPage(context, widthScreen)
                        : _startPage(widthScreen)
                  ]))
        ])));
  }
}
