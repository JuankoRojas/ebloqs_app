import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DepositMethodsScreen extends StatefulWidget {
  static const String routeName = 'DepositMethodsScreen';
  const DepositMethodsScreen({Key? key}) : super(key: key);

  @override
  State<DepositMethodsScreen> createState() => _DepositMethodsScreenState();
}

class _DepositMethodsScreenState extends State<DepositMethodsScreen> {
  bool? isLoadLogin = false;
  bool selectedTransfer = false;
  bool appleGooglePay = false;
  bool creditDebitCard = false;
  String? method;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "USD", child: AutoSizeText("USD")),
      const DropdownMenuItem(value: "Euros", child: AutoSizeText("Euros")),
      // const DropdownMenuItem(value: "Pesos", child: AutoSizeText("Pesos")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    String? selectedValue;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: size.height * 0.0726481419484433),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.0716968248548994,
                      right: size.width * 0.045299727520436),
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
                        "Depositar",
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
                      top: size.height * 0.0386223039625481,
                      left: size.width * 0.0404349303431873),
                  child: const AutoSizeText(
                    "Divisas",
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
                    top: size.height * 0.00935203740814964,
                    left: size.width * 0.0404349303431873,
                    right: size.width * 0.0404349303431873,
                  ),
                  child: DropdownButtonFormField(
                      icon: SvgPicture.asset(
                          'assets/Vectores/Iconos/dwon chevron.svg'),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffcdccd1), width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffcdccd1), width: 0.0),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.0607172643869892,
                      left: size.width * 0.0409215955983494,
                      right: size.width * 0.0409215955983494),
                  child: const AutoSizeText(
                    "Métodos para depositar",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 15,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.0279906697767411,
                      left: size.width * 0.0409215955983494,
                      right: size.width * 0.0409215955983494),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedTransfer = !selectedTransfer;
                            creditDebitCard = false;
                            appleGooglePay = false;
                            if (selectedTransfer == true) {
                              method = 'Transferencia Bancaria';
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffF6F4FD)),
                          child: Icon(
                            Icons.circle,
                            size: 12,
                            color: selectedTransfer
                                ? const Color(0xff2504CA)
                                : const Color(0xffF6F4FD),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.0261016949152543,
                        ),
                        child: const AutoSizeText(
                          "Transferencia Bancaria",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 14,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.0279906697767411,
                      left: size.width * 0.0409215955983494,
                      right: size.width * 0.0409215955983494),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            appleGooglePay = !appleGooglePay;
                            creditDebitCard = false;
                            selectedTransfer = false;
                            if (appleGooglePay == true) {
                              method = 'Apple o Google Pay';
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffF6F4FD)),
                          child: Icon(
                            Icons.circle,
                            size: 12,
                            color: appleGooglePay
                                ? const Color(0xff2504CA)
                                : const Color(0xffF6F4FD),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.0261016949152543,
                        ),
                        child: const AutoSizeText(
                          "Apple o Google Pay",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 14,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.0279906697767411,
                      left: size.width * 0.0409215955983494,
                      right: size.width * 0.0409215955983494),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            creditDebitCard = !creditDebitCard;
                            selectedTransfer = false;
                            appleGooglePay = false;
                            if (creditDebitCard == true) {
                              method = 'Tarjeta crédito o debito.';
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffF6F4FD)),
                          child: Icon(
                            Icons.circle,
                            size: 12,
                            color: creditDebitCard
                                ? const Color(0xff2504CA)
                                : const Color(0xffF6F4FD),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.0261016949152543,
                        ),
                        child: const AutoSizeText(
                          "Tarjeta crédito o debito.",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 14,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.353723404255319,
                      left: size.width * 0.0409215955983494,
                      right: size.width * 0.0409215955983494),
                  child: ButtonPrimary(
                      width: size.width,
                      title: 'Continuar',
                      onPressed: () {},
                      load: isLoadLogin!,
                      disabled: isLoadLogin!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
