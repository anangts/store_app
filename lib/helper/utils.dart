import 'package:store_app/helper/appcolor.dart';
import 'package:store_app/models/category.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:store_app/models/categorypart.dart';
import 'package:store_app/models/onboarding.dart';
import 'package:store_app/models/subcategory.dart';

class Utils {
  static List<OnBoarding> getOnboarding() {
    return [
      OnBoarding(title: "welcome to our app", image: 'onboard1'),
      OnBoarding(title: 'having experience with us', image: 'onboard2'),
      OnBoarding(title: 'lets start your journey', image: 'onboard3'),
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
              imgName: 'meat5',
              part: [
                CategoryPart(
                    name: 'Shoulder', imgName: 'goat1', isSelected: false),
                CategoryPart(name: 'Neck', imgName: 'goat2', isSelected: false),
                CategoryPart(name: 'Ribs', imgName: 'goat3', isSelected: false),
                CategoryPart(name: 'Loin', imgName: 'goat4', isSelected: false),
                CategoryPart(name: 'Leg', imgName: 'goat5', isSelected: false),
              ]),
          SubCategory(
              name: 'Rabbit',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'meat6',
              part: [
                CategoryPart(
                    name: 'Breast', imgName: 'rab1', isSelected: false),
                CategoryPart(name: 'Full', imgName: 'rab2', isSelected: false),
              ]),
        ],
      ),
      Category(
        color: AppColor.fruits,
        name: "Fruit",
        imgName: "category2",
        iconName: IcoFontIcons.avocado,
        subCategory: [
          SubCategory(
              name: 'Banana',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'fruit1',
              part: [
                CategoryPart(
                    name: 'Banana', imgName: 'fruit1', isSelected: false),
              ]),
          SubCategory(
              name: 'Grape',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'fruit2',
              part: [
                CategoryPart(
                    name: 'Grape', imgName: 'fruit2', isSelected: false),
              ]),
          SubCategory(
              name: 'Apple',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'fruit3',
              part: [
                CategoryPart(
                    name: 'Apple', imgName: 'fruit3', isSelected: false),
              ]),
          SubCategory(
              name: 'Orange',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'fruit4',
              part: [
                CategoryPart(
                    name: 'Orange', imgName: 'fruit4', isSelected: false),
              ]),
        ],
      ),
      Category(
        color: AppColor.vegs,
        name: "Vegetables",
        imgName: "category3",
        iconName: IcoFontIcons.broccoli,
        subCategory: [
          SubCategory(
              name: 'Cabbage',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'veg1',
              part: [
                CategoryPart(
                    name: 'Cabbage', imgName: 'veg1', isSelected: false),
              ]),
          SubCategory(
              name: 'Brocolli',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'veg2',
              part: [
                CategoryPart(
                    name: 'Brocolli', imgName: 'veg2', isSelected: false),
              ]),
          SubCategory(
              name: 'Carrot',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'veg3',
              part: [
                CategoryPart(
                    name: 'Carrot', imgName: 'veg3', isSelected: false),
              ]),
          SubCategory(
              name: 'Tomato',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'veg4',
              part: [
                CategoryPart(
                    name: 'Tomato', imgName: 'veg4', isSelected: false),
              ]),
        ],
      ),
      Category(
        color: AppColor.seeds,
        name: "Seeds",
        imgName: "category4",
        iconName: IcoFontIcons.cropPlant,
        subCategory: [
          SubCategory(
              name: 'Almond',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'seed1',
              part: [
                CategoryPart(
                    name: 'Almond', imgName: 'seed1', isSelected: false),
              ]),
          SubCategory(
              name: 'Hazelnut',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'seed2',
              part: [
                CategoryPart(
                    name: 'Hazelnut', imgName: 'seed2', isSelected: false),
              ]),
          SubCategory(
              name: 'Walnut',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'seed3',
              part: [
                CategoryPart(
                    name: 'Walnut', imgName: 'seed3', isSelected: false),
              ]),
          SubCategory(
              name: 'Peanut',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'seed4',
              part: [
                CategoryPart(
                    name: 'Peanut', imgName: 'seed4', isSelected: false),
              ]),
        ],
      ),
      Category(
        color: AppColor.pastries,
        name: "Cakes",
        imgName: "category5",
        iconName: IcoFontIcons.cupCake,
        subCategory: [
          SubCategory(
              name: 'Chiffon',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'cake1',
              part: [
                CategoryPart(
                    name: 'Chiffon', imgName: 'cake1', isSelected: false),
              ]),
          SubCategory(
              name: 'Brownis',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'cake2',
              part: [
                CategoryPart(
                    name: 'Brownis', imgName: 'cake2', isSelected: false),
              ]),
          SubCategory(
              name: 'Apple Pie',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'cake3',
              part: [
                CategoryPart(
                    name: 'Apple Pie', imgName: 'cake3', isSelected: false),
              ]),
          SubCategory(
              name: 'Tiramisu',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'cake4',
              part: [
                CategoryPart(
                    name: 'Tiramisu', imgName: 'cake4', isSelected: false),
              ]),
        ],
      ),
      Category(
        color: AppColor.spices,
        name: "Spices",
        imgName: "category6",
        iconName: IcoFontIcons.pepper,
        subCategory: [
          SubCategory(
              name: 'Cinnamon',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'spice1',
              part: [
                CategoryPart(
                    name: 'Cinnamon', imgName: 'spice1', isSelected: false),
              ]),
          SubCategory(
              name: 'Black Pepper',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'spice2',
              part: [
                CategoryPart(
                    name: 'Black Pepper', imgName: 'spice2', isSelected: false),
              ]),
          SubCategory(
              name: 'Onion Powder',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'spice3',
              part: [
                CategoryPart(
                    name: 'Onion Powder', imgName: 'spice3', isSelected: false),
              ]),
          SubCategory(
              name: 'Garlic powder',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'spice4',
              part: [
                CategoryPart(
                    name: 'Garlic Powder',
                    imgName: 'spice4',
                    isSelected: false),
              ]),
          SubCategory(
              name: 'Ginger',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'spice5',
              part: [
                CategoryPart(
                    name: 'Ginger', imgName: 'spice5', isSelected: false),
              ]),
          SubCategory(
              name: 'Nutmeg',
              icon: IcoFontIcons.steak,
              color: AppColor.meat,
              imgName: 'spice6',
              part: [
                CategoryPart(
                    name: 'Nutmeg', imgName: 'spice6', isSelected: false),
              ]),
        ],
      ),
    ];
  }
}
