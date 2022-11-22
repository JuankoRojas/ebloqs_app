import 'package:ebloqs_app/src/providers/account_info_provider.dart';
import 'package:ebloqs_app/src/providers/avatar_user_provider.dart';
import 'package:ebloqs_app/src/providers/coin_market_provider.dart';
import 'package:ebloqs_app/src/providers/images_provider.dart';
import 'package:ebloqs_app/src/providers/locations_provider.dart';
import 'package:ebloqs_app/src/providers/qr_info_provider.dart';
import 'package:ebloqs_app/src/providers/transfer_current_provider.dart';
import 'package:ebloqs_app/src/providers/user_info_provider.dart';
import 'package:ebloqs_app/src/routes/get_application_routes.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_screen_route.dart';
import 'package:ebloqs_app/src/services/coin_market_cap_service.dart';
import 'package:ebloqs_app/src/services/investments_service.dart';
import 'package:ebloqs_app/src/services/token_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(milliseconds: 100));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //USER
        ChangeNotifierProvider(create: (context) => UserInfoProvider()),
        ChangeNotifierProvider(create: (context) => AccountInfoProvider()),
        // ChangeNotifierProvider(create: (context) => AuthAppleService()),
        //Location
        ChangeNotifierProvider(create: (context) => LocationsProvider()),
        //CoinMarketCap
        ChangeNotifierProvider(create: (context) => CoinMarketCapService()),
        //Images
        ChangeNotifierProvider(create: (context) => ImagesProvider()),
        //QR
        ChangeNotifierProvider(create: (context) => QrInfoProvider()),
        //AVATAR
        ChangeNotifierProvider(create: (context) => AvatarUserProvider()),
        ChangeNotifierProvider(create: (context) => TransferCurrentProvider()),
        //COINMARKET
        ChangeNotifierProvider(create: (context) => CoinMarketProvider()),
        //TOKEN
        ChangeNotifierProvider(create: (context) => TokenService()),
        //INVESTMENTS
        ChangeNotifierProvider(create: (context) => InvestmentsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ebloqs',
        theme: ThemeData(
            fontFamily: 'Archivo', scaffoldBackgroundColor: Colors.white),
        // initialRoute: PreviewInvestScreen.routeName,
        initialRoute: OnBoardPageRoute.routeName,
        routes: getApplicationRoutes(),
      ),
    );
  }
}
