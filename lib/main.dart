// ignore_for_file: unused_import, duplicate_ignore

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:store_app/firebase/wrapper.dart';
import 'package:store_app/firebase_options.dart';
// ignore: unused_import
import 'package:store_app/helper/utils.dart';
// ignore: unused_import
import 'package:store_app/pages/details_page.dart';
import 'package:store_app/pages/map_page.dart';
import 'package:store_app/pages/onboarding_page.dart';
// ignore: unused_import
import 'package:store_app/pages/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Wrapper(),
      ),
    );
  }
}
