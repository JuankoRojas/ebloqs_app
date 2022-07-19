import 'package:ebloqs_app/src/screens/home_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
  };
}
