import 'package:flutter/material.dart';
import 'package:store_app/models/category.dart';
import 'package:store_app/models/categorypart.dart';

class SubCategory extends Category {
  late List<CategoryPart>? part;
  SubCategory(
      {this.part,
      required String name,
      required IconData icon,
      required Color color,
      required String imgName,
      })
      : super(
          name: name,
          iconName: icon,
          color: color,
          imgName: imgName,
        );
}
