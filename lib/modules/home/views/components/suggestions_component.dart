import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ijdtask/core/resources/resources.dart';
import 'package:ijdtask/core/view/views.dart';
import 'package:ijdtask/modules/home/cubits/home_cubit.dart';
import 'package:ijdtask/modules/home/views/components/suggestions_loading_shimmer.dart';
import 'package:ijdtask/modules/home/views/widgets/suggestion_item.dart';

import '../../../../core/utils/alerts.dart';

class SuggestionsComponent extends StatefulWidget {
  const SuggestionsComponent({super.key});

  @override
  State<SuggestionsComponent> createState() => _SuggestionsComponentState();
}

class _SuggestionsComponentState extends State<SuggestionsComponent> {
  late final HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = BlocProvider.of<HomeCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is GetSuggestionsFailureState) {
          Alerts.showSnackBar(context, message: state.failure.message, onActionPressed: homeCubit.getSuggestions);
        }
      },
      builder: (context, state) {
        if (state is GetSuggestionsLoadingState) return const SuggestionsLoadingShimmer();
        if (state is GetSuggestionsFailureState) {
          return const SizedBox.shrink();
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
              child: Row(
                children: [
                  CustomIcon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.primary,
                    size: AppSize.s18,
                  ),
                  HorizontalSpace(AppSize.s6),
                  CustomText(
                    AppStrings.specialSuggestions,
                    fontSize: FontSize.s16,
                    fontWeight: FontWeightManager.bold,
                  ),
                ],
              ),
            ),
            const VerticalSpace(AppSize.s14),
            SizedBox(
              height: AppSize.s210,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                itemBuilder: (context, index) => SuggestionItem(homeCubit.suggestions[index]),
                separatorBuilder: (context, index) => const HorizontalSpace(AppSize.s12),
                itemCount: homeCubit.suggestions.length,
              ),
            )
          ],
        );
      },
    );
  }
}
