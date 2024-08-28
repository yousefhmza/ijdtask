part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeSetIndexState extends HomeStates {}

class GetSuggestionsLoadingState extends HomeStates {}

class GetSuggestionsFailureState extends HomeStates {
  final Failure failure;

  GetSuggestionsFailureState(this.failure);
}

class GetSuggestionsSuccessState extends HomeStates {
  final List<Suggestion> suggestions;

  GetSuggestionsSuccessState(this.suggestions);
}

class GetCategoriesLoadingState extends HomeStates {}

class GetCategoriesFailureState extends HomeStates {
  final Failure failure;

  GetCategoriesFailureState(this.failure);
}

class GetCategoriesSuccessState extends HomeStates {
  final List<CategoryModel> categories;

  GetCategoriesSuccessState(this.categories);
}
