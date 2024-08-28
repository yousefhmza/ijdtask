import 'package:flutter/material.dart';
import 'package:ijdtask/core/resources/resources.dart';
import 'package:ijdtask/core/view/views.dart';
import 'package:ijdtask/modules/home/models/suggestion_model.dart';

class SuggestionItem extends StatelessWidget {
  final Suggestion suggestion;

  const SuggestionItem(this.suggestion, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s210,
      width: AppSize.s190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(
            image: suggestion.mainImage,
            width: double.infinity,
            height: AppSize.s120,
            borderRadius: AppSize.s12,
          ),
          const VerticalSpace(AppSize.s8),
          Row(
            children: [
              Expanded(
                child: CustomText(
                  suggestion.nameAr,
                  maxLines: 2,
                  fontWeight: FontWeightManager.bold,
                  autoSized: true,
                ),
              ),
              const HorizontalSpace(AppSize.s4),
              Container(
                padding: const EdgeInsets.all(AppPadding.p4),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppSize.s6),
                ),
                child: CustomText(
                  suggestion.averageRating.toStringAsFixed(1),
                  fontSize: FontSize.s12,
                  color: AppColors.white,
                ),
              )
            ],
          ),
          const VerticalSpace(AppSize.s2),
          CustomText(
            suggestion.address,
            color: AppColors.secondaryLabel,
            maxLines: 1,
            fontSize: FontSize.s8,
          ),
          const VerticalSpace(AppSize.s4),
          Row(
            children: [
              CustomText(
                "${suggestion.price.toStringAsFixed(2)} ${AppStrings.sar} ",
                fontWeight: FontWeightManager.bold,
              ),
              CustomText(
                AppStrings.perNight,
                color: AppColors.secondaryLabel,
                fontWeight: FontWeightManager.bold,
                fontSize: FontSize.s10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
