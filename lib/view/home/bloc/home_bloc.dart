import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clockie/config/extentions/time_extention.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeGetCurrentTimeEvent>(homeGetCurrentTimeEvent);
  }

  FutureOr<void> homeGetCurrentTimeEvent(
      HomeGetCurrentTimeEvent event, Emitter<HomeState> emit) async {
    //for refreshing logic
    //Getting current time
    DateTime currentTime = DateTime.now().toLocal();
    //passing to homescreen
    emit(HomeGetCurrentTimeState(time: currentTime.timeFormater));
  }
}
