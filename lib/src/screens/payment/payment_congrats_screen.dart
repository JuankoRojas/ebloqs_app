// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';

class PaymentCongratsScreen extends StatefulWidget {
  static const routeName = 'PaymentCongratsScreen';
  const PaymentCongratsScreen({
    Key? key,
    required this.invest,
    required this.cardNumber,
    required this.usdValue,
    required this.eblValue,
  }) : super(key: key);
  final Map invest;
  final String cardNumber;
  final String usdValue;
  final String eblValue;

  @override
  State<PaymentCongratsScreen> createState() => _PaymentCongratsScreenState();
}

class _PaymentCongratsScreenState extends State<PaymentCongratsScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ///=> Cración de la imagen de fondo de la pantalla
            Image.asset('assets/png/02 1.png'),

            ///=> Creación del icono y el texto de felicitaciones
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.101964769647697),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: SvgPicture.asset(
                    'assets/Vectores/Iconos/checkcircle.svg',
                    width: UtilSize.width(60, context),
                  )),
                  Padding(
                    padding:
                        EdgeInsets.only(top: size.height * 0.018970189701897),
                    child: const Center(
                      child: AutoSizeText(
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
                  //=> Creación del texto de la inversión realizada
                  Padding(
                    padding: EdgeInsets.only(top: UtilSize.height(12, context)),
                    child: Align(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        "INVERSIÓN ${widget.invest['proyects'][0]['name'].toString().toUpperCase()}",
                        style: const TextStyle(
                          color: Color(0xff2504CA),
                          fontSize: 20,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  ///=> Creación del resumen de la compra realizada
                  Padding(
                    padding: EdgeInsets.only(
                        top: UtilSize.height(72, context),
                        left: UtilSize.width(15, context),
                        right: UtilSize.width(16, context)),
                    child: const AutoSizeText(
                      "Resumen de tu compra",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 13,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  ///=> Creación de la tarjeta de resumen de la compra

                  Padding(
                    padding: EdgeInsets.only(
                        top: UtilSize.height(10, context),
                        left: UtilSize.width(15, context),
                        right: UtilSize.width(15, context)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: const Color(0xffdce2ea),
                          width: 1,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x60cad3d5),
                            blurRadius: 15,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: UtilSize.height(9, context),
                                left: UtilSize.width(10, context),
                                right: UtilSize.width(13, context)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: UtilSize.width(94, context),
                                  height: UtilSize.height(65, context),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                      widget.invest['proyects'][0]['pic_1'],
                                      fit: BoxFit.cover),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: UtilSize.width(13, context),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const AutoSizeText(
                                        "Proyecto",
                                        style: TextStyle(
                                          color: Color(0xff170658),
                                          fontSize: 13,
                                          fontFamily: "Archivo",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      AutoSizeText(
                                        widget.invest['proyects'][0]['name'],
                                        style: const TextStyle(
                                          color: Color(0xff2504CA),
                                          fontSize: 14,
                                          fontFamily: "Archivo",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                const AutoSizeText(
                                  "Ver detalles",
                                  style: TextStyle(
                                    color: Color(0xff2504CA),
                                    fontSize: 13,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: UtilSize.height(14, context),
                            ),
                            child: const Divider(
                              color: Color(0xffdce2ea),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: UtilSize.height(12, context),
                                left: UtilSize.width(10, context),
                                right: UtilSize.width(13, context)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AutoSizeText(
                                  "Método de Pago",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 13,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                AutoSizeText(
                                  "●●●● ${widget.cardNumber.substring(widget.cardNumber.length - 5)}",
                                  style: const TextStyle(
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
                            padding: EdgeInsets.only(
                              top: UtilSize.height(14, context),
                            ),
                            child: const Divider(
                              color: Color(0xffdce2ea),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: UtilSize.height(12, context),
                                left: UtilSize.width(10, context),
                                right: UtilSize.width(13, context)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AutoSizeText(
                                  "Costo en USD",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 13,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                AutoSizeText(
                                  "\$${widget.usdValue}",
                                  style: const TextStyle(
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
                            padding: EdgeInsets.only(
                              top: UtilSize.height(14, context),
                            ),
                            child: const Divider(
                              color: Color(0xffdce2ea),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: UtilSize.height(12, context),
                                left: UtilSize.width(10, context),
                                right: UtilSize.width(13, context)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AutoSizeText(
                                  "Total tokens",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 13,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                AutoSizeText(
                                  widget.eblValue,
                                  style: const TextStyle(
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
                            padding: EdgeInsets.only(
                              top: UtilSize.height(14, context),
                            ),
                            child: const Divider(
                              color: Color(0xffdce2ea),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: UtilSize.height(12, context),
                                left: UtilSize.width(10, context),
                                right: UtilSize.width(13, context),
                                bottom: UtilSize.height(12, context)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                AutoSizeText(
                                  "Comisión Tarjeta",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 13,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                AutoSizeText(
                                  "\$1,25",
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
                        ],
                      ),
                    ),
                  ),

                  ///=> Creación de tus token en billetera
                  Padding(
                    padding: EdgeInsets.only(
                      top: UtilSize.height(24, context),
                      left: UtilSize.width(15, context),
                      right: UtilSize.width(15, context),
                    ),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.079959684192844,
                      padding: EdgeInsets.only(
                          top: size.height * 0.0200134544231416,
                          left: size.width * 0.0433287482806053,
                          right: size.width * 0.0504288164665524,
                          bottom: size.height * 0.0200134544231416),
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
                          Padding(
                            padding: EdgeInsets.only(
                              left: UtilSize.width(25, context),
                            ),
                            child: const AutoSizeText(
                              "Tus tokens se encuentran en tu billetera.",
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

                  ///=> Creación del botón para seguir explorando proyectos
                  Padding(
                    padding: EdgeInsets.only(
                      top: UtilSize.height(48, context),
                      left: UtilSize.width(15, context),
                      right: UtilSize.width(15, context),
                      bottom: UtilSize.height(58, context),
                    ),
                    child: ButtonPrimary(
                      width: size.width,
                      title: "Sigues Explorando proyectos",
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                      load: loading,
                      disabled: loading,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
