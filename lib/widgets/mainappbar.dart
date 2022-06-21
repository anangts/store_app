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
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Icon(
        Icons.local_mall_outlined,
        color: AppColor.mainColor,
        size: 30.0,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: widget.themeColor),
      actions: [
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10.0),
          child: ClipOval(
            child: Image.asset('assets/imgs/dian.jpg'),
          ),
        ),
      ],
    );
  }
}
