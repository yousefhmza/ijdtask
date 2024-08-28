import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ijdtask/core/resources/resources.dart';
import 'package:ijdtask/modules/home/views/components/categories_loading_shimmer.dart';
import 'package:ijdtask/modules/home/views/widgets/category_item.dart';

import '../../../../core/utils/alerts.dart';
import '../../../../core/view/views.dart';
import '../../cubits/home_cubit.dart';

class CategoriesComponent extends StatefulWidget {
  const CategoriesComponent({super.key});

  @override
  State<CategoriesComponent> createState() => _CategoriesComponentState();
}

class _CategoriesComponentState extends State<CategoriesComponent> {
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
        if (state is GetCategoriesFailureState) {
          Alerts.showSnackBar(context, message: state.failure.message, onActionPressed: homeCubit.getCategories);
        }
      },
      builder: (context, state) {
        if (state is GetCategoriesLoadingState) {
          return const CategoriesLoadingShimmer();
        }
        if (state is GetCategoriesFailureState) return const SizedBox.shrink();

        return Container(
          padding: EdgeInsets.symmetric(vertical: AppPadding.p8),
          decoration: BoxDecoration(color: AppColors.white),
          child: SizedBox(
            height: AppSize.s72,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
              itemBuilder: (context, index) => CategoryItem(homeCubit.categories[index]),
              separatorBuilder: (context, index) => const HorizontalSpace(AppSize.s28),
              itemCount: homeCubit.categories.length,
            ),
          ),
        );
      },
    );
  }
}
