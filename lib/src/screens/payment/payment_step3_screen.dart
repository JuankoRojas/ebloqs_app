// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/screens/payment/payment_congrats_screen.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';

class PaymentStep3Screen extends StatefulWidget {
  static const routeName = 'PaymentStep3Screen';
  const PaymentStep3Screen({
    Key? key,
    required this.invest,
    required this.cardName,
    required this.cardNumber,
    required this.cardCVV,
    required this.usdValue,
    required this.eblValue,
  }) : super(key: key);

  final Map invest;
  final String cardName;
  final String cardNumber;
  final String cardCVV;
  final String usdValue;
  final String eblValue;

  @override
  State<PaymentStep3Screen> createState() => _PaymentStep3ScreenState();
}

class _PaymentStep3ScreenState extends State<PaymentStep3Screen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ///=> Creación del header de la pantalla
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.0711864406779662,
                  right: size.width * 0.0454079890747696),
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
                    "Pago",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 17,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(child: Container()),
                  SizedBox(
                    width: UtilSize.width(30, context),
                  )
                ],
              ),
            ),

            /// => Creación del step by step de la pantalla
            Padding(
              padding: EdgeInsets.only(top: UtilSize.height(32, context)),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xff2504CA),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color(0xff2504CA),
                          width: 1,
                        ),
                      ),
                      child: const Center(
                          child: Text(
                        '1',
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontFamily: 'Archivo',
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      )),
                    ),
                    Container(
                      width: size.width * 0.27,
                      height: 2,
                      color: const Color(0xffEBEDF4),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xff2504CA),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color(0xff2504CA),
                          width: 1,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Archivo',
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.27,
                      height: 2,
                      color: const Color(0xffEBEDF4),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xff2504CA),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color(0xff2504CA),
                          width: 1,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Archivo',
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ///=> Creación del texto de la pantalla
            Padding(
              padding: EdgeInsets.only(
                  top: UtilSize.height(36, context),
                  left: UtilSize.width(15, context),
                  right: UtilSize.width(15, context)),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  "Información de la tarjeta",
                  style: TextStyle(
                    color: Color(0xff2504CA),
                    fontSize: 15,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            ///=> Creación de la imagen de la tarjeta
            Padding(
              padding: EdgeInsets.only(
                  top: UtilSize.height(16, context),
                  left: UtilSize.width(15, context),
                  right: UtilSize.width(15, context)),
              child: SizedBox(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset("assets/Imagenes/Group 2172.png"),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: UtilSize.height(35, context),
                          left: UtilSize.width(15, context),
                          right: UtilSize.width(36, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                widget.cardName.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: UtilSize.height(10, context),
                                ),
                                child: AutoSizeText(
                                  widget.cardNumber,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const AutoSizeText(
                                "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: UtilSize.height(10, context),
                                ),
                                child: AutoSizeText(
                                  widget.cardCVV,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
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
            ),

            ///=> creación de icono de agregado con éxito

            Padding(
              padding: EdgeInsets.only(
                top: UtilSize.height(22, context),
              ),
              child: SizedBox(
                child: SvgPicture.asset("assets/Vectores/Iconos/addCard.svg"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: UtilSize.height(9, context),
              ),
              child: const AutoSizeText("¡Agregada con éxito!",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 14,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  )),
            ),

            ///=> Creación del divisor de la pantalla
            Padding(
              padding: EdgeInsets.only(
                top: UtilSize.height(33, context),
              ),
              child: const Divider(
                color: Color(0xffEBEDF4),
                thickness: 1,
              ),
            ),

            ///=> Creación del total a pagar
            Padding(
              padding: EdgeInsets.only(
                  top: UtilSize.height(117, context),
                  left: UtilSize.width(15, context),
                  right: UtilSize.width(15, context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AutoSizeText("Total a pagar",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 13,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w400,
                      )),
                  AutoSizeText(
                    "${widget.usdValue} USD",
                    style: const TextStyle(
                      color: Color(0xff2504CA),
                      fontSize: 28,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            ///=> Creación del botón de registar pago
            Padding(
              padding: EdgeInsets.only(
                  top: UtilSize.height(39, context),
                  left: UtilSize.width(15, context),
                  right: UtilSize.width(15, context)),
              child: ButtonPrimary(
                width: size.width,
                title: "Registrar Pago",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentCongratsScreen(
                          invest: widget.invest,
                          cardNumber: widget.cardNumber,
                          usdValue: widget.usdValue,
                          eblValue: widget.eblValue),
                    ),
                  );
                },
                load: loading,
                disabled: loading,
              ),
            )
          ],
        ),
      )),
    );
  }
}
