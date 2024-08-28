import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class BNBItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final IconData icon;
  final VoidCallback onTap;

  const BNBItem({
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentIndex == index;
    return InkWell(
      onTap: onTap,
      child: CustomIcon(icon, color: isSelected ? AppColors.primary : AppColors.bnbIcon,size: AppSize.s28),
    );
  }
}
