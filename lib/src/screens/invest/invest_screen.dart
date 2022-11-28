// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/screens/invest/preview_invest_screen.dart';
import 'package:ebloqs_app/src/services/token_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/utils/format_ebl.dart';
import 'package:ebloqs_app/src/utils/format_money.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';

class InvestScreen extends StatefulWidget {
  static const routeName = 'InvestScreen';
  const InvestScreen({
    Key? key,
    required this.invest,
  }) : super(key: key);
  final Map invest;

  @override
  State<InvestScreen> createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen> {
  String text = '';
  bool loading = false;
  double? tokenValue;
  bool isToken = false;

  void getTokenValue() async {
    final dataToken = await TokenService().getToken(token: Preferences.token!);
    setState(() {
      tokenValue = double.parse(dataToken["ico_cost"]);
    });
  }

  @override
  void initState() {
    getTokenValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (tokenValue == null) {
      return const Scaffold();
    }

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
                            child: AutoSizeText(
                              (isToken == false)
                                  ? (text.isNotEmpty)
                                      ? '${eblFormatted(ebl: ((double.parse(text)) / double.parse(widget.invest['proyects'][0]['token_price'])).toString())} ${widget.invest['proyects'][0]['name']}'
                                      : widget.invest['proyects'][0]['name']
                                  : text,
                              style: const TextStyle(
                                color: Color(0xff2504ca),
                                fontSize: 14,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          (isToken == false)
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xff170658),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  child: const AutoSizeText(
                                      "Cambiar de USD a Token",
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: 12,
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w500,
                                      )),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                            (text.isNotEmpty)
                                ? (isToken == false)
                                    ? text
                                    : eblFormatted(
                                        ebl: ((double.parse(text)) /
                                                double.parse(
                                                    widget.invest['proyects'][0]
                                                        ['token_price']))
                                            .toString())
                                : "0,00",
                            style: const TextStyle(
                              color: Color(0xff2504ca),
                              fontSize: 58,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w400,
                            )),
                        GestureDetector(
                            child: SvgPicture.asset(
                                'assets/Vectores/Iconos/Group 1749.svg'),
                            onTap: () {
                              setState(() {
                                isToken = !isToken;
                              });
                            })
                      ],
                    ),
                    AutoSizeText(
                      (isToken == false) ? "USD" : "TOKEN",
                      style: const TextStyle(
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
                              children: [
                                const AutoSizeText("Inviertes",
                                    style: TextStyle(
                                      color: Color(0xff170658),
                                      fontSize: 13,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w400,
                                    )),
                                AutoSizeText(
                                  ((double.parse(widget.invest['proyects'][0]
                                              ['tokens_available']) /
                                          1000000000000000000))
                                      .toString(),
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
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
                              children: [
                                const AutoSizeText("Inmobiliaria",
                                    style: TextStyle(
                                      color: Color(0xff170658),
                                      fontSize: 13,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w400,
                                    )),
                                AutoSizeText(
                                  widget.invest['proyects'][0]['name'],
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PreviewInvestScreen(
                                isToken: isToken,
                                invest: widget.invest,
                                value: (isToken == false)
                                    ? moneyFormated(value: double.parse(text))
                                    : eblFormatted(
                                        ebl: ((double.parse(text)) /
                                                double.parse(
                                                    widget.invest['proyects'][0]
                                                        ['token_price']))
                                            .toString()),
                                usdValue:
                                    moneyFormated(value: double.parse(text)),
                                eblValue:
                                    '${eblFormatted(ebl: ((double.parse(text)) / double.parse(widget.invest['proyects'][0]['token_price'])).toString())} ${widget.invest['proyects'][0]['name']}',
                              ),
                            ),
                          );
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

  _onKeyboardTap(String value) {
    setState(() {
      print(text);
      text = text + value;
    });
  }
}
