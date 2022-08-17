import 'package:ebloqs_app/src/screens/buy/comprar_screen.dart';
import 'package:ebloqs_app/src/screens/buy/introducir_cantidad_tarjeta_screen.dart';
import 'package:ebloqs_app/src/screens/buy/introducir_cantidad_transferencia_screen.dart';
import 'package:ebloqs_app/src/screens/buy/transferir_ebloqs_screen.dart';
import 'package:ebloqs_app/src/screens/home_screen.dart';
import 'package:ebloqs_app/src/screens/local_auth/local_auth.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_screen_route.dart';
import 'package:ebloqs_app/src/screens/project/project_view_screen.dart';
import 'package:ebloqs_app/src/screens/register/registro_correo_screen.dart';
import 'package:ebloqs_app/src/screens/register/registro_link_screen.dart';
import 'package:ebloqs_app/src/screens/register/registro_redes_screen.dart';
import 'package:ebloqs_app/src/screens/wallet/create_wallet_pass_screen.dart';
import 'package:ebloqs_app/src/screens/wallet/create_wallet_screen.dart';
import 'package:ebloqs_app/src/screens/wallet/wallet_screen.dart';
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
    ComprarScreen.routeName: (BuildContext context) => const ComprarScreen(),
    IntroducirCantidadTransferenciaScreen.routeName: (BuildContext context) =>
        const IntroducirCantidadTransferenciaScreen(),
    IntroducirCantidadTarjetaScreen.routeName: (BuildContext context) =>
        const IntroducirCantidadTarjetaScreen(),
    TransferirEbloqsScreen.routeName: (BuildContext context) =>
        const TransferirEbloqsScreen(),
    WalletScreen.routeName: (BuildContext context) => const WalletScreen(),
    ProjectViewScreen.routeName: (BuildContext context) =>
        const ProjectViewScreen(),
    LocalAuth.routeName: (BuildContext context) => const LocalAuth(),
  };
}
