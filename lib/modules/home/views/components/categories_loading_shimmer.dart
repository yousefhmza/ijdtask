import 'package:flutter/material.dart';
import 'package:ijdtask/core/view/views.dart';

import '../../../../core/resources/resources.dart';

class CategoriesLoadingShimmer extends StatelessWidget {
  const CategoriesLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p8),
      decoration: BoxDecoration(color: AppColors.white),
      child: SizedBox(
        height: AppSize.s72,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          itemBuilder: (context, index) => ShimmerWidget.rectangular(height: AppSize.s72, width: AppSize.s52),
          separatorBuilder: (context, index) => const HorizontalSpace(AppSize.s28),
          itemCount: 3,
        ),
      ),
    );
  }
}
