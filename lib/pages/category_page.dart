import 'package:flutter/material.dart';
import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/models/category.dart';
import 'package:store_app/helper/utils.dart';
import 'package:store_app/pages/subcategory_page.dart';
import 'package:store_app/widgets/categorybuttonbar.dart';
import 'package:store_app/widgets/categorycard.dart';
import 'package:store_app/widgets/mainappbar.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);
  final List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: const MainAppBar(),
        body: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Text('Select Categories',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 24.0,
                        color: AppColor.mainColor))),
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return CategoryCard(
                          category: categories[index],
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubCategoryPage(
                                        selectedCategory: categories[index])));
                          });
                    }))
          ]),
          const Positioned(
              bottom: 0.0, right: 0.0, left: 0.0, child: CategoryButtonBar())
        ]));
  }
}
