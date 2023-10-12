part of 'stop_bloc.dart';

@immutable
sealed class StopState {}

final class StopInitial extends StopState {}

final class StopWatchTimerState extends StopState {
  final String time;
  final List unFilteredTime;
  StopWatchTimerState({required this.time, required this.unFilteredTime});
}

final class ResumeWatchTimerState extends StopState {
  final String time;
  final List unFilteredTime;
  ResumeWatchTimerState({required this.time, required this.unFilteredTime});
}
