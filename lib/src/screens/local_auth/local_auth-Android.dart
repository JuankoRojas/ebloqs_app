import 'package:after_layout/after_layout.dart';
import 'package:ebloqs_app/src/app/app_config.dart';
import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/screens/home_screen.dart';
import 'package:ebloqs_app/src/screens/indentity/nationality_screen.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthAndroid extends StatefulWidget {
  static const routeName = 'LocalAuthAndroid';
  const LocalAuthAndroid({Key? key}) : super(key: key);

  @override
  State<LocalAuthAndroid> createState() => _LocalAuthAndroidState();
}

class _LocalAuthAndroidState extends State<LocalAuthAndroid>
    with AfterLayoutMixin<LocalAuthAndroid> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  Environment? environment;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      environment = AppConfig.of(context).environment;
    });
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Escanea tu huella o tu rostro para autenticarte',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
    if (message == 'Authorized') {
      setState(() {
        Preferences.local_auth = message;
      });
      (environment == Environment.prod)
          ? Navigator.of(context)
              .pushNamed(HomeScreen.routeName)
              .whenComplete(_cancelAuthentication)
          : Navigator.of(context)
              .pushNamed(NationalityScreen.routeName)
              .whenComplete(_cancelAuthentication);
    }
  }

  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: UtilSize.height(142, context)),
            child: Center(
              child: SvgPicture.asset(
                'assets/Vectores/Ilustraciones/Group 2066.svg',
                height: UtilSize.height(370, context),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: UtilSize.height(30, context),
              left: UtilSize.width(15, context),
            ),
            child: Text(
              "Asegurar tu cuenta con Huella Digital",
              style: TextStyle(
                color: const Color(0xff170658),
                fontSize: UtilSize.width(20, context),
                fontFamily: "Archivo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: UtilSize.height(8, context),
              left: UtilSize.width(15, context),
            ),
            child: SizedBox(
              width: UtilSize.width(344, context),
              child: Text(
                "Así nos aseguramos que solo usted pueda tomar las decisiones",
                style: TextStyle(
                  color: const Color(0xff170658),
                  fontSize: UtilSize.width(13, context),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: UtilSize.height(40, context),
              right: UtilSize.width(15, context),
              left: UtilSize.width(15, context),
            ),
            child: GestureDetector(
              onTap: _authenticateWithBiometrics,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: size.height * 0.064,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/png/buttongradient.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Habilitar huella digital",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: UtilSize.width(14, context),
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: UtilSize.height(16, context),
            ),
            child: GestureDetector(
              child: Container(
                width: size.width,
                height: UtilSize.height(52, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffF9F9FA),
                ),
                child: Center(
                  child: Text(
                    "En otro momento",
                    style: TextStyle(
                      color: const Color(0xff170658),
                      fontSize: UtilSize.width(14, context),
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Preferences.local_auth = 'Not Authorized';
                (environment == Environment.prod)
                    ? Navigator.of(context)
                        .pushNamed(HomeScreen.routeName)
                        .whenComplete(_cancelAuthentication)
                    : Navigator.pushNamed(context, NationalityScreen.routeName)
                        .whenComplete(_cancelAuthentication);
              },
            ),
          )
        ],
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
