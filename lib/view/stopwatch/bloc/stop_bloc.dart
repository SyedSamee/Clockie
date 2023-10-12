import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stop_event.dart';
part 'stop_state.dart';

class StopWatchBloc extends Bloc<StopEvent, StopState> {
  StopWatchBloc() : super(StopInitial()) {
    on<StopEvent>((event, emit) {});
    on<StopWatchTimerEvent>(stopWatchStartTimerEvent);
    on<ResumeWatchTimerEvent>(resumeWatchTimerEvent);
  }

  FutureOr<void> stopWatchStartTimerEvent(
      StopWatchTimerEvent event, Emitter<StopState> emit) {
    emit(StopWatchTimerState(
        time: event.time, unFilteredTime: event.unFilteredTime));
  }

  FutureOr<void> resumeWatchTimerEvent(
      ResumeWatchTimerEvent event, Emitter<StopState> emit) {
    emit(ResumeWatchTimerState(
        time: event.time, unFilteredTime: event.unFilteredTime));
  }
}
