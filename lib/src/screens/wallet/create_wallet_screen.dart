import 'dart:ui';

import 'package:ebloqs_app/src/screens/buy/comprar_screen.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateWalletScreen extends StatefulWidget {
  static const String routeName = 'CreateWalletScreen';
  const CreateWalletScreen({Key? key}) : super(key: key);

  @override
  State<CreateWalletScreen> createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  bool? visible;
  bool copied = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width);
    print(size.height);
    print(Preferences.id_wallet);
    return Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   systemOverlayStyle: systemBarDark,
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        // ),
        body: Stack(
          children: [
            Image.asset('assets/png/02 1.png'),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.075, left: size.width * 0.037),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(
                            'assets/Vectores/Iconos/Arrow left.svg'),
                      ),
                      Expanded(child: Container()),
                      const Align(
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            "Crea tu billetera",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 17,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.055),
                    child: const Text(
                      "Respalda tu billetera",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 20,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.013),
                    child: SizedBox(
                      width: size.width * 0.91,
                      child: const Text(
                        "Su frase de recuperación secreta se usa para  recuperar su cripto si pierde su teléfono o cambia a una billetera diferente.",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.02),
                    child: SizedBox(
                      width: size.width * 0.92,
                      height: size.height * 0.105,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width * 0.92,
                            height: size.height * 0.105,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: const Color(0xffeae4fc),
                                width: 1,
                              ),
                              color: const Color(0xfff9f9fa),
                            ),
                            padding: EdgeInsets.only(
                              left: size.width * 0.033,
                              right: size.width * 0.028,
                              top: size.height * 0.017,
                              bottom: size.height * 0.019,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: size.width * 0.065,
                                  height: size.width * 0.065,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/candado.svg'),
                                ),
                                SizedBox(width: size.width * 0.043),
                                SizedBox(
                                  width: size.width * 0.745,
                                  child: const Text(
                                    "Guarde estas 12 palabras en un lugar seguro, \ncomo un administrador de contraseñas, y \nnunca lo comparta con nadie.",
                                    style: TextStyle(
                                      color: Color(0xff170658),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.036),
                    child: const Text(
                      "Tu Frase",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.009),
                    child: Container(
                      width: size.width * 0.91,
                      height: size.height * 0.105,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: const Color(0xffcdccd1),
                          width: 1,
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: size.width * 0.74,
                            child: (visible == true)
                                ? Text(
                                    Preferences.mnemonic!,
                                    style: const TextStyle(
                                      color: Color(0xff170658),
                                      fontSize: 14,
                                    ),
                                  )
                                : ImageFiltered(
                                    imageFilter: ImageFilter.blur(
                                        sigmaX: (visible == true) ? 0 : 5,
                                        sigmaY: (visible == true) ? 0 : 5),
                                    child: Text(
                                      Preferences.mnemonic!,
                                      style: const TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (visible == false) {
                                  visible = true;
                                } else {
                                  visible = false;
                                }

                                print('blur');
                                print(visible);
                              });
                            },
                            child: Container(
                              width: size.width * 0.065,
                              height: size.height * 0.032,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xfff9f9fa),
                              ),
                              child: SvgPicture.asset(
                                'assets/Vectores/Iconos/eye.svg',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.0307),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/Vectores/Iconos/Copy 2.svg'),
                          Padding(
                            padding: EdgeInsets.only(left: size.width * 0.023),
                            child: const Text(
                              "COPIAR",
                              style: TextStyle(
                                color: Color(0xff2504ca),
                                fontSize: 11.59,
                              ),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Clipboard.setData(
                                ClipboardData(text: Preferences.mnemonic))
                            .then((_) {
                          setState(() {
                            copied = true;
                          });
                        });
                      },
                    ),
                  ),
                  (copied)
                      ? Container(
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: const Color(0xff170658),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.00985221674876847,
                                  bottom: size.height * 0.00985221674876847),
                              child: const Text(
                                "Copiado en portapapeles",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.25, right: size.width * 0.039),
                    child: GestureDetector(
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
                            child: Text(
                              "Continuar",
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
                      onTap: () async {
                        Navigator.pushNamed(context, ComprarScreen.routeName);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
