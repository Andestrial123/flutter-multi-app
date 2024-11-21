import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/shared/service/api/api.dart';
import 'package:flutter_multi_app/shared/service/api/model/category_model.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ApiClient apiClient;

  CategoryBloc(this.apiClient) : super(CategoryInitial()) {
    on<GetCategoriesEvent>(_getCategories);
  }

  Future<void> _getCategories(
      GetCategoriesEvent event, Emitter<CategoryState> emit) async {
    emit(CategoriesLoadingState());
    try {
      final categories = await apiClient.getCategories();
      emit(CategoriesLoadedState(categories));
    } catch (e) {
      emit(CategoriesErrorState(e.toString()));
    }
  }
}
