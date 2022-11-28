// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/screens/payment/payment_transferencia_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/screens/home_screen.dart';
import 'package:ebloqs_app/src/screens/payment/payment_step2_screen.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/button_primary_outline.dart';

class PaymentStep1Screen extends StatefulWidget {
  static const String routeName = 'PaymentStep1Screen';
  const PaymentStep1Screen({
    Key? key,
    required this.usdValue,
    required this.eblValue,
    required this.invest,
  }) : super(key: key);
  final String usdValue;
  final String eblValue;
  final Map invest;

  @override
  State<PaymentStep1Screen> createState() => _PaymentStep1ScreenState();
}

class _PaymentStep1ScreenState extends State<PaymentStep1Screen> {
  bool transferSelect = false;
  bool bankSelect = false;
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
                        color: Colors.white,
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
                              color: Color(0xff2504CA),
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
                        color: Colors.white,
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
                              color: Color(0xff2504CA),
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

            /// => Creación de la información de la pantalla
            Padding(
              padding: EdgeInsets.only(top: UtilSize.height(38, context)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xfff6f4fd),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: UtilSize.width(16, context),
                  vertical: UtilSize.height(8, context),
                ),
                child: AutoSizeText(
                  widget.eblValue,
                  style: const TextStyle(
                    color: Color(0xff2504CA),
                    fontSize: 22,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            ///=> Creación total a pagar

            Padding(
              padding: EdgeInsets.only(top: UtilSize.height(14, context)),
              child: const AutoSizeText("Total a pagar",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 12,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w400,
                  )),
            ),

            ///=> Creación del valor a pagar
            Padding(
              padding: EdgeInsets.only(top: UtilSize.height(3, context)),
              child: AutoSizeText(
                '${widget.usdValue} USD',
                style: const TextStyle(
                  color: Color(0xff170658),
                  fontSize: 28,
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            ///=> Creación del divisor de la pantalla
            Padding(
              padding: EdgeInsets.only(top: UtilSize.height(14, context)),
              child: Divider(
                color: const Color(0xffEBEDF4),
                thickness: 1,
                height: UtilSize.height(40, context),
              ),
            ),

            ///=> Creación de los métodos de pago disponibles
            Padding(
              padding: EdgeInsets.only(
                  top: UtilSize.height(21, context),
                  left: UtilSize.width(15, context),
                  right: UtilSize.width(15, context)),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  "Selecciona el método de pago",
                  style: TextStyle(
                    color: Color(0xff2504CA),
                    fontSize: 15,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            //=> Creación de selección de los métodos de pago disponibles
            //=> Creación de selección del método de pago con tarjeta
            Padding(
              padding: EdgeInsets.only(
                top: UtilSize.height(16, context),
                left: UtilSize.width(15, context),
                right: UtilSize.width(15, context),
              ),
              child: GestureDetector(
                child: Container(
                  width: size.width,
                  height: size.height * (78 / size.height),
                  padding: EdgeInsets.only(
                    left: size.width * (18 / size.width),
                    right: size.width * (18 / size.width),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: (bankSelect)
                          ? const Color(0xff170658)
                          : const Color(0xffeae4fc),
                      width: 1,
                    ),
                    color: const Color(0xfff9f9fa),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/Vectores/Iconos/card.svg',
                        color: (bankSelect)
                            ? const Color(0xff170658)
                            : const Color(0xff170658).withOpacity(0.5),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * (16 / size.width),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Tarjeta Bancaria",
                              style: TextStyle(
                                color: (bankSelect)
                                    ? const Color(0xff170658)
                                    : const Color(0xff170658).withOpacity(0.5),
                                fontSize: 15,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AutoSizeText(
                              "Tarjeta de crédito o tarjeta de débito",
                              style: TextStyle(
                                color: (bankSelect)
                                    ? const Color(0xff170658)
                                    : const Color(0xff170658).withOpacity(0.5),
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      // SvgPicture.asset(
                      //     'assets/Vectores/Iconos/chevronright.svg'),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    bankSelect = !bankSelect;
                    if (transferSelect) {
                      transferSelect = !transferSelect;
                    }
                  });
                },
              ),
            ),
            //=> Creación de selección del método de pago con transferencia
            Padding(
              padding: EdgeInsets.only(
                top: UtilSize.height(8, context),
                left: UtilSize.width(15, context),
                right: UtilSize.width(15, context),
              ),
              child: GestureDetector(
                child: Container(
                  width: size.width,
                  height: size.height * (78 / size.height),
                  padding: EdgeInsets.only(
                    left: size.width * (18 / size.width),
                    right: size.width * (18 / size.width),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: (transferSelect)
                          ? const Color(0xff170658)
                          : const Color(0xffeae4fc),
                      width: 1,
                    ),
                    color: const Color(0xfff9f9fa),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/Vectores/Iconos/bank.svg',
                        color: (transferSelect)
                            ? const Color(0xff170658)
                            : const Color(0xff170658).withOpacity(0.5),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * (16 / size.width),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Transferencia Bancaria",
                              style: TextStyle(
                                color: (transferSelect)
                                    ? const Color(0xff170658)
                                    : const Color(0xff170658).withOpacity(0.5),
                                fontSize: 15,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AutoSizeText(
                              "Desde tus bancos favoritos",
                              style: TextStyle(
                                color: (transferSelect)
                                    ? const Color(0xff170658)
                                    : const Color(0xff170658).withOpacity(0.5),
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      // SvgPicture.asset(
                      //     'assets/Vectores/Iconos/chevronright.svg'),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    transferSelect = !transferSelect;
                    if (bankSelect) {
                      bankSelect = !bankSelect;
                    }
                  });
                },
              ),
            ),
            //=> Creación de información sobre la cotización
            Padding(
              padding: EdgeInsets.only(
                top: UtilSize.height(28, context),
                left: UtilSize.width(15, context),
                right: UtilSize.width(15, context),
              ),
              child: const AutoSizeText(
                "La cotización puede variar según el método de pago. Elige el método de pago preferido.",
                style: TextStyle(
                  color: Color(0xff170658),
                  fontSize: 13,
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            ///=> Creación del botón de Salir y continuar

            Padding(
              padding: EdgeInsets.only(
                top: UtilSize.height(28, context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonPrimaryOutline(
                    width: size.width * 0.45,
                    title: "Salir",
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    load: loading,
                    disabled: loading,
                  ),
                  ButtonPrimary(
                    width: size.width * 0.45,
                    title: "Continuar",
                    onPressed: () {
                      if (bankSelect) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentStep2Screen(
                                      usdValue: widget.usdValue,
                                      invest: widget.invest,
                                      eblValue: widget.eblValue,
                                    )));
                      } else if (transferSelect) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PaymentTransferenciaScreen(
                                      cantidadTransferencia: widget.usdValue,
                                      invest: widget.invest,
                                      eblValue: widget.eblValue,
                                    )));
                      }
                    },
                    load: loading,
                    disabled: loading,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
