import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_app/helper/appcolor.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color themeColor;
  const MainAppBar({this.themeColor = AppColor.mainColor, Key? key})
      : super(key: key);

  @override
  MainAppBarState createState() => MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class MainAppBarState extends State<MainAppBar> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  // Sign out Method
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: IconButton(
        onPressed: signOut,
        icon: const Icon(Icons.local_mall_outlined),
        color: AppColor.mainColor,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: widget.themeColor),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipOval(
            child: Image.asset('assets/imgs/dian.jpg'),
          ),
        ),
      ],
    );
  }
}
