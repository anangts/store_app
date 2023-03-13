import 'package:flutter/material.dart';

import 'package:store_app/firebase/auth.dart';
import 'package:store_app/pages/categorylistpage.dart';
import 'package:store_app/pages/welcomepage.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  //late SubCategory subCategory;
  //final List<SubCategory> subcategories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChange,
      builder: (context, snapshot) {
        return snapshot.hasData ? CategoryListPage() : const WelcomePage();
      },
    );
  }
}
