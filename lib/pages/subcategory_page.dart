import 'package:flutter/material.dart';
import 'package:store_app/models/category.dart';
import 'package:store_app/pages/details_page.dart';
import 'package:store_app/widgets/categoryicon.dart';
import 'package:store_app/widgets/mainappbar.dart';

class SubCategoryPage extends StatelessWidget {
  final Category selectedCategory;
  const SubCategoryPage({required this.selectedCategory, Key? key})
      : super(key: key);

  // title and icon selected category
  Row _titleSubCategory() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          margin: const EdgeInsets.all(5.0),
          child: CategoryIcon(
              color: selectedCategory.color,
              iconName: selectedCategory.iconName)),
      const SizedBox(width: 20),
      Text('${selectedCategory.name}')
    ]);
  }

  // list subcategory
  Expanded _subcategory(BuildContext context, MediaQueryData query) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          selectedCategory.subCategory!.length,
          (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailsPage(
                      subCategory: selectedCategory.subCategory![index]);
                }));
              },
              child: _subCategoryCard(query, index),
            );
          },
        ),
      ),
    );
  }

  // subcategory card method
  Widget _subCategoryCard(MediaQueryData query, int index) {
    return Column(
      children: <Widget>[
        Stack(children: <Widget>[
          Container(
              margin: const EdgeInsets.all(16.0),
              height: query.size.width / 3,
              width: query.size.width / 3,
              padding: const EdgeInsets.all(0.5),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  // changes position of shadow
                  offset: const Offset(0, 2),
                ),
              ], shape: BoxShape.circle, color: selectedCategory.color),
              child: ClipOval(
                  child: SizedBox.fromSize(
                      size: Size.fromRadius(query.size.width / 3),
                      child: Image.asset(
                          'assets/imgs/${selectedCategory.subCategory![index].imgName}.jpg',
                          fit: BoxFit.fill))))
        ]),
        Text(
          selectedCategory.subCategory![index].name,
          style: TextStyle(color: selectedCategory.color),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);

    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(children: [
        // title and icon selected category
        _titleSubCategory(),

        // list subcategory
        _subcategory(context, query)
      ]),
    );
  }
}
