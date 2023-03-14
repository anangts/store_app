import 'package:flutter/material.dart';

class Notif {
  static onProgress(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        content: Center(child: Text('on progress developing'))));
  }
}
