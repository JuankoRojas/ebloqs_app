import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreviewInvestScreen extends StatefulWidget {
  static const routeName = 'PreviewInvestScreen';
  const PreviewInvestScreen({super.key});

  @override
  State<PreviewInvestScreen> createState() => _PreviewInvestScreenState();
}

class _PreviewInvestScreenState extends State<PreviewInvestScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset('assets/png/02 1.png'),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.075,
                    left: size.width * 0.037,
                    right: size.width * 0.037),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            'assets/Vectores/Iconos/Arrow left.svg',
                            color: const Color(0xff2504CA),
                          ),
                        ),
                        Expanded(child: Container()),
                        const Align(
                          alignment: Alignment.center,
                          child: Center(
                            child: AutoSizeText(
                              "Previsualización",
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
                      padding:
                          EdgeInsets.only(top: UtilSize.height(19, context)),
                      child: const Center(
                        child: AutoSizeText(
                          "25,000",
                          style: TextStyle(
                            color: Color(0xff2504CA),
                            fontSize: 58,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const Center(
                      child: AutoSizeText(
                        'USD',
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 15,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: UtilSize.height(8, context)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xffeae4fc),
                            width: 1,
                          ),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(
                          top: UtilSize.height(13, context),
                          left: UtilSize.width(13, context),
                          right: UtilSize.width(20, context),
                          bottom: UtilSize.height(13, context),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AutoSizeText(
                                  "Inviertes",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 12,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: UtilSize.height(8, context),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color(0xfff6f4fd),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: const AutoSizeText(
                                    "25,000 USD",
                                    style: TextStyle(
                                      color: Color(0xff2504CA),
                                      fontSize: 14,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SvgPicture.asset(
                                'assets/Vectores/Iconos/arrow right.svg'),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AutoSizeText(
                                  "Recibes",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 12,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: UtilSize.height(8, context),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color(0xfff6f4fd),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: const AutoSizeText(
                                    "50 EBL-HERALD-01",
                                    style: TextStyle(
                                      color: Color(0xff2504CA),
                                      fontSize: 14,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: UtilSize.height(32, context),
                          bottom: UtilSize.height(17, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AutoSizeText(
                            "Transacción FEE.",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xfffbecea),
                            ),
                            child: const AutoSizeText(
                              "Sin Comisiones",
                              style: TextStyle(
                                color: Color(0xffBA3635),
                                fontSize: 13,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xffC9D1D1),
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: UtilSize.height(17, context),
                          bottom: UtilSize.height(17, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AutoSizeText(
                            "Precio de compra",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AutoSizeText(
                            "\$25.000,00",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xffC9D1D1),
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: UtilSize.height(17, context),
                          bottom: UtilSize.height(17, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AutoSizeText(
                            "Interés construcción (1 año )",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AutoSizeText(
                            "\$925,00",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xffC9D1D1),
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: UtilSize.height(17, context),
                          bottom: UtilSize.height(17, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AutoSizeText(
                            "Renting (2 años)",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AutoSizeText(
                            "\$3.800,00",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xffC9D1D1),
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: UtilSize.height(17, context),
                          bottom: UtilSize.height(17, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AutoSizeText(
                            "Plusvalía (3 años)",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AutoSizeText(
                            "\$3.100,00",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xffC9D1D1),
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: UtilSize.height(17, context),
                          bottom: UtilSize.height(17, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AutoSizeText(
                            "Utilidad bruta (3 años)",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AutoSizeText(
                            "\$ 7.825,00",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    const AutoSizeText(
                      "*Los intereses son promedios, su naturaleza es especulativa, implican un grado de riesgo. El pago es trimestral, anual y al final de la inversión.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 11,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: UtilSize.height(17, context),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xfffcedeb),
                        ),
                        padding: EdgeInsets.only(
                          top: UtilSize.height(5, context),
                          left: UtilSize.width(26, context),
                          right: UtilSize.width(25, context),
                          bottom: UtilSize.height(5, context),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                                'assets/Vectores/Iconos/User check.svg'),
                            const AutoSizeText(
                              "Para continuar debemos validar tu identidad",
                              style: TextStyle(
                                color: Color(0xffba3635),
                                fontSize: 12,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: UtilSize.height(17, context),
                          bottom: UtilSize.height(17, context)),
                      child: ButtonPrimary(
                        width: size.width,
                        title: "Continuar",
                        onPressed: () {},
                        load: loading,
                        disabled: loading,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
