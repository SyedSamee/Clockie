import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clockie/controller/stopwatch_controller.dart/stopwatch_controller.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'stop_event.dart';
part 'stop_state.dart';

class StopWatchBloc extends Bloc<StopEvent, StopState> {
  StopWatchBloc() : super(StopInitial()) {
    on<StopEvent>((event, emit) {
      emit(StopInitial());
    });
    on<StopWatchTimerEvent>(stopWatchStartTimerEvent);
    on<ResumeWatchTimerEvent>(resumeWatchTimerEvent);
    on<ResetStopWatchEvent>(resetStopWatchEvent);
    on<StopWatchStartPauseEvent>(stopWatchStartPauseEvent);
    on<ResetWatchTimerEvent>(resetWatchTimerEvent);
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

  FutureOr<void> resetStopWatchEvent(
      ResetStopWatchEvent event, Emitter<StopState> emit) {
    StopWatchController().stopWatchStartTime(
        event.stopWatchBloc, false, null, null, false, true);
  }

  FutureOr<void> stopWatchStartPauseEvent(
      StopWatchStartPauseEvent event, Emitter<StopState> emit) {
    event.stopWatchTimerState != null
        ? {
            StopWatchController().stopWatchStartTime(
                event.stopWatchBloc,
                true,
                event.stopWatchTimerState!.time,
                event.stopWatchTimerState!.unFilteredTime,
                false,
                false)
          }
        : event.resumeWatchTimerState != null
            ? {
                StopWatchController().stopWatchStartTime(
                    event.stopWatchBloc,
                    true,
                    event.resumeWatchTimerState!.time,
                    event.resumeWatchTimerState!.unFilteredTime,
                    true,
                    false)
              }
            : {
                StopWatchController().stopWatchStartTime(
                    event.stopWatchBloc, false, null, null, false, false)
              };
  }

  FutureOr<void> resetWatchTimerEvent(
      ResetWatchTimerEvent event, Emitter<StopState> emit) {
    emit(ResetWatchTimerState());
  }
}
