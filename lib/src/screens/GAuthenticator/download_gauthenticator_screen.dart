import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/screens/GAuthenticator/otp_gauthenticator_screen.dart';
import 'package:ebloqs_app/src/widgets/button_primary_solid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DownloadGAuthenticatorScreen extends StatefulWidget {
  static const routeName = 'DownloadGAuthenticatorScreen';
  const DownloadGAuthenticatorScreen({super.key});

  @override
  State<DownloadGAuthenticatorScreen> createState() =>
      _DownloadGAuthenticatorScreenState();
}

class _DownloadGAuthenticatorScreenState
    extends State<DownloadGAuthenticatorScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///=> Creación del header de la pantalla de retiro
              Padding(
                padding: EdgeInsets.only(
                    left: UtilSize.width(20, context),
                    right: UtilSize.width(20, context)),
                child: Row(
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                          'assets/Vectores/Iconos/Arrow left.svg'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(child: Container()),
                    const AutoSizeText(
                      "Descargar e instalar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 17,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                        child: SvgPicture.asset(
                            'assets/Vectores/Iconos/Question.svg')),
                  ],
                ),
              ),

              ///=> Creación de la imagen de la pantalla
              Padding(
                padding: EdgeInsets.only(
                  top: UtilSize.height(140, context),
                ),
                child: SvgPicture.asset(
                    "assets/Vectores/Ilustraciones/Group 1959.svg"),
              ),

              ///=> Creación del texto de descarga

              Padding(
                padding: EdgeInsets.only(
                  top: UtilSize.height(24, context),
                  left: UtilSize.width(15, context),
                  right: UtilSize.width(15, context),
                ),
                child: const AutoSizeText(
                  "Descarga e instala la aplicación Google Authenticator. Después vincula a tu cuenta.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 14,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              ///=> Creación del botón de descarga
              Padding(
                padding: EdgeInsets.only(
                  top: UtilSize.height(114, context),
                  left: UtilSize.width(15, context),
                  right: UtilSize.width(15, context),
                ),
                child: ButtonPrimarySolid(
                  width: size.width,
                  title: "Descargar Google Authenticator",
                  onPressed: () {
                    Navigator.pushNamed(
                        context, OtpGAuthenticatorScreen.routeName);
                  },
                  load: loading,
                  disabled: loading,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
