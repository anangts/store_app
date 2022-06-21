import 'package:flutter/material.dart';
import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/models/category.dart';
import 'package:store_app/widgets/categoryicon.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  Category category;
  final VoidCallback? onPress;
  CategoryCard({required this.category, required this.onPress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(
          top: 10.0, right: 20.0, bottom: 10.0, left: 20.0),
      height: 150.0,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/imgs/${category.imgName}.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CategoryIcon(
                    iconName: category.iconName,
                    color: category.color,
                    categories: const [],
                  ),
                  const SizedBox(width: 15.0),
                  Text(
                    category.name.toString(),
                    style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 24.0,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Material(
            borderOnForeground: true,
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              splashColor: AppColor.mainColor,
              onTap: onPress,
              enableFeedback: true,
              excludeFromSemantics: true,
            ),
          ),
        ],
      ),
    );
  }
}
