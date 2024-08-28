import 'package:flutter/material.dart';

class Responsive {
  static double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
}
