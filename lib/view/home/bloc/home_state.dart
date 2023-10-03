part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeGetCurrentTimeState extends HomeState {
  final String time;
  HomeGetCurrentTimeState({required this.time});
}
