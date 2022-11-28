// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/screens/indentity/nationality_screen.dart';
import 'package:ebloqs_app/src/screens/payment/payment_step1_screen.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/utils/format_money.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';

class PreviewInvestScreen extends StatefulWidget {
  static const routeName = 'PreviewInvestScreen';
  const PreviewInvestScreen({
    Key? key,
    required this.isToken,
    required this.invest,
    required this.value,
    required this.usdValue,
    required this.eblValue,
  }) : super(key: key);
  final bool isToken;
  final Map invest;
  final String value;
  final String usdValue;
  final String eblValue;

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
                      child: Center(
                        child: AutoSizeText(
                          widget.value,
                          style: const TextStyle(
                            color: Color(0xff2504CA),
                            fontSize: 58,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: AutoSizeText(
                        (widget.isToken == false)
                            ? 'USD'
                            : widget.invest['proyects'][0]['name'],
                        style: const TextStyle(
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
                                  child: AutoSizeText(
                                    "${widget.usdValue} USD",
                                    style: const TextStyle(
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
                                  child: AutoSizeText(
                                    widget.eblValue,
                                    style: const TextStyle(
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
                        children: [
                          const AutoSizeText(
                            "Interés construcción (1 año )",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AutoSizeText(
                            "\$${moneyFormated(value: double.parse(widget.invest['tokenomic'][0]['construction_interest']))}",
                            style: const TextStyle(
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
                        children: [
                          const AutoSizeText(
                            "Renting (2 años)",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AutoSizeText(
                            "\$${moneyFormated(value: double.parse(widget.invest['tokenomic'][0]['net_leasing']))}",
                            style: const TextStyle(
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
                        children: [
                          const AutoSizeText(
                            "Plusvalía (3 años)",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AutoSizeText(
                            "\$${moneyFormated(value: double.parse(widget.invest['tokenomic'][0]['plusvalia']))}",
                            style: const TextStyle(
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
                        children: [
                          const AutoSizeText(
                            "Utilidad bruta (3 años)",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          //TODO:sumatoria
                          AutoSizeText(
                            "\$${moneyFormated(value: (double.parse(widget.invest['tokenomic'][0]['construction_interest']) + double.parse(widget.invest['tokenomic'][0]['net_leasing']) + double.parse(widget.invest['tokenomic'][0]['plusvalia'])))}",
                            style: const TextStyle(
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
                        onPressed: () {
                          final idWallet = Preferences.id_wallet;
                          final publicKey = Preferences.public_key;
                          if (idWallet != null && publicKey != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentStep1Screen(
                                  usdValue: widget.usdValue,
                                  eblValue: widget.eblValue,
                                  invest: widget.invest,
                                ),
                              ),
                            );
                          } else {
                            Navigator.pushNamed(
                                context, NationalityScreen.routeName);
                          }
                        },
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
