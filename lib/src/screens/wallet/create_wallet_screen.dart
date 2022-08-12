import 'dart:ui';

import 'package:ebloqs_app/src/screens/buy/comprar_screen.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/utilitis/tabbar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: systemBarDark,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Image.asset('assets/png/02 1.png'),
            Padding(
              padding: const EdgeInsets.only(top: 62.0, left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
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
                  const Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Text(
                      "Respalda tu billetera",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 20,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      width: 345,
                      child: Text(
                        "Su frase de recuperación secreta se usa para  recuperar su cripto si pierde su teléfono o cambia a una billetera diferente.",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17.0),
                    child: SizedBox(
                      width: 345,
                      height: 84,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 345,
                            height: 84,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: const Color(0xffeae4fc),
                                width: 1,
                              ),
                              color: const Color(0xfff9f9fa),
                            ),
                            padding: const EdgeInsets.only(
                              left: 13,
                              right: 8,
                              top: 14,
                              bottom: 16,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/candado.svg'),
                                ),
                                const SizedBox(width: 17),
                                const SizedBox(
                                  width: 280,
                                  child: Text(
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
                  const Padding(
                    padding: EdgeInsets.only(top: 28.0),
                    child: Text(
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
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      width: 345,
                      height: 84,
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
                            width: 277,
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
                              width: 24,
                              height: 24,
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
                    padding: const EdgeInsets.only(top: 25.0),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/Vectores/Iconos/Copy 2.svg'),
                          const Padding(
                            padding: EdgeInsets.only(left: 9.0),
                            child: Text(
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
                            ClipboardData(text: Preferences.mnemonic));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 204.0, right: 15),
                    child: GestureDetector(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            height: 52,
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
