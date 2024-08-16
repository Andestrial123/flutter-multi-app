import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_app/features/google_maps/data/marks_model.dart';
import 'package:flutter_multi_app/shared/service/api/api.dart';
import 'package:timezone/timezone.dart' as tz;


part 'google_maps_event.dart';
part 'google_maps_state.dart';

class GoogleMapsBloc extends Bloc<GoogleMapsEvent, GoogleMapsState> {
  final ApiClient apiClient;

  GoogleMapsBloc(this.apiClient) : super(GoogleMapsInitial()) {
    on<FetchMarks>(_onFetchMarks);
  }

  Future<void> _onFetchMarks(FetchMarks event, Emitter<GoogleMapsState> emit) async {
    emit(GoogleMapsLoading());
    try {
      final marks = await apiClient.getMarks('Europe/Kyiv');
      final location = tz.getLocation('Europe/Kyiv');
      final timeZoneTime = tz.TZDateTime.now(location);
      emit(GoogleMapsLoaded(marks, timeZoneTime));
    } catch (e) {
      emit(GoogleMapsError(e.toString()));
    }
  }
}
