// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/screens/home_screen.dart';
import 'package:ebloqs_app/src/screens/payment/payment_step3_screen.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/button_primary_outline.dart';
import 'package:ebloqs_app/src/widgets/custom_modal_bottom_alert.dart';

class PaymentStep2Screen extends StatefulWidget {
  static const routeName = 'PaymentStep2Screen';
  final String usdValue;
  final String eblValue;
  final Map invest;
  const PaymentStep2Screen({
    Key? key,
    required this.usdValue,
    required this.eblValue,
    required this.invest,
  }) : super(key: key);

  @override
  State<PaymentStep2Screen> createState() => _PaymentStep2ScreenState();
}

class _PaymentStep2ScreenState extends State<PaymentStep2Screen> {
  final GlobalKey<FormState> _paymentCardForm = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  String dateExpired = '';
  final TextEditingController cvvController = TextEditingController();
  String? errorValidation;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
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

              ///=> Creación del texto de la pantalla
              Padding(
                padding: EdgeInsets.only(
                    top: UtilSize.height(36, context),
                    left: UtilSize.width(15, context),
                    right: UtilSize.width(15, context)),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "Ingresa tu tarjeta de crédito",
                    style: TextStyle(
                      color: Color(0xff2504CA),
                      fontSize: 15,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              ///=> Creación de formulario para ingresar los datos de la tarjeta
              Padding(
                padding: EdgeInsets.only(
                    top: UtilSize.height(37, context),
                    left: UtilSize.width(15, context),
                    right: UtilSize.width(15, context)),
                child: Form(
                  key: _paymentCardForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          controller: cardNumberController,
                          keyboardType: TextInputType.number,
                          maxLength: 50,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp("[0-9]"))
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
                      SizedBox(
                        width: size.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                          borderRadius:
                                              BorderRadius.circular(4),
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
                            SizedBox(
                              width: UtilSize.width(23, context),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: size.height * 0.00985221674876847),
                                    child: const AutoSizeText(
                                      "CVV",
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
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp("[0-9/]"))
                                      ],
                                      controller: cvvController,
                                      maxLength: 3,
                                      decoration: InputDecoration(
                                        hintText: "000",
                                        labelStyle: TextStyle(
                                          color: const Color(0xff9B99A3),
                                          fontSize: UtilSize.width(14, context),
                                          fontFamily: "Archivo",
                                          fontWeight: FontWeight.w400,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
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
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              ///=> Creación del botón de Salir y continuar

              Padding(
                padding: EdgeInsets.only(
                  top: UtilSize.height(204, context),
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
                        if (_paymentCardForm.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          Future.delayed(Duration.zero, () {
                            setState(() {
                              loading = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentStep3Screen(
                                  cardName: nameController.text,
                                  cardNumber: cardNumberController.text,
                                  cardCVV: cvvController.text,
                                  usdValue: widget.usdValue,
                                  invest: widget.invest,
                                  eblValue: widget.eblValue,
                                ),
                              ),
                            );
                          });
                        } else {
                          setState(() {
                            errorValidation =
                                'Por favor,  debes completar todos los registros para continuar';
                          });
                          customModalBottomAlert(
                              context, size, errorValidation, loading, '', () {
                            Navigator.pop(context);
                          });
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
        ),
      )),
    );
  }
}
