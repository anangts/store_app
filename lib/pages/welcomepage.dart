import 'package:flutter/material.dart';
import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/pages/categorylistpage.dart';
import 'package:store_app/services/loginservice.dart';
import 'package:store_app/widgets/themebutton.dart';

// ignore: must_be_immutable
class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  LoginService loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'assets/imgs/img_bg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipOval(
                      child: Container(
                        width: 120,
                        height: 120,
                        color: AppColor.mainColor,
                        child: const Icon(
                          Icons.local_mall_outlined,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Text(
                    'ShoppeMe',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 32.0,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Tempatnya shopping \ntermurah di indonesia',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.0,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  ThemeButton(label: 'DAFTAR', onClick: () {}),
                  ThemeButton(
                    label: 'LOGIN',
                    color: Colors.transparent,
                    onClick: () async {
                      bool success = await loginService.signInWithGoogle();

                      if (success) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryListPage()));
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
