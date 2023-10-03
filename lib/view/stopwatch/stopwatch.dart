import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:clockie/config/utils.dart';
import 'package:clockie/controller/stopwatch_controller.dart/stopwatch_controller.dart';
import 'package:clockie/view/stopwatch/bloc/stop_bloc.dart';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class StopWatchScreen extends StatefulWidget {
  final StopBloc stopBloc;
  const StopWatchScreen({super.key, required this.stopBloc});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: screenWidth,
        height: screenHeight,
        child: BlocBuilder<StopBloc, StopState>(
          bloc: widget.stopBloc,
          buildWhen: (previous, current) =>
              current is StopInitial || current is StopWatchTimerState,
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
                        : "00 : 00 : 00",
                    style: TextStyle(fontSize: 55, color: appColorOne),
                  ),
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                ElevatedButton(
                  onPressed: () {
                    StopWatchController().stopWatchStartTime(widget.stopBloc,
                        state is StopWatchTimerState ? true : false, []);
                  },
                  child: Text(
                    state is StopWatchTimerState ? "Stop" : "Start",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => appColorOne)),
                )
              ],
            );
          },
        ),
      )),
    );
  }
}
