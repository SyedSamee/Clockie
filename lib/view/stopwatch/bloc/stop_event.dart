part of 'stop_bloc.dart';

@immutable
class StopEvent {}

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

class ResetStopWatchEvent extends StopEvent {
  final StopWatchBloc stopWatchBloc;
  ResetStopWatchEvent({required this.stopWatchBloc});
}

class StopWatchStartPauseEvent extends StopEvent {
  final StopWatchTimerState? stopWatchTimerState;
  final ResumeWatchTimerState? resumeWatchTimerState;
  final StopWatchBloc stopWatchBloc;

  StopWatchStartPauseEvent(
      {required this.resumeWatchTimerState,
      required this.stopWatchBloc,
      required this.stopWatchTimerState});
}

class ResetWatchTimerEvent extends StopEvent {}
