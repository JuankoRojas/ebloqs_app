import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';

import 'package:ebloqs_app/src/screens/buy/congrats_screen.dart';
import 'package:ebloqs_app/src/services/auth_user_service.dart';
import 'package:ebloqs_app/src/services/token_service.dart';
import 'package:ebloqs_app/src/services/transactions_service.dart';
import 'package:ebloqs_app/src/services/transfer_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/custom_modal_bottom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroducirCantidadTarjetaScreen extends StatefulWidget {
  static const String routeName = 'IntroducirCantidadTarjetaScreen';
  final String? cantidadTarjeta;
  const IntroducirCantidadTarjetaScreen({Key? key, this.cantidadTarjeta})
      : super(key: key);

  @override
  State<IntroducirCantidadTarjetaScreen> createState() =>
      _IntroducirCantidadTarjetaScreenState();
}

class _IntroducirCantidadTarjetaScreenState
    extends State<IntroducirCantidadTarjetaScreen>
    with AfterLayoutMixin<IntroducirCantidadTarjetaScreen> {
  final GlobalKey<FormState> formKey7 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey8 = GlobalKey<FormState>();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  String dateExpired = '';
  final TextEditingController cvvController = TextEditingController();

  final int _current = 0;
  double comision = 50.00;
  double? cantidad;
  double? recibes;
  double total = 0.0;
  bool isLoading = false;
  String? errorValidation;
  bool setTransaction = false;
  bool? isLoadingTransfer = false;
  String referencia = '';
  String? randomNum1;
  var userInfoData;
  double? tokenValue;
  @override
  void initState() {
    quantityController.text = widget.cantidadTarjeta!;
    userInfo();
    final random = Random();
    const availableNum = '1234567890';
    randomNum1 = List.generate(
        9, (index) => availableNum[random.nextInt(availableNum.length)]).join();
    super.initState();
  }

  void userInfo() async {
    userInfoData =
        await AuthUserService().getUserInfo(accesstoken: Preferences.token!);
    setState(() {});
  }

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
    if (widget.cantidadTarjeta!.isNotEmpty &&
        quantityController.text == widget.cantidadTarjeta) {
      cantidad = double.parse(widget.cantidadTarjeta!);
      recibes = cantidad;
      print(cantidad);
      print(recibes);
    }
    if (recibes != null && tokenValue != null) {
      total = recibes! / tokenValue!;
    }
    if (userInfoData != null) {
      referencia = userInfoData['idRef'];
    }
    // if (setTransaction) {
    //   return Scaffold(
    //     body: Center(
    //       child: Lottie.asset('assets/lottie/X2lNy3zK9f.json'),
    //     ),
    //   );
    // }
    return Scaffold(
      extendBodyBehindAppBar: true,
      //appBar: AppBar(
      //  elevation: 0,
      //  backgroundColor: Colors.transparent,
      //  systemOverlayStyle: systemBarDark,
      //),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: size.width * (16 / size.width),
              right: size.width * (16 / size.width),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                      "Introduce la cantidad",
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
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * (15 / size.height),
                  ),
                  child: const AutoSizeText(
                    "Cantidad",
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
                    top: size.height * (8 / size.height),
                  ),
                  child: Form(
                    key: formKey7,
                    child: TextFormField(
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 1,
                              height: size.height * (32 / size.height),
                              color: const Color(0xffCDCCD1),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: size.width * (10 / size.width),
                                right: size.width * (19 / size.width),
                              ),
                              child: const AutoSizeText(
                                "USD",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xff2504ca),
                                  fontSize: 14,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        labelStyle: TextStyle(
                          color: const Color(0xff9B99A3),
                          fontSize: UtilSize.width(14, context),
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            cantidad = double.parse(value);
                            recibes = cantidad;
                          }
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * (19 / size.height),
                  ),
                  child: const AutoSizeText(
                    "Recibes:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * (6 / size.height),
                  ),
                  child: Row(
                    children: [
                      AutoSizeText(
                        recibes.toString(),
                        style: const TextStyle(
                          color: Color(0xff2504ca),
                          fontSize: 28,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const AutoSizeText(
                        " USD",
                        style: TextStyle(
                          color: Color(0xff2504ca),
                          fontSize: 28,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * (19 / size.height),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AutoSizeText(
                        "Método de transacción:",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                        ),
                      ),
                      AutoSizeText(
                        "VISA",
                        textAlign: TextAlign.right,
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
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * (14 / size.height),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        "Comisión transacción:",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                        ),
                      ),
                      AutoSizeText(
                        "${comision.toString()} USD",
                        textAlign: TextAlign.right,
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
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * (48 / size.height),
                  ),
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xffccc6dc),
                        width: 1,
                      ),
                      color: const Color(0xfff9f9fa),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: UtilSize.height(24, context),
                        right: UtilSize.width(13, context),
                        bottom: UtilSize.height(31, context),
                        left: UtilSize.width(13, context),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              AutoSizeText(
                                "Añadir información de la tarjeta.",
                                style: TextStyle(
                                  color: Color(0xff2504ca),
                                  fontSize: 15,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // GestureDetector(
                              //   child: SvgPicture.asset(
                              //       'assets/Vectores/Iconos/X.svg'),
                              //   onTap: () {},
                              // )
                            ],
                          ),
                          Form(
                            key: formKey8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.0257142857142857),
                                  child: const AutoSizeText(
                                    "Nombre en Tarjeta",
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
                                      top: size.height * 0.00985221674876847),
                                  child: TextFormField(
                                    controller: nameController,
                                    keyboardType: TextInputType.name,
                                    maxLength: 50,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[a-zA-Z ]"))
                                    ],
                                    decoration: InputDecoration(
                                      counterText: '',
                                      labelStyle: TextStyle(
                                        color: const Color(0xff9B99A3),
                                        fontSize: UtilSize.width(14, context),
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        setState(() {
                                          errorValidation =
                                              'Por favor,  debes completar todos los registros para continuar';
                                        });

                                        return '';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.0197044334975369),
                                  child: const AutoSizeText(
                                    "Número de la tarjeta",
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
                                      top: size.height * 0.00985221674876847),
                                  child: TextFormField(
                                    controller: bankNameController,
                                    keyboardType: TextInputType.number,
                                    maxLength: 50,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"))
                                    ],
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                        color: const Color(0xff9B99A3),
                                        fontSize: UtilSize.width(14, context),
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        setState(() {
                                          errorValidation =
                                              'Por favor,  debes completar todos los registros para continuar';
                                        });

                                        return '';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.00985221674876847),
                                  child: const AutoSizeText(
                                    "F. Vencimiento",
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
                                      top: size.height * 0.00985221674876847),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9/]"))
                                    ],
                                    controller: expirationDateController,
                                    maxLength: 5,
                                    decoration: InputDecoration(
                                      hintText: "MM/AA",
                                      labelStyle: TextStyle(
                                        color: const Color(0xff9B99A3),
                                        fontSize: UtilSize.width(14, context),
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    onChanged: (String? value) {
                                      // if (value!.length < dateExpired.length) {
                                      //   value = '';
                                      // } else if (value.length == 1 &&
                                      //     (int.parse(value) < 10 &&
                                      //         int.parse(value) >= 1)) {
                                      //   Future.delayed(
                                      //       const Duration(milliseconds: 100),
                                      //       () {
                                      //     expirationDateController.text =
                                      //         '0$value/';
                                      //     expirationDateController.selection =
                                      //         TextSelection.fromPosition(
                                      //             TextPosition(
                                      //                 offset:
                                      //                     expirationDateController
                                      //                         .text.length));
                                      //   });
                                      //   // value = '0$value/';
                                      // } else if (value.length == 2 &&
                                      //     (value == '10' ||
                                      //         value == '11' ||
                                      //         value == '12')) {
                                      //   value += '/';
                                      // } else if (!value.contains('/') &&
                                      //     value.length == 2) {
                                      //   if (int.parse(value) > 12) {
                                      //     value = '${value[0]}/${value[1]}';
                                      //   }
                                      // }
                                      // value.replaceAll('//', '/');
                                      // setState(() {
                                      //   expirationDateController.text = value!;
                                      //   dateExpired = value;
                                      //   expirationDateController.selection =
                                      //       TextSelection.fromPosition(
                                      //           TextPosition(
                                      //               offset:
                                      //                   expirationDateController
                                      //                       .text.length));
                                      // });
                                      // if (expirationDateController.text.length ==
                                      //     5) {
                                      //   try {
                                      //     DateTime date = DateFormat("MM/yyyy")
                                      //         .parseStrict(value);
                                      //     if (date.isBefore(DateTime.now())) {
                                      //       setState(() {
                                      //         errorValidation = 'Fecha vencida';
                                      //       });
                                      //       print(errorValidation);
                                      //     }
                                      //   } catch (e) {
                                      //     return print(e);
                                      //   }
                                      // }
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        setState(() {
                                          errorValidation =
                                              'Por favor,  debes completar todos los registros para continuar';
                                        });

                                        return '';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * (20 / size.height),
                    bottom: size.height * (56 / size.height),
                  ),
                  child: ButtonPrimary(
                    width: size.width,
                    title: 'Continuar',
                    onPressed: () async {
                      if (formKey8.currentState!.validate()) {
                        setState(() {
                          setTransaction = true;
                          isLoadingTransfer = true;
                        });
                        var amount =
                            double.parse(quantityController.text) / tokenValue!;
                        var parsedAmount = amount.toInt();
                        try {
                          final response = await TransferService().transfer(
                              to: Preferences.public_key!,
                              amount: parsedAmount.toString());
                          if (response.isNotEmpty && response['data'] != null) {
                            if (Preferences.public_key != null &&
                                Preferences.token != null &&
                                Preferences.userName != null) {
                              final responseTransaction =
                                  await TransactionsService().createTransaction(
                                      token: Preferences.token!,
                                      refId: referencia,
                                      client: Preferences.public_key!,
                                      amount: recibes.toString(),
                                      clientName: Preferences.userName!,
                                      paymentNumber: bankNameController.text,
                                      status: 1,
                                      type: 1,
                                      id: randomNum1.toString());
                              if (responseTransaction.isNotEmpty) {
                                setState(() {
                                  setTransaction = false;
                                  isLoadingTransfer = false;
                                });
                                debugPrint(response.toString());
                                Future.delayed(Duration.zero).then(
                                  (_) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => CongratsScreen(
                                        total: total,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }
                          }
                        } catch (e) {
                          debugPrint(e.toString());
                          setState(() {
                            setTransaction = false;
                            isLoadingTransfer = false;
                          });
                        }
                      } else {
                        setState(() {
                          errorValidation =
                              'Por favor,  debes completar todos los registros para continuar';
                        });
                        customModalBottomAlert(
                            context, size, errorValidation, isLoading, '', () {
                          Navigator.pop(context);
                        });
                        setState(() {
                          setTransaction = false;
                          isLoadingTransfer = false;
                        });
                      }
                    },
                    load: isLoadingTransfer!,
                    disabled: isLoadingTransfer!,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
