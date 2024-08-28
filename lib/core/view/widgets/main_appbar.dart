import 'package:flutter/material.dart';

import '../views.dart';
import '../../resources/resources.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Color? bgColor;
  final bool darkTint;
  final List<Widget>? actions;

  const MainAppbar({required this.title, this.leading, this.actions, this.darkTint = false, this.bgColor, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      leading: leading,
      showDefaultBackButton: true,
      actions: actions,
      bgColor: bgColor,
      darkTint: darkTint,
      isDarkStatusBar: darkTint,
      title: CustomText(
        title,
        fontSize: FontSize.s18,
        fontWeight: FontWeightManager.semiBold,
        color: AppColors.white,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
