import 'package:flutter/material.dart';
import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/helper/progress.dart';

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({
    Key? key,
  }) : super(key: key);

  // menu bar button
  ClipOval _menuBar(BuildContext context, IconData icon) {
    return ClipOval(
      child: Material(
        child: IconButton(
          icon: Icon(icon, color: AppColor.mainColor),
          onPressed: () {
            Notif.onProgress(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 20.0,
              color: Colors.black.withOpacity(0.5),
              offset: Offset.zero),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _menuBar(context, Icons.favorite_border_outlined),
          _menuBar(context, Icons.shopping_cart),
          _menuBar(context, Icons.pin_drop_outlined),
          _menuBar(context, Icons.settings),
        ],
      ),
    );
  }
}
