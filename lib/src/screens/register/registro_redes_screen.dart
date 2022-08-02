import 'package:ebloqs_app/src/screens/register/registro_correo_screen.dart';
import 'package:ebloqs_app/src/services/google_signin_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegistroRedesScreen extends StatelessWidget {
  static const routeName = 'RegistroRedesScreen';
  const RegistroRedesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 145),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                  'assets/Vectores/Ilustraciones/Group1825.svg'),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 93.0, bottom: 5),
              child: Text(
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
              padding: const EdgeInsets.only(top: 27.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                            'assets/Vectores/Iconos/Group2144.svg'),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text(
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
                        onPressed: () {
                          GoogleSignInService.signInWithGoogle();
                        },
                        icon: SvgPicture.asset(
                            'assets/Vectores/Iconos/Group2145.svg'),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                            'assets/Vectores/Iconos/Group2147.svg'),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text(
                          'Apple',
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
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              RegistroCorreoScreen.routeName, (route) => false);
                        },
                        icon: SvgPicture.asset(
                            'assets/Vectores/Iconos/Group2148.svg'),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text(
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
