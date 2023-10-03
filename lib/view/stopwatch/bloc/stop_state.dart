part of 'stop_bloc.dart';

@immutable
sealed class StopState {}

final class StopInitial extends StopState {}

final class StopWatchTimerState extends StopState {
  final String time;
  StopWatchTimerState({required this.time});
}
