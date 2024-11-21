part of 'discount_bloc.dart';

abstract class DiscountState {}

class DiscountInitial extends DiscountState {}

class DiscountsLoadingState extends DiscountState {}

class DiscountsLoadedState extends DiscountState {
  final List<DiscountModel> discounts;

  DiscountsLoadedState(this.discounts);
}

class DiscountsErrorState extends DiscountState {
  final String error;

  DiscountsErrorState(this.error);
}
