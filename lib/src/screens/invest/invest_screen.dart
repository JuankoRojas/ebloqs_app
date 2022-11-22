import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class InvestScreen extends StatefulWidget {
  static const routeName = 'InvestScreen';
  const InvestScreen({super.key});

  @override
  State<InvestScreen> createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen> {
  String text = '';
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
                              "Invertir",
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
                          EdgeInsets.only(top: UtilSize.height(28, context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xfff6f4fd),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const AutoSizeText(
                              "0 EBL-HERALD-01",
                              style: TextStyle(
                                color: Color(0xff2504ca),
                                fontSize: 14,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xff170658),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: const AutoSizeText("Cambiar de USD a Token",
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 12,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w500,
                                )),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AutoSizeText("0,00",
                            style: TextStyle(
                              color: Color(0xff2504ca),
                              fontSize: 58,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w400,
                            )),
                        SvgPicture.asset(
                            'assets/Vectores/Iconos/Group 1749.svg')
                      ],
                    ),
                    const AutoSizeText(
                      "USD",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 15,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: UtilSize.height(34, context)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xffeae4fc),
                            width: 1,
                          ),
                          color: const Color(0xfff9f9fa),
                        ),
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 13,
                          top: 12,
                          bottom: 13,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                AutoSizeText("INVIERTES",
                                    style: TextStyle(
                                      color: Color(0xff170658),
                                      fontSize: 13,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w400,
                                    )),
                                AutoSizeText(
                                  "7857",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xff2504ca),
                                    fontSize: 13,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                AutoSizeText("Inmobiliaria",
                                    style: TextStyle(
                                      color: Color(0xff170658),
                                      fontSize: 13,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w400,
                                    )),
                                AutoSizeText(
                                  "Heráldica",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xff2504ca),
                                    fontSize: 13,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: UtilSize.height(8, context)),
                      child: const AutoSizeText("Monto mínimo: \$500",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 12,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: UtilSize.height(33, context)),
                      child: const Divider(),
                    ),
                    NumericKeyboard(
                      onKeyboardTap: _onKeyboardTap,
                      textColor: const Color(0xff170658),
                      rightButtonFn: () {
                        setState(() {
                          if (text.isNotEmpty) {
                            text = text.substring(0, text.length - 1);
                          }
                        });
                      },
                      rightIcon: const Icon(
                        Icons.backspace_outlined,
                        color: Color(0xff170658),
                      ),
                      // leftButtonFn: () {
                      //   setState(() {
                      //     text = "$text.";
                      //   });
                      // },
                      // leftIcon: const Icon(
                      //   Icons.circle,
                      //   color: Color(0xff170658),
                      //   size: 6,
                      // ),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: UtilSize.height(37, context)),
                      child: ButtonPrimary(
                        width: size.width,
                        title: 'Previsualizar inversión',
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

  _onKeyboardTap(String value) {
    setState(() {
      print(text);
      text = text + value;
    });
  }
}
