import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/screens/GAuthenticator/download_gauthenticator_screen.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/button_primary_solid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget googleAuthenticator(BuildContext context, Size size, bool loading) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    title: SizedBox(
      width: UtilSize.width(167, context),
      height: UtilSize.height(24, context),
      child: const AutoSizeText(
        'Protección adicional',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff170658),
          fontSize: 17,
          fontFamily: "Archivo",
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: UtilSize.width(231, context),
          height: UtilSize.height(38, context),
          child: const AutoSizeText(
            "Selecciona el método de verificación para proteger tu cuenta",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff170658),
              fontSize: 13,
              fontFamily: "Archivo",
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: UtilSize.height(34, context)),
          child: Center(
            child: Container(
              width: UtilSize.width(132, context),
              height: UtilSize.height(132, context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xffeae4fc),
                  width: 1,
                ),
                color: const Color(0xfff9f9fa),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: UtilSize.height(20, context)),
                child: Column(
                  children: [
                    SvgPicture.asset("assets/Vectores/Iconos/googleauth.svg"),
                    Padding(
                      padding:
                          EdgeInsets.only(top: UtilSize.height(10, context)),
                      child: SizedBox(
                        width: UtilSize.width(107, context),
                        child: const AutoSizeText(
                          "Google Authenticator",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff2504CA),
                            fontSize: 14,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: UtilSize.height(34, context),
          ),
          child: SizedBox(
            width: UtilSize.width(301, context),
            height: UtilSize.height(52, context),
            child: ButtonPrimary(
              width: size.width,
              title: "Siguiente",
              onPressed: () {
                Navigator.pushNamed(
                    context, DownloadGAuthenticatorScreen.routeName);
              },
              load: loading,
              disabled: loading,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: UtilSize.height(8, context),
          ),
          child: SizedBox(
            width: UtilSize.width(301, context),
            height: UtilSize.height(52, context),
            child: ButtonPrimarySolid(
              width: size.width,
              title: "Cancelar",
              onPressed: () {
                Navigator.pop(context);
              },
              load: loading,
              disabled: loading,
            ),
          ),
        ),
      ],
    ),
  );
}
