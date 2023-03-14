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

  const DetailsPage({Key? key, required this.subCategory}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      // header background
      ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          child: Stack(children: [
            Container(
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/imgs/${widget.subCategory.imgName}.jpg'),
                        fit: BoxFit.cover))),
            Positioned.fill(
                child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.transparent
                ])))),

            // product's price
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
                              size: 50),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('${widget.subCategory.name}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                const SizedBox(height: 10),
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: widget.subCategory.color,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Text('90 /pack',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)))
                              ])
                        ]))),

            // app bar
            const MainAppBar(
              themeColor: Colors.white,
            ),

            // The number of products that enter the basket
            Positioned(
                right: 20,
                top: 80,
                child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.mainColor),
                    child: Row(children: const [
                      Text('3',
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      SizedBox(width: 10),
                      Icon(Icons.shopping_cart, color: Colors.white, size: 18)
                    ])))
          ])),

      // details product
      Expanded(
          child: ListView(children: [
        CategoryPartList(subCategory: widget.subCategory),
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          // unit price
          UnitPriceWidget(),

          // button add to cart
          ThemeButton(label: 'Add to Cart', onClick: () {}),

          // button navigate to MapPage();
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
              })
        ])
      ]))
    ]));
  }
}
