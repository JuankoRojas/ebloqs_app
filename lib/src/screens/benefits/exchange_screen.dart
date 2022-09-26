import 'package:ebloqs_app/src/screens/benefits/accumulated_points_screen.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExchangeScreen extends StatefulWidget {
  static const routeName = 'ExchangeScreen';
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  bool load = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0357142857142857,
                  left: size.width * 0.04),
              child: Row(children: [
                GestureDetector(
                  child:
                      SvgPicture.asset('assets/Vectores/Iconos/Arrow left.svg'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding:
                      EdgeInsets.only(right: size.width * 0.373333333333333),
                  child: const Text(
                    "Beneficios",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 17,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.00985221674876847),
              child: const Text(
                "Canjea tus tokens EBL por beneficios",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff170658),
                  fontSize: 15,
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.11576354679803),
              child: SvgPicture.asset(
                  'assets/Vectores/Ilustraciones/Group 1950.svg'),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0738916256157636,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: Container(
                width: size.width,
                height: size.height * 0.423645320197044,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xffccc6dc),
                    width: 1,
                  ),
                  color: const Color(0xfff9f9fa),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.041871921182266,
                      left: size.width * 0.0533333333333333,
                      right: size.width * 0.0533333333333333),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Canje",
                        style: TextStyle(
                          color: Color(0xff2504ca),
                          fontSize: 15,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.020935960591133),
                        child: const Text(
                          "¿Cómo ganar EBL con tus referidos?",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 14,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.0123152709359606),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "▪",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 13,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.0213333333333333),
                              child: SizedBox(
                                width: size.width * 0.773333333333333,
                                child: const Text(
                                  "Comparte el código que te asignamos en tus redes sociales. ",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.0123152709359606),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "▪",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 13,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.0213333333333333),
                              child: SizedBox(
                                width: size.width * 0.773333333333333,
                                child: const Text(
                                  "Si tu referido invierte más de USD 1.000 obtendrás beneficios.",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.020935960591133),
                        child: const Text(
                          "¿Cómo canjeas tus recompensas?",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 14,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.0123152709359606),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "▪",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 13,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.0213333333333333),
                              child: SizedBox(
                                width: size.width * 0.773333333333333,
                                child: const Text(
                                  "Puedes invertir tus EBLs en la tokenización de activos. ",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.0197044334975369),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ButtonPrimary(
                              width: size.width,
                              title: 'Canjear',
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AccumulatedPointsScreen.routeName);
                              },
                              load: load),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
