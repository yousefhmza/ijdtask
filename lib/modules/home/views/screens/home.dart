import 'package:flutter/material.dart';
import 'package:ijdtask/core/resources/resources.dart';
import 'package:ijdtask/core/view/views.dart';
import 'package:ijdtask/modules/home/views/components/categories_component.dart';
import 'package:ijdtask/modules/home/views/components/suggestions_component.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: AppSize.s120,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppSize.s12),
              ),
              margin: EdgeInsets.all(AppPadding.p16),
            ),
            const SuggestionsComponent(),
            const VerticalSpace(AppSize.s22),
            const CategoriesComponent(),
          ],
        ),
      ),
    );
  }
}
