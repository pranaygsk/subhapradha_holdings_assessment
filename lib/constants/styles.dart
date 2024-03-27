import 'package:flutter/material.dart';

import 'my_colors.dart';

class Styles {
  static TextStyle btnTextStyle =
      const TextStyle(color: MyColors.textColor, fontWeight: FontWeight.bold);
  static TextStyle appBarTextStyle = TextStyle(
    color: Colors.blue.shade500,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static TextStyle headingTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static TextStyle biggerHeadingBlue = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: Colors.blue
  );
  static TextStyle biggerHeadingBlack = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: Colors.black
  );
}
