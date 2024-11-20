part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class CategoriesLoadingState extends HomeState {}

class CategoriesLoadedState extends HomeState {
  final List<CategoryModel> categories;

  CategoriesLoadedState(this.categories);
}

class CategoriesErrorState extends HomeState {
  final String error;

  CategoriesErrorState(this.error);
}
