import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CongratsScreen extends StatefulWidget {
  static const routeName = 'CongratsScreen';
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  State<CongratsScreen> createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
  bool? isLoadLogin = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/png/02 1.png'),
          Padding(
            padding: const EdgeInsets.only(top: 86.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: SvgPicture.asset(
                        'assets/Vectores/Iconos/checkcircle.svg')),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: Text(
                      "¡Felicitaciones eres propietario de!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 15,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Center(
                    child: Text(
                      "15,000 EBL",
                      style: TextStyle(
                        color: Color(0xff2504ca),
                        fontSize: 20,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 72.0, left: 16),
                  child: Text(
                    "Resumen de tu compra",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 16, right: 16),
                  child: Container(
                    width: size.width,
                    height: 163,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xffeae4fc),
                        width: 1,
                      ),
                      color: const Color(0xfff9f9fa),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 10, right: 13),
                          child: Row(
                            children: [
                              const Text(
                                "Precio USD",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(child: Container()),
                              const Text(
                                " \$1,495.33 USD",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: Container(
                            width: size.width,
                            height: 1,
                            color: const Color(0xffDDE2EA),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 9.0, left: 10, right: 13),
                          child: Row(
                            children: [
                              const Text(
                                "Total FEES",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(child: Container()),
                              const Text(
                                "\$4.67 USD",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 7.0, left: 26, right: 13),
                          child: Row(
                            children: [
                              const Text(
                                "Transacción FEE",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(child: Container()),
                              const Text(
                                "\$3.52 USD",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 26, right: 13),
                          child: Row(
                            children: [
                              const Text(
                                "Red FEE",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(child: Container()),
                              const Text(
                                "\$1.15  USD",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 13.0,
                          ),
                          child: Container(
                            width: size.width,
                            height: 1,
                            color: const Color(0xffDDE2EA),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 9.0, left: 10, right: 13),
                          child: Row(
                            children: [
                              const Text(
                                "Total",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(child: Container()),
                              const Text(
                                "\$1,500.00USD",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16, left: 16.0, right: 16),
                  child: Container(
                    width: size.width,
                    height: 68,
                    padding: const EdgeInsets.only(
                        top: 17, left: 18.0, right: 21, bottom: 17),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0xffeae4fc),
                        width: 1,
                      ),
                      color: const Color(0xfff9f9fa),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/Vectores/Iconos/wallet.svg'),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 25,
                          ),
                          child: Text(
                            "Tus EBL se encuentran en tu billetera.",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 13,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 140, left: 15.0, right: 15, bottom: 48),
                  child: ButtonPrimary(
                      title: 'Ir a mi billetera',
                      onPressed: () {},
                      load: isLoadLogin!,
                      disabled: isLoadLogin!),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
