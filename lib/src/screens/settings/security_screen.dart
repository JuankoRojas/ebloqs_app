import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/screens/local_auth/local_auth-Android_settings.dart';
import 'package:ebloqs_app/src/screens/local_auth/local_auth_settings.dart';
// import 'package:ebloqs_app/src/screens/market/market_screen.dart';
import 'package:ebloqs_app/src/screens/settings/delete_account_screen.dart';
import 'package:ebloqs_app/src/screens/settings/device_management_screen.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/custom_appbar_pop_question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';

class SecurityScreen extends StatefulWidget {
  static const routeName = 'SecurityScreen';
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool localAuth = false;
  final LocalAuthentication auth = LocalAuthentication();
  @override
  void initState() {
    /// Call out to intialize platform state.
    initPlatformState();
    localAuthSetting();
    super.initState();
  }

  /// Initialize platform state.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  Future localAuthSetting() async {
    print(Preferences.local_auth);
    if (Preferences.local_auth == "Authorized") {
      setState(() {
        localAuth = true;
      });
    } else {
      localAuth = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0738916256157636,
                left: size.width * 0.064,
                right: size.width * 0.0426666666666667),
            child: const CustomAppbarWithPopAndQuestion(
              text: 'Seguridad',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.0344827586206897,
            ),
            child: SizedBox(
              width: size.width * 0.92,
              child: const AutoSizeText(
                "Para proteger tu cuenta se recomienda activar el menos un doble factor de seguridad.",
                style: TextStyle(
                  color: Color(0xff170658),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0295566502463054,
                left: size.width * 0.064,
                right: size.width * 0.0426666666666667),
            child: Row(
              children: [
                const AutoSizeText(
                  "ID Facial",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                        value: localAuth,
                        onChanged: (value) {
                          if (Preferences.local_auth == "Not Authorized") {
                            if (Platform.isAndroid) {
                              Navigator.of(context).pushNamed(
                                  LocalAuthAndroidSettings.routeName);
                            } else {
                              Navigator.of(context)
                                  .pushNamed(LocalAuthSettings.routeName);
                            }
                          }
                        }))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0295566502463054,
                left: size.width * 0.064,
                right: size.width * 0.0426666666666667),
            child: GestureDetector(
              child: Row(
                children: [
                  const AutoSizeText(
                    "Gestión de dispositivos",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/Vectores/Iconos/chevronright.svg',
                      color: const Color(0xff2504CA))
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, DeviceManagementScreen.routeName);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0295566502463054,
                left: size.width * 0.064,
                right: size.width * 0.0426666666666667),
            child: GestureDetector(
              child: Row(
                children: [
                  const AutoSizeText(
                    "Eliminar cuenta",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/Vectores/Iconos/chevronright.svg',
                      color: const Color(0xff2504CA))
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, DeleteAccountScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
