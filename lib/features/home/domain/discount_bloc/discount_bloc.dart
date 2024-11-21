import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/shared/service/api/api.dart';
import 'package:flutter_multi_app/shared/service/api/model/discount_model.dart';

part 'discount_event.dart';

part 'discount_state.dart';

class DiscountBloc extends Bloc<DiscountEvent, DiscountState> {
  final ApiClient apiClient;

  DiscountBloc(this.apiClient) : super(DiscountInitial()) {
    on<GetDiscountsEvent>(_getDiscounts);
  }

  Future<void> _getDiscounts(
      GetDiscountsEvent event, Emitter<DiscountState> emit) async {
    emit(DiscountsLoadingState());
    try {
      final discounts = await apiClient.getDiscounts();
      emit(DiscountsLoadedState(discounts));
    } catch (e) {
      emit(DiscountsErrorState(e.toString()));
    }
  }
}
