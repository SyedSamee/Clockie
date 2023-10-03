import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stop_event.dart';
part 'stop_state.dart';

class StopBloc extends Bloc<StopEvent, StopState> {
  StopBloc() : super(StopInitial()) {
    on<StopEvent>((event, emit) {});
    on<StopWatchTimerEvent>(stopWatchStartTimerEvent);
  }

  FutureOr<void> stopWatchStartTimerEvent(
      StopWatchTimerEvent event, Emitter<StopState> emit) {
    emit(StopWatchTimerState(time: event.time));
  }
}
