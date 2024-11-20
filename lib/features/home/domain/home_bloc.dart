import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/firebase_service.dart';
import 'package:flutter_multi_app/shared/service/api/api.dart';
import 'package:flutter_multi_app/shared/service/api/model/category_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiClient apiClient;
  final FirebaseService _firebaseService;

  HomeBloc(this.apiClient, this._firebaseService) : super(HomeInitial()) {
    on<GetCategoriesEvent>(_getCategories);
  }

  Future<void> _getCategories(
      GetCategoriesEvent event, Emitter<HomeState> emit) async {
    emit(CategoriesLoadingState());
    try {
      if (_firebaseService.currentUser != null) {
        final categories = await apiClient.getCategories();
        emit(CategoriesLoadedState(categories));
      } else {
        emit(HomeInitial());
      }
    } catch (e) {
      emit(CategoriesErrorState(e.toString()));
    }
  }
}
