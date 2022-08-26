import 'dart:async';

import 'package:device_apps/device_apps.dart';
import 'package:ebloqs_app/src/providers/user_info_provider.dart';
import 'package:ebloqs_app/src/screens/wallet/create_wallet_pass_screen.dart';
import 'package:ebloqs_app/src/services/auth_user_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RegistroLinkScreen extends StatefulWidget {
  static const routeName = 'RegistroLinkScreen';
  const RegistroLinkScreen({Key? key}) : super(key: key);

  @override
  State<RegistroLinkScreen> createState() => _RegistroLinkScreenState();
}

class _RegistroLinkScreenState extends State<RegistroLinkScreen> {
  String splitEmail = '';
  bool isValidated = false;

  Timer? _timer;
  int _startCount = 60;

  // variables para el control de validacion
  bool? isValidateAgain = false;
  bool? validating = false;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (_startCount == 0) {
          setState(() {
            timer.cancel();
          });
          validateFunctionEmail();
        } else {
          setState(() {
            _startCount--;
          });
        }
      },
    );
  }

  void validateFunctionEmail() async {
    if (Preferences.token != null) {
      setState(() {
        validating = true;
      });
      bool result = await AuthUserService()
          .validateEmailResult(accesstoken: Preferences.token.toString());
      print('result: $result');

      if (result) {
        Future.delayed(Duration.zero).then(
          (_) => Navigator.pushNamed(
            context,
            CreateWalletPassScreen.routeName,
          ),
        );
        setState(() {
          validating = false;
        });
      } else {
        setState(() {
          validating = false;
          isValidateAgain = true;
        });
      }
    }
  }

  void tryAgainValidate() async {
    setState(() {
      isValidateAgain = false;
    });
    validateFunctionEmail();
  }

  void onlyCheckValidate() {
    _timer!.cancel();
    validateFunctionEmail();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String? email = Provider.of<UserInfoProvider>(context).emailget;
    if (email != '') {
      splitEmail = email!.split('@')[1];
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.035, left: size.width * 0.05),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(
                    'assets/Vectores/Iconos/Arrow left.svg',
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.5),
                  child: Text(
                    'Regresar',
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 14,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/Vectores/Iconos/Group2148.svg',
                        width: size.width * 0.25,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.086, left: size.width * 0.545),
                      child: SvgPicture.asset(
                        'assets/Vectores/Iconos/checkcircle.svg',
                        width: size.width * 0.07,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.025),
                  child: Center(
                    child: Text(
                      email ?? '',
                      style: const TextStyle(
                        color: Color(0xff170658),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.037),
                  child: Container(
                    height: size.height * 0.095,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0xffeae4fc),
                        width: 1,
                      ),
                      color: const Color(0xfff9f9fa),
                    ),
                    child: const Center(
                      child: Text(
                        '''Hemos enviado un link a tu correo para
continuar el proceso de registro en Ebloqs''',
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                ButtonPrimary(
                  width: size.width,
                  title: 'Abrir mi correo',
                  onPressed: () async {
                    if (splitEmail.contains('gmail')) {
                      bool isInstalled = await DeviceApps.isAppInstalled(
                        'com.google.android.gm',
                      );
                      if (isInstalled != false) {
                        DeviceApps.openApp('com.google.android.gm');
                        isValidated = true;
                      } else {
                        String url = 'https://mail.google.com/';
                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                          isValidated = true;
                        } else {
                          throw 'Could not launch $url';
                        }
                      }
                    } else if (splitEmail.contains('outlook')) {
                      bool isInstalled = await DeviceApps.isAppInstalled(
                          'com.microsoft.office.outlook');
                      print(isInstalled);
                      if (isInstalled != false) {
                        DeviceApps.openApp('com.microsoft.office.outlook');
                        isValidated = true;
                      } else {
                        String url = 'https://outlook.live.com/';
                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                          isValidated = true;
                        } else {
                          throw 'Could not launch $url';
                        }
                      }
                    } else if (splitEmail.contains('mail')) {
                      bool isInstalled = await DeviceApps.isAppInstalled(
                        'com.apple.mobilemail',
                      );
                      print(isInstalled);
                      if (isInstalled != false) {
                        DeviceApps.openApp('com.apple.mobilemail');
                      }
                    }
                  },
                  load: false,
                ),
                isValidateAgain!
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.1),
                                child: const Text(
                                  "Correo no verificado",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  tryAgainValidate();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.015,
                                  ),
                                  child: const Text(
                                    "Reintentar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff2504ca),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          validating!
                              ? Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.1,
                                  ),
                                  child: const Text(
                                    "Verificando...",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff170658),
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: size.height * 0.1),
                                      child: Text(
                                        "Validamos en $_startCount segundos",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Color(0xff170658),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        onlyCheckValidate();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height * 0.015),
                                        child: const Text(
                                          "Ya validé mi correo",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff2504ca),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
