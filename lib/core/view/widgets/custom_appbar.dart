import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/resources.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final bool showDefaultBackButton;
  final Widget? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Color? bgColor;
  final Widget? flexibleSpace;
  final bool isDarkStatusBar;
  final double elevation;
  final double? titleSpacing;
  final double? toolbarHeight;
  final bool darkTint;

  const CustomAppbar({
    this.leading,
    this.showDefaultBackButton = true,
    this.title,
    this.actions,
    this.bottom,
    this.bgColor,
    this.flexibleSpace,
    this.titleSpacing,
    this.toolbarHeight,
    this.darkTint = false,
    this.centerTitle = true,
    this.isDarkStatusBar = false,
    this.elevation = AppSize.s0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      automaticallyImplyLeading: showDefaultBackButton,
      actions: actions != null
          ? [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: AppPadding.p16),
                child: Center(child: Row(children: actions!)),
              ),
            ]
          : null,
      backgroundColor: bgColor,
      titleSpacing: titleSpacing,
      elevation: elevation,
      centerTitle: centerTitle,
      flexibleSpace: flexibleSpace,
      toolbarHeight: toolbarHeight,
      iconTheme: IconThemeData(color: darkTint ? AppColors.black : AppColors.white),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppSize.s16))),
      bottom: bottom,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: isDarkStatusBar ? Brightness.dark : Brightness.light,
        statusBarBrightness: isDarkStatusBar ? Brightness.light : Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
