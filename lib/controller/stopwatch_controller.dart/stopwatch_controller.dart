import 'dart:async';

import 'package:clockie/config/extentions/string_extention.dart';
import 'package:clockie/config/extentions/time_extention.dart';
import 'package:clockie/view/home/bloc/home_bloc.dart';
import 'package:clockie/view/stopwatch/bloc/stop_bloc.dart';

class StopWatchController {
  Timer? timer;

  stopWatchStartTime(StopBloc stopBloc, bool isStoped, List<int> times) {
    // there is a value which pluss

    int mainValueHours =
        // isStoped ? times.first :
        0;
    int mainValueMins =
        // isStoped
        //     ?
        //     times
        //         .sublist(
        //           1,
        //           2,
        //         )
        //         .first
        //     :
        0;
    int mainValueSecs =

        // isStoped
        //     ? times
        //         .sublist(
        //           2,
        //           3,
        //         )
        //         .first
        //     :
        0;

    timer = Timer.periodic(Duration(seconds: 1), (secTimer) {
      isStoped ? {secTimer.cancel(), secTimer.cancel()} : null;
      mainValueSecs += 1;

      if (mainValueSecs >= 60) {
        mainValueMins++;
        mainValueSecs = 0;
      }

      if (mainValueMins >= 60) {
        mainValueHours += 1;
        mainValueMins = 0;
      }

      if (mainValueHours >= 24) {
        timer?.cancel();
      }

      stopBloc.add(StopWatchTimerEvent(
          time:
              "${mainValueHours.toString().timeIdentifier} : ${mainValueMins.toString().timeIdentifier} : ${mainValueSecs.toString().timeIdentifier}"));
    });
    timer?.cancel();

    // each sec it will add timed value
  }
}
