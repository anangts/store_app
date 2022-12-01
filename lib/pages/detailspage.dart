import 'package:flutter/material.dart';
import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/models/subcategory.dart';
import 'package:store_app/widgets/categoryicon.dart';
import 'package:store_app/widgets/categorypartlist.dart';
import 'package:store_app/widgets/mainappbar.dart';
import 'package:store_app/widgets/themebutton.dart';
import 'package:store_app/widgets/unitpricewidget.dart';

class DetailsPage extends StatefulWidget {
  final SubCategory subCategory;

  const DetailsPage({
    required this.subCategory,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            child: Stack(
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/imgs/${widget.subCategory.imgName}.jpg',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CategoryIcon(
                          color: widget.subCategory.color,
                          iconName: widget.subCategory.iconName,
                          size: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Pork Meat',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: widget.subCategory.color,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                '50.00 /lb',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const MainAppBar(
                  themeColor: Colors.white,
                ),
                Positioned(
                  right: 20,
                  top: 80,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.mainColor),
                    child: Row(
                      children: const [
                        Text(
                          '3',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                CategoryPartList(subCategory: widget.subCategory),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    UnitPriceWidget(),
                    ThemeButton(
                      label: 'Add to Cart',
                      onClick: () {},
                    ),
                    ThemeButton(
                      label: 'Product location',
                      color: AppColor.darkGreen,
                      colorBorder: AppColor.mainColor,
                      onClick: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const MapPage(),

                        //   ),
                        // );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
