import 'package:flutter/material.dart';
import 'package:store_app/models/subcategory.dart';

// ignore: must_be_immutable
class CategoryPartList extends StatefulWidget {
  SubCategory subCategory;
  CategoryPartList({required this.subCategory, Key? key}) : super(key: key);

  @override
  State<CategoryPartList> createState() => _CategoryPartListState();
}

class _CategoryPartListState extends State<CategoryPartList> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                setState(
                  () {
                    for (var e in widget.subCategory.categorypart!) {
                      e.isSelected =
                          widget.subCategory.categorypart![index] == e;
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
                      border: widget.subCategory.categorypart![index].isSelected
                          ? Border.all(
                              color: widget.subCategory.color!, width: 6.0)
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
                      widget.subCategory.categorypart![index].name.toString(),
                      style: TextStyle(color: widget.subCategory.color),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
