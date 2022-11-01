import 'package:auto_size_text/auto_size_text.dart';
// import 'package:ebloqs_app/src/app/app_config.dart.old';
import 'package:ebloqs_app/src/global/util_size.dart';

import 'package:ebloqs_app/src/screens/indentity/nationality_screen.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth extends StatefulWidget {
  static const routeName = 'LocalAuth';
  const LocalAuth({Key? key}) : super(key: key);

  @override
  State<LocalAuth> createState() => _LocalAuthState();
}

class _LocalAuthState extends State<LocalAuth> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  // Environment? environment;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
    setState(() {
      // environment = AppConfig.of(context).environment;
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
      Preferences.local_auth = message;

      // (environment == Environment.prod)
      //     ? Navigator.of(context)
      //         .pushNamed(HomeScreen.routeName)
      //         .whenComplete(_cancelAuthentication)
      //     :
      Navigator.of(context)
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
                  'assets/Vectores/Ilustraciones/Group 2065.svg'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: UtilSize.height(30, context),
                left: UtilSize.width(15, context)),
            child: const AutoSizeText(
              "Asegura tu cuenta con Face ID",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 20,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: UtilSize.height(8, context),
                left: UtilSize.width(15, context)),
            child: const SizedBox(
              width: 344,
              child: AutoSizeText(
                "Así nos aseguramos que solo usted pueda tomar las decisiones",
                style: TextStyle(
                  color: Color(0xff170658),
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: UtilSize.height(40, context),
                right: UtilSize.width(15, context),
                left: UtilSize.width(15, context)),
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
                  const Center(
                    child: AutoSizeText(
                      "Habilitar Face ID",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
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
            padding: EdgeInsets.only(top: UtilSize.height(16, context)),
            child: GestureDetector(
              child: Container(
                width: size.width,
                height: UtilSize.height(52, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffF9F9FA),
                ),
                child: const Center(
                  child: AutoSizeText(
                    "En otro momento",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 14,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Preferences.local_auth = 'Not Authorized';
                // (environment == Environment.prod)
                //     ? Navigator.of(context)
                //         .pushNamed(HomeScreen.routeName)
                //         .whenComplete(_cancelAuthentication)
                //     :
                Navigator.of(context)
                    .pushNamed(NationalityScreen.routeName)
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
