import 'package:ebloqs_app/src/routes/get_application_routes.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_screen_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ebloqs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: OnBoardPageRoute.routeName,
      routes: getApplicationRoutes(),
    );
  }
}
