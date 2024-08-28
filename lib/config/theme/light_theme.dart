import 'package:flutter/material.dart';

import '../../core/resources/resources.dart';

ThemeData lightTheme(BuildContext context) {
  bool isAr = true;

  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.white,

    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      surfaceTint: AppColors.white,
    ),

    /// Bottom sheet
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.white),

    /// Appbar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: AppSize.s0,
      scrolledUnderElevation: AppSize.s0,
    ),

    /// Progress indicator theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.primary),

    /// Icon theme
    iconTheme: const IconThemeData(color: AppColors.black),

    /// Text fields
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.black,
      hintStyle: TextStyle(
        color: AppColors.black.withOpacity(0.4),
        fontSize: FontSize.s14,
        height: 1,
        fontWeight: FontWeightManager.regular,
        fontFamily: FontConstants.fontFamily,
      ),
      contentPadding: const EdgeInsets.all(AppPadding.p16),
      errorStyle: TextStyle(
        fontSize: FontSize.s10,
        color: AppColors.primary,
        fontFamily: FontConstants.fontFamily,
      ),
      errorMaxLines: 5,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSize.s24),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSize.s24),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSize.s24),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSize.s24),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSize.s24),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSize.s24),
      ),
    ),
  );
}
