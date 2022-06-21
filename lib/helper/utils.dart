import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/models/category.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:store_app/models/categorypart.dart';
import 'package:store_app/models/onboarding.dart';
import 'package:store_app/models/subcategory.dart';

class Utils {
  static List<OnBoarding> getOnboarding() {
    return [
      OnBoarding(message: "welcome to our app", img: 'onboard1'),
      OnBoarding(message: 'having experience with us', img: 'onboard2'),
      OnBoarding(message: 'lets start your journey', img: 'onboard3'),
    ];
  }

  static List<Category> getMockedCategories() {
    return [
      Category(
        color: AppColor.meat,
        name: "Meat",
        imgName: "category1",
        iconName: IcoFontIcons.steak,
        subCategory: [
          SubCategory(
            name: 'Pork',
            icon: IcoFontIcons.steak,
            color: AppColor.meat,
            imgName: 'meat1',
            part: [
              CategoryPart(name: 'Ribs', imgName: 'pork1', isSelected: false),
              CategoryPart(name: 'Belly', imgName: 'pork2', isSelected: false),
              CategoryPart(name: 'Skin', imgName: 'pork3', isSelected: false),
              CategoryPart(name: 'Ham', imgName: 'pork4', isSelected: false),
              CategoryPart(name: 'Leg', imgName: 'pork5', isSelected: false),
            ],
          ),
          SubCategory(
              name: 'Cow',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'meat2',
              part: [
                CategoryPart(
                    name: 'sirloin', imgName: 'cow1', isSelected: false),
                CategoryPart(
                    name: 'Terderloin', imgName: 'cow2', isSelected: false),
                CategoryPart(name: 'Ribs', imgName: 'cow3', isSelected: false),
                CategoryPart(name: 'Tbon', imgName: 'cow4', isSelected: false),
                CategoryPart(
                    name: 'Sengkel', imgName: 'cow5', isSelected: false),
              ]),
          SubCategory(
              name: 'Chicken',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'meat3',
              part: [
                CategoryPart(
                    name: 'Breast', imgName: 'chic1', isSelected: false),
                CategoryPart(
                    name: 'wings', imgName: 'chic2', isSelected: false),
                CategoryPart(
                    name: 'Top leg', imgName: 'chic3', isSelected: false),
                CategoryPart(name: 'head', imgName: 'chic4', isSelected: false),
                CategoryPart(name: 'leg', imgName: 'chic5', isSelected: false),
              ]),
          SubCategory(
              name: 'Duck',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'meat4',
              part: [
                CategoryPart(name: 'Leg', imgName: 'duck1', isSelected: false),
                CategoryPart(
                    name: 'peking', imgName: 'duck2', isSelected: false),
                CategoryPart(
                    name: 'Breast', imgName: 'duck3', isSelected: false),
                CategoryPart(name: 'full', imgName: 'duck4', isSelected: false),
              ]),
          SubCategory(
              name: 'Goat',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'meat5'),
          SubCategory(
              name: 'Rabbit',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'meat6'),
        ],
      ),
      Category(
        color: AppColor.fruits,
        name: "Fruit",
        imgName: "category2",
        iconName: IcoFontIcons.avocado,
        subCategory: [],
      ),
      Category(
        color: AppColor.vegs,
        name: "Vegetables",
        imgName: "category3",
        iconName: IcoFontIcons.broccoli,
        subCategory: [],
      ),
      Category(
        color: AppColor.seeds,
        name: "Seeds",
        imgName: "category4",
        iconName: IcoFontIcons.cropPlant,
        subCategory: [],
      ),
      Category(
        color: AppColor.pastries,
        name: "Cakes",
        imgName: "category5",
        iconName: IcoFontIcons.cupCake,
        subCategory: [],
      ),
      Category(
        color: AppColor.spices,
        name: "Spices",
        imgName: "category6",
        iconName: IcoFontIcons.pepper,
        subCategory: [],
      ),
    ];
  }
}
