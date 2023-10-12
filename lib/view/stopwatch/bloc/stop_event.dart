part of 'stop_bloc.dart';

@immutable
sealed class StopEvent {}

class StopWatchTimerEvent extends StopEvent {
  final String time;
  final List unFilteredTime;
  StopWatchTimerEvent({required this.time, required this.unFilteredTime});
}

class ResumeWatchTimerEvent extends StopEvent {
  final String time;
  final List unFilteredTime;
  ResumeWatchTimerEvent({required this.time, required this.unFilteredTime});
}
