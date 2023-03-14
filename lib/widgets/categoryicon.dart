import 'package:flutter/material.dart';
import 'package:store_app/models/category.dart';

class CategoryIcon extends StatelessWidget {
  final Color? color;
  final IconData? iconName;
  final double iconsize;
  final double? size;
  final List<Category>? categories;

  const CategoryIcon(
      {this.iconsize = 30.00,
      this.color,
      this.iconName,
      this.size,
      this.categories,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Container(
            color: color,
            padding: const EdgeInsets.all(10.0),
            child: Icon(iconName, color: Colors.white, size: iconsize)));
  }
}
