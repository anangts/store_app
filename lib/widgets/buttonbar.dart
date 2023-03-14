import 'package:flutter/material.dart';
import 'package:store_app/helper/appcolor.dart';

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({
    Key? key,
  }) : super(key: key);

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
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.favorite, color: AppColor.mainColor),
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon:
                    const Icon(Icons.shopping_cart, color: AppColor.mainColor),
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.pin_drop, color: AppColor.mainColor),
                onPressed: () {},
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.settings, color: AppColor.mainColor),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
