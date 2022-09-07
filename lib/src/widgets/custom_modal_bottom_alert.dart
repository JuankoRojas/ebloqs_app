import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> customModalBottomAlert(
    BuildContext context, Size size, String? errorValidation, bool isLoading) {
  return showModalBottomSheet<void>(
      context: context,
      barrierColor: const Color(0xff0B022C).withOpacity(0.85),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: SizedBox(
            height: size.height * 0.529556650246305,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset('assets/svg/warning.svg'),
                  Padding(
                    padding:
                        EdgeInsets.only(top: size.height * 0.04064039408867),
                    child: const Text(
                      "!Hey!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff2504ca),
                        fontSize: 28,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.0147783251231527,
                        left: size.width * 0.138666666666667,
                        right: size.width * 0.138666666666667),
                    child: Text(
                      errorValidation ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xff170658),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.0566502463054187,
                        left: size.width * 0.0346666666666667,
                        right: size.width * 0.0346666666666667),
                    child: ButtonPrimary(
                        width: size.width,
                        title: 'Continuar',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        load: isLoading),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
