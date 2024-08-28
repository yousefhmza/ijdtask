import 'package:flutter/material.dart';
import 'package:ijdtask/core/view/views.dart';

import '../../../../core/resources/resources.dart';

class SuggestionsLoadingShimmer extends StatelessWidget {
  const SuggestionsLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: ShimmerWidget.rectangular(
            height: AppSize.s22,
            width: AppSize.s190,
            borderRadius: AppSize.s210,
          ),
        ),
        const VerticalSpace(AppSize.s14),
        SizedBox(
          height: AppSize.s210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            itemBuilder: (context, index) => ShimmerWidget.rectangular(
              height: AppSize.s210,
              width: AppSize.s190,
            ),
            separatorBuilder: (context, index) => const HorizontalSpace(AppSize.s12),
            itemCount: 2,
          ),
        )
      ],
    );
  }
}
