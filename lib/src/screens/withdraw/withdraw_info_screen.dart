// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/screens/wallet/wallet_screen.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';

class WithDrawInfoScreen extends StatefulWidget {
  static const routeName = 'WithDrawInfoScreen';
  const WithDrawInfoScreen({
    Key? key,
    required this.amount,
  }) : super(key: key);
  final String amount;
  @override
  State<WithDrawInfoScreen> createState() => _WithDrawInfoScreenState();
}

class _WithDrawInfoScreenState extends State<WithDrawInfoScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: UtilSize.width(15, context),
                    right: UtilSize.width(15, context)),
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
                      "Retiro beneficiario",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 17,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                        child: SvgPicture.asset(
                            'assets/Vectores/Iconos/Question.svg')),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: UtilSize.height(35, context),
                    left: UtilSize.width(15, context),
                    right: UtilSize.width(15, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AutoSizeText(
                      "USD",
                      style: TextStyle(
                        color: Color(0xff2504CA),
                        fontSize: 28,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    AutoSizeText(
                      widget.amount,
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
              Padding(
                padding: EdgeInsets.only(
                    top: UtilSize.height(16, context),
                    left: UtilSize.width(15, context),
                    right: UtilSize.width(15, context)),
                child: const AutoSizeText(
                  "Recibirás tus fondos a la cuenta que indicaste desde la cuenta bancaria ebloqs 4511*****372",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 13,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: UtilSize.height(25, context),
                    left: UtilSize.width(15, context),
                    right: UtilSize.width(15, context)),
                child: Container(
                  padding: EdgeInsets.only(
                      top: UtilSize.height(22, context),
                      left: UtilSize.width(13, context),
                      right: UtilSize.width(22, context),
                      bottom: UtilSize.height(20, context)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffccc6dc),
                      width: 1,
                    ),
                    color: const Color(0xfff9f9fa),
                  ),
                  child: const AutoSizeText(
                    "El área financiera procesara la transferencia en un lapso de 72 horas laborables.",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 12,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: UtilSize.height(427, context),
                    left: UtilSize.width(15, context),
                    right: UtilSize.width(15, context)),
                child: ButtonPrimary(
                  width: size.width,
                  title: "Terminar",
                  onPressed: () {
                    Navigator.pushNamed(context, WalletScreen.routeName);
                  },
                  load: loading,
                  disabled: loading,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
