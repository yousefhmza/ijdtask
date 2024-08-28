import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/resources.dart';
import '../view/views.dart';

class Alerts {
  static void showSnackBar(
    BuildContext context, {
    required String message,
    String? actionText,
    VoidCallback? onActionPressed,
    Duration? duration,
    bool forError = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration ?? (onActionPressed == null ? Time.t3s : Time.longTime),
        backgroundColor: forError ? AppColors.primary : Colors.grey,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(AppPadding.p16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12)),
        action: onActionPressed == null
            ? null
            : SnackBarAction(
                label: actionText ?? AppStrings.retry,
                onPressed: onActionPressed,
                textColor: AppColors.white,
              ),
        content: CustomText(message, color: AppColors.white),
      ),
    );
  }

  static void showToast(
    String message, [
    Toast length = Toast.LENGTH_SHORT,
    ToastGravity toastGravity = ToastGravity.BOTTOM,
  ]) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: toastGravity,
      timeInSecForIosWeb: 3,
      fontSize: FontSize.s14,
    );
  }
}
