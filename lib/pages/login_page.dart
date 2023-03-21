import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/firebase/auth.dart';
import 'package:store_app/helper/appcolor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerAge = TextEditingController();
  String? _errorMessage = '';
  bool _isLogin = true;

  // SignIn Email method with exception
  Future<void> _signInemail() async {
    try {
      await Auth().signInEmail(
          email: controllerName.text, password: controllerAge.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    }
  }

  // SignUp Email method with exception
  Future<void> _signUpEmail() async {
    try {
      await Auth().createUserEmail(
          email: controllerName.text, password: controllerAge.text);
    } on FirebaseAuthException catch (e) {
      setState(
        () {
          _errorMessage = e.message;
        },
      );
    }
  }

  // SignIn with Google method with exception
  Future<void> _googleLogin() async {
    try {
      await Auth().signInGoogle();
    } on FirebaseAuthException catch (e) {
      setState(
        () {
          _errorMessage = e.message;
        },
      );
    }
  }

  // SignIn anonymous method with exception
  Future<void> _signInAnonymous() async {
    try {
      await Auth().signInAnon();
    } on FirebaseAuthException catch (e) {
      setState(
        () {
          _errorMessage = e.message;
        },
      );
    }
  }

  // Error Notification
  Widget _errorNotification() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Text(
          _errorMessage == '' ? '' : '$_errorMessage',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // entry field for your email and password
  Widget _entryField(
      {required IconData icon,
      String? title,
      required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColor.mainColor),
          labelText: title ?? '',
          labelStyle: const TextStyle(color: AppColor.mainColor),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.mainColor),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.mainColor),
          ),
        ),
      ),
    );
  }

  // choice login or register instead
  Widget _loginOrRegister() {
    return TextButton(
      onPressed: () {
        setState(() {
          _isLogin = !_isLogin;
        });
      },
      child: Text(_isLogin ? ' Register instead ' : '  Login Instead '),
    );
  }

  // submit button
  Widget _button({VoidCallback? press, Color? color, String? label}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
      child: SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: press ?? () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: const BorderSide(color: AppColor.mainColor, width: 2.0),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(color ?? Colors.transparent),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            ),
          ),
          child: Text(
            label ?? '',
            style: const TextStyle(fontFamily: 'Roboto', fontSize: 24),
          ),
        ),
      ),
    );
  }

  // button for google login and guest login
  Widget _ovalButton({VoidCallback? press, String? pic}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        width: 40,
        child: GestureDetector(
          onTap: press ?? () {},
          child: ClipOval(
            child: Image.asset('assets/imgs/${pic ?? 'dian'}.jpg'),
          ),
        ),
      ),
    );
  }

  // background picture
  Widget _background() {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.2,
        child: Image.asset(
          'assets/imgs/img_bg.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // logo and tag line
  Widget _logo() {
    return Flexible(
      flex: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'ShoppeMe',
              style: TextStyle(
                  fontFamily: 'Roboto', fontSize: 46.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const Text(
            'Tempatnya shopping \ntermurah di indonesia',
            style: TextStyle(
                fontFamily: 'Roboto', fontSize: 14.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // entry user accpunt, login option (google, email, anonymous/guest)
  Widget _inputData() {
    return Flexible(
      flex: 5,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _entryField(
                icon: Icons.people, controller: controllerName, title: 'Email'),
            _entryField(
                icon: Icons.lock, controller: controllerAge, title: 'Password'),
            _errorNotification(),
            _button(
                label: _isLogin ? 'LOGIN' : 'REGISTER',
                press: () {
                  _isLogin ? _signInemail() : _signUpEmail();
                },
                color: AppColor.mainColor),
            _loginOrRegister(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ovalButton(pic: 'guest', press: _signInAnonymous),
                _ovalButton(pic: 'google', press: _googleLogin),
              ],
            )
          ],
        ),
      ),
    );
  }

  // login view
  Center _mainLogin(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logo(),
            _inputData(),
          ],
        ),
      ),
    );
  }

  // dispose method
  @override
  void dispose() {
    controllerName.dispose();
    controllerAge.dispose();
    super.dispose();
  }

  // root code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            _background(),
            _mainLogin(context),
          ],
        ),
      ),
    );
  }
}
