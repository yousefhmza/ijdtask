import 'package:flutter/material.dart';
import 'package:ijdtask/modules/home/models/category_model.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s72,
      width: AppSize.s52,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImage(
            image: category.image,
            width: AppSize.s36,
            height: AppSize.s36,
            fit: BoxFit.contain,
          ),
          const VerticalSpace(AppSize.s6),
          CustomText(
            category.nameAr,
            maxLines: 1,
            fontWeight: FontWeightManager.bold,
            fontSize: FontSize.s12,
          )
        ],
      ),
    );
  }
}
