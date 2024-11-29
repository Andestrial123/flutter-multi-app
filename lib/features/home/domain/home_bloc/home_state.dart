part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<CategoryModel>? categories;
  final List<DiscountModel>? discounts;

  HomeLoadedState({this.categories = const [], this.discounts = const []});
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);
}
