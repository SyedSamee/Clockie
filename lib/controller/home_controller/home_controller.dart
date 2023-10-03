import 'dart:async';

import 'package:clockie/view/home/bloc/home_bloc.dart';

class HomeController {
  void homeRefreshTime(HomeBloc homeBloc) {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      homeBloc.add(HomeGetCurrentTimeEvent());
    });
  }
}
