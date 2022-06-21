import 'package:flutter/material.dart';
import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/models/category.dart';
import 'package:store_app/pages/detailspage.dart';
import 'package:store_app/widgets/categoryicon.dart';
import 'package:store_app/widgets/mainappbar.dart';

class SelectedCategoryPage extends StatelessWidget {
  final Category selectedCategory;
  const SelectedCategoryPage({required this.selectedCategory, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    return Scaffold(
      appBar: const MainAppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5.0),
                child: CategoryIcon(
                  color: selectedCategory.color,
                  iconName: selectedCategory.iconName,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                selectedCategory.name.toString(),
              ),
            ],
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                selectedCategory.subCategory!.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailsPage(
                                subCategory:
                                    selectedCategory.subCategory![index]);
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.all(20.0),
                              height: query.size.width / 3,
                              width: query.size.width / 3,
                              padding: const EdgeInsets.all(0.5),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.mainColor),
                              child: ClipOval(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(query.size.width / 3),
                                  child: Image.asset(
                                    'assets/imgs/${selectedCategory.subCategory![index].imgName}.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          selectedCategory.subCategory![index].name,
                          style: TextStyle(color: selectedCategory.color),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
