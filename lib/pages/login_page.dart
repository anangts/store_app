import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/firebase/auth.dart';
import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/widgets/themebutton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _errorMessage = '';

// Error Notification
  Widget _errorNotification() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(_errorMessage == '' ? '' : '$_errorMessage'),
    );
  }

  // SignIn with Google method with exception
  Future<void> _googleLogin() async {
    try {
      await Auth().signInGoogle();
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    }
  }

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
                  ThemeButton(
                    label: 'DAFTAR',
                    onClick: _googleLogin,
                  ),
                  ThemeButton(
                    label: 'LOGIN',
                    color: Colors.transparent,
                    onClick: _googleLogin,
                  ),
                  _errorNotification(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
