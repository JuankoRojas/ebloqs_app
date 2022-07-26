import 'package:ebloqs_app/src/screens/home_screen.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_screen_route.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
    OnBoardPageRoute.routeName: (BuildContext context) =>
        const OnBoardPageRoute(),
  };
}
