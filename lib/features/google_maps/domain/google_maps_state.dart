part of 'google_maps_bloc.dart';

abstract class GoogleMapsState {}

class GoogleMapsInitial extends GoogleMapsState {}

class GoogleMapsLoading extends GoogleMapsState {}

class GoogleMapsLoaded extends GoogleMapsState {
  final List<MarksModel> marks;
  final DateTime timeZoneTime;

  GoogleMapsLoaded(this.marks, this.timeZoneTime);
}

class GoogleMapsError extends GoogleMapsState {
  final String message;

  GoogleMapsError(this.message);
}
