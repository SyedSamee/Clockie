import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_viewer_event.dart';
part 'bottom_viewer_state.dart';

class BottomViewerBloc extends Bloc<BottomViewerEvent, BottomViewerState> {
  BottomViewerBloc() : super(BottomViewerInitial(index: 0)) {
    on<BottomViewerEvent>((event, emit) {});
    on<BottomViewerMovedToNextScreen>(bottomViewerMovedToNextScreen);
  }

  FutureOr<void> bottomViewerMovedToNextScreen(
      BottomViewerMovedToNextScreen event, Emitter<BottomViewerState> emit) {
    emit(BottomViewerInitial(index: event.index));
  }
}
