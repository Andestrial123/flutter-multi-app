import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_multi_app/shared/service/api/api.dart';
import 'package:flutter_multi_app/shared/service/api/model/category_model.dart';
import 'package:flutter_multi_app/shared/service/api/model/discount_model.dart';
import 'package:flutter_multi_app/shared/service/api/model/products_model.dart';

part 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiClient apiClient;

  HomeBloc(this.apiClient) : super(HomeInitial()) {
    on<LoadCategoriesEvent>(_onLoadHomeDetails);
  }

  Future<void> _onLoadHomeDetails(LoadCategoriesEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final categories = await apiClient.getCategories();
      final discounts = await apiClient.getDiscounts();
       List<ProductsModel> prod = [];
      final defaultCategory = categories.firstWhere(
            (category) => category.initial == true,
        orElse: () => categories.first
      );
      print('Default category is : ${defaultCategory.initial}');
      if(defaultCategory.initial == true){
        final products = await apiClient.getProducts(defaultCategory.id);
        prod = products;
      }
       else{
         prod = [];
      }
      emit(HomeLoadedState(categories,discounts,prod));
    } catch (error) {
      emit(HomeErrorState(error.toString()));
    }
  }
}

