import 'package:clockie/config/utils.dart';
import 'package:clockie/controller/home_controller/home_controller.dart';
import 'package:clockie/view/home/bloc/home_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final HomeBloc homeBloc;
  const HomeScreen({required this.homeBloc});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeController().homeRefreshTime(widget.homeBloc);
    widget.homeBloc.add(HomeGetCurrentTimeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: screenHeight * .14,
          ),
          BlocBuilder<HomeBloc, HomeState>(
            bloc: widget.homeBloc,
            buildWhen: (previous, current) =>
                current is HomeGetCurrentTimeState,
            builder: (context, state) {
              switch (state.runtimeType) {
                case HomeGetCurrentTimeState:
                  {
                    state as HomeGetCurrentTimeState;
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        state.time,
                        style: TextStyle(fontSize: 62, color: appColorOne),
                      ),
                    );
                  }

                default:
                  {
                    return Center(
                      child: appProgressIndicator,
                    );
                  }
              }
            },
          )
        ],
      )),
    );
  }
}
