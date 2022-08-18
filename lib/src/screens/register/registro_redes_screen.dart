import 'dart:io';

import 'package:ebloqs_app/src/providers/user_info_provider.dart';
import 'package:ebloqs_app/src/screens/local_auth/local_auth.dart';
import 'package:ebloqs_app/src/screens/register/registro_correo_screen.dart';
import 'package:ebloqs_app/src/services/apple_signin_service.dart';
import 'package:ebloqs_app/src/services/auth_user_service.dart';
import 'package:ebloqs_app/src/services/facebook_sign_in_service.dart';
import 'package:ebloqs_app/src/services/google_signin_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class RegistroRedesScreen extends StatefulWidget {
  static const routeName = 'RegistroRedesScreen';
  const RegistroRedesScreen({Key? key}) : super(key: key);

  @override
  State<RegistroRedesScreen> createState() => _RegistroRedesScreenState();
}

class _RegistroRedesScreenState extends State<RegistroRedesScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: size.width * 0.052,
          top: size.height * 0.184,
          right: size.width * 0.052,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                  'assets/Vectores/Ilustraciones/Group1825.svg'),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.118, bottom: size.height * 0.005),
              child: const Text(
                'Regístrate',
                style: TextStyle(
                  color: Color(0xff170658),
                  fontSize: 17,
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Text(
              'Inicia sesión en ebloqs con tu cuenta favorita',
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 13,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.034),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          final response =
                              await FacebookSignInService.facebookLogin(
                                  context);
                          print(response);
                          if (response['email'] != null) {
                            final register = await AuthUserService()
                                .registerUser(
                                    email: response['email'],
                                    deviceID: response['id'],
                                    name: response['name'] ??
                                        response.email.split('@').first,
                                    type_acount: 'facebook');

                            if (register["access_token"] != null) {
                              setState(() {
                                Preferences.token = register['access_token'];
                                Provider.of<UserInfoProvider>(context,
                                        listen: false)
                                    .emailset(response['email']);
                              });

                              Future.delayed(Duration.zero).then(
                                (_) => Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    LocalAuth.routeName,
                                    (route) => false),
                              );
                            } else {
                              print(register);
                            }
                          }
                        },
                        icon: SvgPicture.asset(
                            'assets/Vectores/Iconos/Group2144.svg'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.016),
                        child: const Text(
                          'Facebook',
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 11.26,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          final GoogleSignInAccount response =
                              await GoogleSignInService.signInWithGoogle();
                          if (response.email.isNotEmpty) {
                            final register = await AuthUserService()
                                .registerUser(
                                    email: response.email,
                                    deviceID: response.id,
                                    name: response.displayName ??
                                        response.email.split('@').first,
                                    type_acount: 'google');

                            if (register["access_token"] != null) {
                              setState(() {
                                Preferences.token = register['access_token'];
                                Provider.of<UserInfoProvider>(context,
                                        listen: false)
                                    .emailset(response.email);
                              });

                              Future.delayed(Duration.zero).then(
                                (_) => Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    LocalAuth.routeName,
                                    (route) => false),
                              );
                            } else {
                              print(register);
                            }
                          }
                        },
                        icon: SvgPicture.asset(
                            'assets/Vectores/Iconos/Group2145.svg'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.016),
                        child: const Text(
                          'Google',
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 11.26,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Platform.isIOS
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: (Platform.isIOS)
                                  ? AppleSigninService.signInIOS
                                  : AppleSigninService.signInAndroid,
                              icon: const Icon(
                                Icons.apple,
                                color: Color(0xff000000),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: size.height * 0.016),
                              child: const Text(
                                'Apple',
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 11.26,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              RegistroCorreoScreen.routeName, (route) => false);
                        },
                        icon: SvgPicture.asset(
                            'assets/Vectores/Iconos/Group2148.svg'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.016),
                        child: const Text(
                          'Correo',
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 11.26,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
