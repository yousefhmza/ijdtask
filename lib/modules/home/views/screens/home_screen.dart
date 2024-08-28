import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ijdtask/core/resources/resources.dart';
import 'package:ijdtask/modules/home/cubits/home_cubit.dart';
import 'package:ijdtask/modules/home/views/components/home_bnb.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit homeCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = BlocProvider.of<HomeCubit>(context);
    homeCubit.getCategories();
    homeCubit.getSuggestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: BlocProvider.of<HomeCubit>(context).pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: BlocProvider.of<HomeCubit>(context).screens.length,
            itemBuilder: (context, index) => BlocProvider.of<HomeCubit>(context).screens[index],
          ),
          const HomeBNB(),
        ],
      ),
    );
  }
}
