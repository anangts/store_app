import 'package:flutter/material.dart';
import 'package:store_app/firebase/auth.dart';
import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/models/category.dart';
import 'package:store_app/helper/utils.dart';
import 'package:store_app/pages/subcategory_page.dart';
import 'package:store_app/widgets/bottombar.dart';
import 'package:store_app/widgets/categoryicon.dart';
import 'package:store_app/widgets/mainappbar.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);
  final List<Category> categories = Utils.getMockedCategories();

  // Bottom Bar Button Menu
  Widget _bottomBarBtn() {
    return const Positioned(
      bottom: 0.0,
      right: 0.0,
      left: 0.0,
      child: BottomBarButton(),
    );
  }

  // List All Categories
  Widget _listAllCategory(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 60.0),
        itemCount: categories.length,
        itemBuilder: (BuildContext ctx, int index) {
          return _categoryCard(
            context: context,
            category: categories[index],
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SubCategoryPage(selectedCategory: categories[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // title/name page
  Widget _titlePage() {
    return const Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Text(
        'Select Categories',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Roboto', fontSize: 24.0, color: AppColor.mainColor),
      ),
    );
  }

  // exit application button
  Widget _exitBtn() {
    return TextButton.icon(
      label: const Text('Sign out'),
      onPressed: () => Auth().signOut(),
      icon: const Center(
        child: SizedBox(
            height: 30,
            width: 50,
            child: Icon(Icons.exit_to_app_sharp, size: 64)),
      ),
    );
  }

  // method category card
  Widget _categoryCard(
      {required BuildContext context,
      required Category category,
      final VoidCallback? onPress}) {
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
              child: Image.asset('assets/imgs/${category.imgName}.jpg',
                  fit: BoxFit.cover),
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
                    bottomRight: Radius.circular(20.0)),
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
                      categories: const []),
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
                excludeFromSemantics: true),
          ),
        ],
      ),
    );
  }

  // root code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: _exitBtn(),
      ),
      appBar: const MainAppBar(),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title 'Select Categories'
              _titlePage(),

              // List all Category
              _listAllCategory(context),
            ],
          ),

          // button bottombar
          _bottomBarBtn(),
        ],
      ),
    );
  }
}
