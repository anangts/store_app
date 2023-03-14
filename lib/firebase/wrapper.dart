import 'package:flutter/material.dart';

import 'package:store_app/firebase/auth.dart';
import 'package:store_app/pages/category_page.dart';
import 'package:store_app/pages/login_page.dart';
// ignore: unused_import
import 'package:store_app/pages/splashscreen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChange,
      builder: (context, snapshot) {
        return snapshot.hasData ? CategoryPage() : const LoginPage();
      },
    );
  }
}
