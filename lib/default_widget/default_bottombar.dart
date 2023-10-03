import 'package:clockie/config/utils.dart';
import 'package:clockie/view/bottom_viewer/bloc/bottom_viewer_bloc.dart';
import 'package:clockie/view/bottom_viewer/bottom_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:math' as math;

class DefaultBottomBar extends StatelessWidget {
  final PageController pageController;
  final BottomViewerBloc bottomViewerBloc;
  DefaultBottomBar(
      {super.key,
      required this.pageController,
      required this.bottomViewerBloc});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<BottomViewerBloc, BottomViewerState>(
      bloc: bottomViewerBloc,
      buildWhen: (previous, current) => current is BottomViewerInitial,
      builder: (context, state) {
        state as BottomViewerInitial;

        return SizedBox(
          width: screenWidth,
          height: screenHeight * .1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  bottomViewerBloc.add(BottomViewerMovedToNextScreen(
                      index: state.index == 1 ? 0 : 1));
                  pageController.jumpToPage(state.index == 1 ? 0 : 1);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                        "assets/images/bottombar_icons/${state.index == 1 ? "clock_icon" : "timer_icon"}.svg"),
                    Text(
                      state.index == 1 ? "Home" : "Stop watch",
                      style: TextStyle(color: appColorTwo),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
