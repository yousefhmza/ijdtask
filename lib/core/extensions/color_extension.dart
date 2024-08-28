import 'package:flutter/material.dart';

import '../resources/resources.dart';
import '../utils/alerts.dart';

extension HexColor on String {
  Color toColor() {
    try {
      String hexString = replaceFirst('#', '');
      if (hexString.length == 6) hexString = 'FF$hexString';
      if (hexString.length != 8) throw const FormatException("Invalid hex color");
      return Color(int.parse(hexString, radix: 16));
    } on Exception catch (e) {
      Alerts.showToast(e.toString());
      return AppColors.transparent;
    }
  }
}
