import 'package:flutter/material.dart';
import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/helper/utils.dart';
import 'package:store_app/models/onboarding.dart';
import 'package:store_app/pages/categorylistpage.dart';
import 'package:store_app/pages/welcomepage.dart';
import 'package:store_app/widgets/mainappbar.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final List<OnBoarding> _content = Utils.getOnboarding();
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: List.generate(
                  _content.length,
                  (index) => Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.mainColor.withOpacity(1.0),
                              spreadRadius: 0.1,
                              blurRadius: 8.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            'assets/imgs/${_content[index].img}.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: index == _content.length - 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                          child: Column(
                            children: [
                              OnboardButton(
                                text: 'Next',
                                ontap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoryListPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
              child: OnboardButton(
                text: 'Skip Onboarding',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const OnboardButton({
    required this.text,
    required this.ontap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.width / 10,
      width: MediaQuery.of(context).size.width / 1,
      decoration: BoxDecoration(
          color: AppColor.mainColor, borderRadius: BorderRadius.circular(30)),
      child: Material(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          onTap: ontap,
          enableFeedback: true,
          excludeFromSemantics: true,
          borderRadius: BorderRadius.circular(30),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 18, color: Colors.white, fontFamily: 'Roboto'),
            ),
          ),
        ),
      ),
    );
  }
}
