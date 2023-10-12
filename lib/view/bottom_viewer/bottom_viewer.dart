import 'package:clockie/default_widget/default_bottombar.dart';
import 'package:clockie/default_widget/defualt_appbar.dart';
import 'package:clockie/view/bottom_viewer/bloc/bottom_viewer_bloc.dart';
import 'package:clockie/view/home/bloc/home_bloc.dart';
import 'package:clockie/view/home/home.dart';
import 'package:clockie/view/stopwatch/bloc/stop_bloc.dart';
import 'package:clockie/view/stopwatch/stopwatch.dart';
import 'package:flutter/material.dart';

class BottomViewer extends StatefulWidget {
  const BottomViewer({super.key});

  @override
  State<BottomViewer> createState() => _BottomViewerState();
}

class _BottomViewerState extends State<BottomViewer> {
  HomeBloc homeBloc = HomeBloc();
  BottomViewerBloc bottomViewerBloc = BottomViewerBloc();
  StopWatchBloc stopWatchBloc = StopWatchBloc();
  PageController pageController = PageController();
  @override
  void dispose() {
    homeBloc.close();
    bottomViewerBloc.close();
    stopWatchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * .07),
        child: const DefualtAppbar(),
      ),
      bottomNavigationBar: DefaultBottomBar(
          pageController: pageController, bottomViewerBloc: bottomViewerBloc),
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            HomeScreen(homeBloc: homeBloc),
            StopWatchScreen(
              stopWatchBloc: stopWatchBloc,
            )
          ]),
    );
  }
}
