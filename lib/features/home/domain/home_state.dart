part of 'home_bloc.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<CategoryModel> categories;
  final List<DiscountModel> discounts;
  final List<ProductsModel> products;

  HomeLoadedState(this.categories, this.discounts, this.products);
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);
}
