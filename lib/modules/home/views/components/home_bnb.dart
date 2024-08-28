import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ijdtask/modules/home/cubits/home_cubit.dart';

import '../../../../core/resources/resources.dart';
import '../widgets/bnb_item.dart';

class HomeBNB extends StatelessWidget {
  const HomeBNB({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: AppPadding.p16, horizontal: AppPadding.p24),
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p32, vertical: AppPadding.p12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSize.s210),
          boxShadow: const [
            BoxShadow(color: AppColors.shadow, blurRadius: AppSize.s10, spreadRadius: AppSize.s0, offset: Offset(0, 0))
          ],
        ),
        child: BlocBuilder<HomeCubit, HomeStates>(
          buildWhen: (prevState, state) => state is HomeSetIndexState,
          builder: (context, state) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BNBItem(
                index: 0,
                currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
                icon: Icons.search,
                onTap: () => BlocProvider.of<HomeCubit>(context).setCurrentIndex(0),
              ),
              BNBItem(
                index: 1,
                currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
                icon: Icons.calendar_month,
                onTap: () => BlocProvider.of<HomeCubit>(context).setCurrentIndex(1),
              ),
              BNBItem(
                index: 2,
                currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
                icon: Icons.favorite,
                onTap: () => BlocProvider.of<HomeCubit>(context).setCurrentIndex(2),
              ),
              BNBItem(
                index: 3,
                currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
                icon: Icons.chat,
                onTap: () => BlocProvider.of<HomeCubit>(context).setCurrentIndex(3),
              ),
              BNBItem(
                index: 4,
                currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
                icon: Icons.supervised_user_circle_rounded,
                onTap: () => BlocProvider.of<HomeCubit>(context).setCurrentIndex(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
