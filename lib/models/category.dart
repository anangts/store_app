import 'package:flutter/material.dart';

 class Category {
  late String? name;
  late IconData? iconName;
  late Color? color;
  late String? imgName;
  late List? subCategory;

  Category(
      {this.name,
      this.iconName,
      this.color,
      this.imgName,
      this.subCategory,
      Key? key});
}
