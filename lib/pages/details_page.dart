import 'package:flutter/material.dart';
import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/helper/progress.dart';
import 'package:store_app/models/subcategory.dart';
import 'package:store_app/widgets/categoryicon.dart';
import 'package:store_app/widgets/mainappbar.dart';
import 'package:store_app/widgets/themebutton.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  int amount = 0;
  int prices = 0;
  int cost = 0;
  final SubCategory subCategory;
  DetailsPage({Key? key, required this.subCategory}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // header backgorund
  ClipRRect _headerBackground() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Stack(
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/imgs/${widget.subCategory.imgName}.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                ),
              ),
            ),
          ),

          // product's name
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CategoryIcon(
                      color: widget.subCategory.color,
                      iconName: widget.subCategory.iconName,
                      size: 50),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '${widget.subCategory.name}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          // app bar
          const MainAppBar(
            themeColor: Colors.white,
          ),

          // The number of products that enter cart
          Positioned(
            right: 20,
            top: 140,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.mainColor),
              child: Row(
                children: const [
                  Text('3',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(width: 12),
                  Icon(Icons.shopping_cart, color: Colors.white, size: 24)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // details product
  Expanded _detailProduct() {
    return Expanded(
      child: SizedBox(
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: Text(
                'Select part what you want :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.subCategory.categorypart!.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    int price = widget.subCategory.categorypart![index].price;
                    setState(
                      () {
                        for (var e in widget.subCategory.categorypart!) {
                          e.isSelected =
                              widget.subCategory.categorypart![index] == e;
                          widget.prices = price;
                        }
                      },
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 15, top: 15, right: 15, bottom: 5),
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                          border:
                              widget.subCategory.categorypart![index].isSelected
                                  ? Border.all(
                                      color: widget.subCategory.color!,
                                      width: 6.0)
                                  : null,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/imgs/${widget.subCategory.categorypart![index].imgName}.jpg'),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset.zero,
                                blurRadius: 10.0),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 18),
                        child: Text(
                          widget.subCategory.categorypart![index].name
                              .toString(),
                          style: TextStyle(color: widget.subCategory.color),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'Price '),
                            TextSpan(
                              text: 'Rp.${widget.prices}K /ons',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Rp.${widget.cost}K',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                // incremen decremen
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        offset: Offset.zero,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        child: InkWell(
                          splashColor: AppColor.meat,
                          borderRadius: BorderRadius.circular(30),
                          onTap: widget.amount > 0
                              ? () {
                                  setState(() {
                                    widget.amount--;
                                    widget.cost =
                                        (widget.prices * widget.amount);
                                  });
                                }
                              : null,
                          child: const Icon(
                            Icons.remove_circle_outline,
                            size: 50.0,
                            color: AppColor.meat,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.amount.toString(),
                                    style: const TextStyle(fontSize: 40.0),
                                  ),
                                  const TextSpan(
                                    text: ' ons',
                                    style: TextStyle(fontSize: 30.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          splashColor: AppColor.mainColor,
                          onTap: widget.amount < 20
                              ? () {
                                  setState(() {
                                    widget.amount++;
                                    widget.cost = widget.prices * widget.amount;
                                  });
                                }
                              : null,
                          child: const Icon(
                            Icons.add_circle_outline,
                            size: 50.0,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Unit '),
                        TextSpan(
                          text: 'Ons ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Max.20 ',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // button add to cart
            ThemeButton(
                label: 'Add to Cart',
                onClick: () {
                  Notif.onProgress(context);
                }),

            // button navigate to MapPage();
            ThemeButton(
              label: 'Product location',
              color: AppColor.darkGreen,
              colorBorder: AppColor.mainColor,
              onClick: () {
                Notif.onProgress(context);
              },
            )
          ],
        ),
      ),
    );
  }

  // root code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // header background
          _headerBackground(),

          // details product
          _detailProduct()
        ],
      ),
    );
  }
}
