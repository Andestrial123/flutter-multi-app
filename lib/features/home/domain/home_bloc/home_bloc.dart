import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/shared/service/api/api.dart';
import 'package:flutter_multi_app/shared/service/api/model/category_model.dart';

import '../../../../shared/service/api/model/discount_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiClient apiClient;

  HomeBloc(this.apiClient) : super(HomeInitialState()) {
    on<HomeInitialEvent>(_init);
  }

  Future<void> _init(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final response = await (
        apiClient.getCategories(),
        apiClient.getDiscounts(),
      ).wait;

      final categories = response.$1;
      final discounts = response.$2;

      emit(HomeLoadedState(categories: categories, discounts: discounts));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
