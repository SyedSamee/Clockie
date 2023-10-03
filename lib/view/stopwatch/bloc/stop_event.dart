part of 'stop_bloc.dart';

@immutable
sealed class StopEvent {}

class StopWatchTimerEvent extends StopEvent {
  final String time;
  StopWatchTimerEvent({required this.time});
}
