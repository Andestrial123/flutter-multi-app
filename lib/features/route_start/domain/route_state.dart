part of 'route_cubit.dart';

@immutable
sealed class RouteState {}

class RouteInitial extends RouteState {}

class RouteMain extends RouteState {}

class RouteAuth extends RouteState {}