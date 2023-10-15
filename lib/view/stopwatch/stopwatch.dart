import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:clockie/config/extentions/string_extention.dart';
import 'package:clockie/config/utils.dart';
import 'package:clockie/controller/stopwatch_controller.dart/stopwatch_controller.dart';
import 'package:clockie/view/stopwatch/bloc/stop_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StopWatchScreen extends StatefulWidget {
  //for disposing it with parent => bottomviewer
  final StopWatchBloc stopWatchBloc;
  const StopWatchScreen({super.key, required this.stopWatchBloc});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: screenWidth,
        height: screenHeight,
        child: BlocBuilder<StopWatchBloc, StopState>(
          bloc: widget.stopWatchBloc,
          buildWhen: (previous, current) =>
              current is ResetWatchTimerState ||
              current is StopWatchTimerState ||
              current is ResumeWatchTimerState,
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: screenHeight * .1,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    state is StopWatchTimerState
                        ? "${state.time}"
                        : state is ResumeWatchTimerState
                            ? "${state.time}"
                            : state is ResetWatchTimerState
                                ? "00 : 00 : 00"
                                : "00 : 00 : 00",
                    style: TextStyle(fontSize: 55, color: appColorOne),
                  ),
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.stopWatchBloc.add(StopWatchStartPauseEvent(
                        resumeWatchTimerState:
                            state is ResumeWatchTimerState ? state : null,
                        stopWatchBloc: widget.stopWatchBloc,
                        stopWatchTimerState:
                            state is StopWatchTimerState ? state : null));
                  },
                  child: Text(
                    state is StopWatchTimerState ? "Stop" : "Start",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => appColorOne)),
                ),
                state is ResumeWatchTimerState
                    ? ElevatedButton(
                        onPressed: () {
                          widget.stopWatchBloc.add(ResetStopWatchEvent(
                              stopWatchBloc: widget.stopWatchBloc));
                        },
                        child: Text(
                          "Reset",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => appColorOne)),
                      )
                    : SizedBox(),
              ],
            );
          },
        ),
      )),
    );
  }
}
