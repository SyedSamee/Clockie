import 'dart:async';

import 'package:clockie/config/extentions/string_extention.dart';
import 'package:clockie/config/extentions/time_extention.dart';
import 'package:clockie/config/utils.dart';
import 'package:clockie/view/home/bloc/home_bloc.dart';
import 'package:clockie/view/stopwatch/bloc/stop_bloc.dart';

class StopWatchController {
  stopWatchStartTime(StopWatchBloc stopBloc, bool isStoped, String? time,
      List? timeValues, bool isResume) {
    int mainValueHours = 0;
    int mainValueMins = 0;
    int mainValueSecs = 0;

    if (isResume == false) {
      if (isStoped == false && timeValues == null) {
        //initial timer will start from here
        stopWatchTimer?.cancel();
        stopWatchTimer = Timer.periodic(Duration(seconds: 1), (secTimer) {
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
            stopWatchTimer?.cancel();
          }

          stopBloc.add(StopWatchTimerEvent(
              unFilteredTime: [mainValueHours, mainValueMins, mainValueSecs],
              time:
                  "${mainValueHours.toString().timeIdentifier} : ${mainValueMins.toString().timeIdentifier} : ${mainValueSecs.toString().timeIdentifier}"));
        });
      } else {
        //used for stoping
        stopWatchTimer?.cancel();
        stopBloc.add(
            ResumeWatchTimerEvent(time: time!, unFilteredTime: timeValues!));
      }
    } else {
      //resume controls
      //you can also used this for restating a timer with custom timeValues = > working
      int stopValueHours = timeValues?.first;

      int stopValueMins = timeValues?.sublist(1, 2).first;

      int stopValueSecs = timeValues?.last;

      stopWatchTimer = Timer.periodic(Duration(seconds: 1), (secTimer) {
        stopValueSecs += 1;

        if (stopValueSecs >= 60) {
          stopValueMins++;
          stopValueSecs = 0;
        }

        if (stopValueMins >= 60) {
          stopValueHours += 1;
          stopValueMins = 0;
        }

        if (stopValueHours >= 24) {
          stopWatchTimer?.cancel();
        }

        stopBloc.add(StopWatchTimerEvent(
            unFilteredTime: [stopValueHours, stopValueMins, stopValueSecs],
            time:
                "${stopValueHours.toString().timeIdentifier} : ${stopValueMins.toString().timeIdentifier} : ${stopValueSecs.toString().timeIdentifier}"));
      });
    }
  }
}
