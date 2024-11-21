part of 'category_bloc.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoriesLoadingState extends CategoryState {}

class CategoriesLoadedState extends CategoryState {
  final List<CategoryModel> categories;

  CategoriesLoadedState(this.categories);
}

class CategoriesErrorState extends CategoryState {
  final String error;

  CategoriesErrorState(this.error);
}
