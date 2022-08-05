import 'package:ebloqs_app/src/screens/home_screen.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_screen_route.dart';
import 'package:ebloqs_app/src/screens/register/registro_correo_screen.dart';
import 'package:ebloqs_app/src/screens/register/registro_link_screen.dart';
import 'package:ebloqs_app/src/screens/register/registro_redes_screen.dart';
import 'package:ebloqs_app/src/screens/wallet/create_wallet_pass_screen.dart';
import 'package:ebloqs_app/src/screens/wallet/create_wallet_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
    OnBoardPageRoute.routeName: (BuildContext context) =>
        const OnBoardPageRoute(),
    RegistroRedesScreen.routeName: (BuildContext context) =>
        const RegistroRedesScreen(),
    RegistroCorreoScreen.routeName: (BuildContext context) =>
        const RegistroCorreoScreen(),
    RegistroLinkScreen.routeName: (BuildContext context) =>
        const RegistroLinkScreen(),
    CreateWalletScreen.routeName: (BuildContext context) =>
        const CreateWalletScreen(),
    CreateWalletPassScreen.routeName: (BuildContext context) =>
        const CreateWalletPassScreen(),
  };
}
