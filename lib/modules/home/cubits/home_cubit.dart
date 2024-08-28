import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ijdtask/modules/home/models/category_model.dart';
import 'package:ijdtask/modules/home/models/suggestion_model.dart';
import 'package:ijdtask/modules/home/repositories/home_repository.dart';
import 'package:ijdtask/modules/home/views/screens/home.dart';

import '../../../core/services/error/failure.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeInitialState());

  List<Suggestion> suggestions = [];
  List<CategoryModel> categories = [];

  int currentIndex = 0;
  final PageController pageController = PageController();
  final List<Widget> screens = const [
    Home(),
    SizedBox.shrink(),
    SizedBox.shrink(),
    SizedBox.shrink(),
    SizedBox.shrink(),
  ];

  void setCurrentIndex(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    FocusManager.instance.primaryFocus?.unfocus();
    emit(HomeSetIndexState());
  }

  Future<void> getCategories() async {
    categories.clear();
    emit(GetCategoriesLoadingState());
    final result = await _homeRepository.getCategories();
    result.fold(
      (failure) => emit(GetCategoriesFailureState(failure)),
      (categories) {
        this.categories = categories;
        emit(GetCategoriesSuccessState(categories));
      },
    );
  }

  Future<void> getSuggestions() async {
    suggestions.clear();
    emit(GetSuggestionsLoadingState());
    final result = await _homeRepository.getSuggestions();
    result.fold(
      (failure) => emit(GetSuggestionsFailureState(failure)),
      (suggestions) {
        this.suggestions = suggestions;
        emit(GetSuggestionsSuccessState(suggestions));
      },
    );
  }
}
