import 'package:flutter/material.dart';
import 'package:store_app/helper/appcolor.dart';

// ignore: must_be_immutable
class ThemeButton extends StatelessWidget {
  late String label;
  late Color labelColor;
  late Color color;
  late Color colorBorder;
  late Widget icon;
  late Color highlight;
  late VoidCallback onClick;

  ThemeButton(
      {required this.label,
      this.labelColor = Colors.white,
      this.color = AppColor.mainColor,
      icon,
      this.colorBorder = AppColor.mainColor,
      this.highlight = AppColor.highlightDefault,
      required this.onClick,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      child: ElevatedButton(
        onPressed: onClick,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: colorBorder, width: 2.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(color),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }
}
