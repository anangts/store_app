// import 'package:flutter/material.dart';
// import 'package:store_app/helper/appcolor.dart';
// import 'package:store_app/models/category.dart';
// import 'package:store_app/models/subcategory.dart';
// import '../helper/utils.dart';

// // ignore: must_be_immutable
// class UnitPrice extends StatefulWidget {
//   int amount = 0;
//   double price = 15.0;
//   double cost = 0.0;
//   SubCategory subCategory;
//   UnitPrice(
//     BuildContext context, {
//     required this.subCategory,
//     Key? key,
//   }) : super(key: key);
//   final List<Category> categories = Utils.getMockedCategories();

//   @override
//   State<UnitPrice> createState() => _UnitPriceState();
// }

// class _UnitPriceState extends State<UnitPrice> {
//   @override
//   Widget build(BuildContext context) {
//     return   Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(top: 15, bottom: 10),
//             child: Text.rich(
//               TextSpan(
//                 children: [
//                   TextSpan(text: 'Unit '),
//                   TextSpan(
//                     text: 'Ons ',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   TextSpan(
//                     text: 'Max.20 ',
//                     style: TextStyle(fontSize: 12),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           //incremen decremen
//           Container(
//             padding: const EdgeInsets.all(10),
//             margin: const EdgeInsets.only(left: 20.0, right: 20.0),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(40.0),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: 10.0,
//                   offset: Offset.zero,
//                   color: Colors.black.withOpacity(0.1),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: widget.amount > 0
//                       ? () {
//                           setState(() {
//                             widget.amount--;
//                             widget.cost = widget.price * widget.amount;
//                           });
//                         }
//                       : null,
//                   child: const Icon(
//                     Icons.remove_circle_outline,
//                     size: 50.0,
//                     color: AppColor.meat,
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 5.0),
//                     child: Center(
//                       child: Text.rich(
//                         TextSpan(
//                           children: [
//                             TextSpan(
//                               text: widget.amount.toString(),
//                               style: const TextStyle(fontSize: 40.0),
//                             ),
//                             const TextSpan(
//                               text: ' ons',
//                               style: TextStyle(fontSize: 30.0),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: widget.amount < 20
//                       ? () {
//                           setState(
//                             () {
//                               widget.amount++;
//                               widget.cost = widget.price * widget.amount;
//                             },
//                           );
//                         }
//                       : null,
//                   child: const Icon(
//                     Icons.add_circle_outline,
//                     size: 50.0,
//                     color: Colors.green,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text.rich(
//                   TextSpan(
//                     children: [
//                       const TextSpan(text: 'Price '),
//                       TextSpan(
//                         text:
//                             '\$${widget.subCategory.categorypart![index].price} /ons',
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   '\$${widget.cost}',
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//         ],
      
//     );
//   }
// }
