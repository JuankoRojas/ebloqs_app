import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/screens/wallet/wallet_screen.dart';
import 'package:ebloqs_app/src/services/token_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CongratsScreenTransfer extends StatefulWidget {
  static const routeName = 'CongratsScreenTransfer';
  final double total;
  const CongratsScreenTransfer({Key? key, required this.total})
      : super(key: key);

  @override
  State<CongratsScreenTransfer> createState() => _CongratsScreenTransferState();
}

class _CongratsScreenTransferState extends State<CongratsScreenTransfer>
    with AfterLayoutMixin<CongratsScreenTransfer> {
  bool? isLoadLogin = false;
  double? tokenValue;
  @override
  void afterFirstLayout(BuildContext context) {
    getTokenValue();
  }

  void getTokenValue() async {
    final dataToken = await TokenService().getToken(token: Preferences.token!);
    setState(() {
      tokenValue = double.parse(dataToken["ico_cost"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/png/02 1.png'),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.101964769647697),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: SvgPicture.asset(
                        'assets/Vectores/Iconos/checkcircle.svg')),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(
                    child: AutoSizeText(
                      "¡En 72 horas verificaremos tu transferencia para acreditar los!",
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
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * 0.0142276422764228),
                  child: Center(
                    child: AutoSizeText(
                      "${widget.total.toString()} EBL",
                      style: const TextStyle(
                        color: Color(0xff2504ca),
                        fontSize: 20,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.0853658536585366,
                      left: size.width * 0.0388888888888889),
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
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.0237127371273713,
                      left: size.width * 0.0388888888888889,
                      right: size.width * 0.0388888888888889),
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
                          padding: EdgeInsets.only(
                              top: size.height * 0.0118563685636856,
                              left: size.width * 0.0243055555555556,
                              right: size.width * 0.0315972222222223),
                          child: Row(
                            children: [
                              const AutoSizeText(
                                "Precio USD",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(child: Container()),
                              AutoSizeText(
                                "${(widget.total * tokenValue!)} USD",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
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
                          padding: EdgeInsets.only(
                            top: size.height * 0.0177634917949586,
                          ),
                          child: Container(
                            width: size.width,
                            height: 1,
                            color: const Color(0xffDDE2EA),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.0106454883406556,
                              left: size.width * 0.0242466227918255,
                              right: size.width * 0.0315972222222223),
                          child: Row(
                            children: [
                              const AutoSizeText(
                                "Total FEES",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(child: Container()),
                              const AutoSizeText(
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
                          padding: EdgeInsets.only(
                              top: size.height * 0.00826028320971005,
                              left: size.width * 0.0628887353144438,
                              right: size.width * 0.0315972222222223),
                          child: Row(
                            children: [
                              const AutoSizeText(
                                "Transacción FEE",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(child: Container()),
                              const AutoSizeText(
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
                          padding: EdgeInsets.only(
                              left: size.width * 0.0628887353144438,
                              right: size.width * 0.0315972222222223),
                          child: Row(
                            children: [
                              const AutoSizeText(
                                "Red FEE",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(child: Container()),
                              const AutoSizeText(
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
                          padding: EdgeInsets.only(
                            top: size.height * 0.0153586497890295,
                          ),
                          child: Container(
                            width: size.width,
                            height: 1,
                            color: const Color(0xffDDE2EA),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.0106454883406556,
                              left: size.width * 0.0242466227918255,
                              right: size.width * 0.0315972222222223),
                          child: Row(
                            children: [
                              const AutoSizeText(
                                "Total",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Expanded(child: Container()),
                              AutoSizeText(
                                "${(widget.total * tokenValue! + 4.67)} USD",
                                textAlign: TextAlign.right,
                                style: const TextStyle(
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
                  padding: EdgeInsets.only(
                    top: size.height * 0.0188583936689679,
                    left: size.width * 0.0386073767666322,
                    right: size.width * 0.0386073767666322,
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
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 25,
                          ),
                          child: AutoSizeText(
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
                  padding: EdgeInsets.only(
                      top: size.height * 0.164429530201342,
                      left: size.width * 0.0359342915811089,
                      right: size.width * 0.0359342915811089,
                      bottom: size.height * 0.0563097033685269),
                  child: ButtonPrimary(
                      width: size.width,
                      title: 'Ir a mi billetera',
                      onPressed: () {
                        Navigator.pushNamed(context, WalletScreen.routeName);
                      },
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
