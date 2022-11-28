import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/custom_modal_bottom_alert.dart';
import 'package:ebloqs_app/src/widgets/google_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WithDrawScreen extends StatefulWidget {
  static const routeName = 'WithDrawScreen';
  const WithDrawScreen({super.key});

  @override
  State<WithDrawScreen> createState() => _WithDrawScreenState();
}

class _WithDrawScreenState extends State<WithDrawScreen> {
  bool selectedTransfer = false;
  // bool appleGooglePay = false;
  bool ebloqscard = false;
  String? method;
  bool loading = false;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "USD", child: AutoSizeText("USD")),
      const DropdownMenuItem(value: "Euros", child: AutoSizeText("Euros")),
      const DropdownMenuItem(value: "Pesos", child: AutoSizeText("Pesos")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String? selectedValue;
    bool isLoading = false;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///=> Creación del header de la pantalla de retiro
              Padding(
                padding: EdgeInsets.only(
                    left: UtilSize.width(20, context),
                    right: UtilSize.width(20, context)),
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
                      "Retirar",
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

              ///=> Creación del widget de las divisas
              Padding(
                padding: EdgeInsets.only(
                    top: UtilSize.height(37, context),
                    left: UtilSize.width(17, context)),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "Divisas",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
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

              ///=> Creación de los metodos para retirar
              Padding(
                padding: EdgeInsets.only(
                    top: UtilSize.height(52, context),
                    left: UtilSize.width(17, context)),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "Métodos para retirar",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 15,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              //=> métodos
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
                          ebloqscard = false;
                          // appleGooglePay = false;
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
              // Padding(
              //   padding: EdgeInsets.only(
              //       top: size.height * 0.0279906697767411,
              //       left: size.width * 0.0409215955983494,
              //       right: size.width * 0.0409215955983494),
              //   child: Row(
              //     children: [
              //       InkWell(
              //         onTap: () {
              //           setState(() {
              //             appleGooglePay = !appleGooglePay;
              //             ebloqscard = false;
              //             selectedTransfer = false;
              //             if (appleGooglePay == true) {
              //               method = 'Apple o Google Pay';
              //             }
              //           });
              //         },
              //         child: Container(
              //           padding: const EdgeInsets.all(6),
              //           decoration: const BoxDecoration(
              //               shape: BoxShape.circle, color: Color(0xffF6F4FD)),
              //           child: Icon(
              //             Icons.circle,
              //             size: 12,
              //             color: appleGooglePay
              //                 ? const Color(0xff2504CA)
              //                 : const Color(0xffF6F4FD),
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.only(
              //           left: size.width * 0.0261016949152543,
              //         ),
              //         child: const AutoSizeText(
              //           "Apple o Google Pay",
              //           style: TextStyle(
              //             color: Color(0xff170658),
              //             fontSize: 14,
              //             fontFamily: "Archivo",
              //             fontWeight: FontWeight.w400,
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
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
                          ebloqscard = !ebloqscard;
                          selectedTransfer = false;
                          // appleGooglePay = false;
                          if (ebloqscard == true) {
                            method = 'Tarjeta crédito o debito.';
                            customModalBottomAlert(
                                context,
                                size,
                                'La opción de tarjeta ebloqs se habilitará en la etapa 2.',
                                isLoading,
                                '', () {
                              Navigator.pop(context);
                            });
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
                          color: ebloqscard
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
                        "Solicitar tarjeta ebloqs.",
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

              ///=> Creación de la imagen de la tarjeta
              Padding(
                padding: EdgeInsets.only(
                    top: UtilSize.height(64, context),
                    left: UtilSize.width(15, context),
                    right: UtilSize.width(15, context)),
                child: SizedBox(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset("assets/Imagenes/card ebloqs.png"),
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
                                const AutoSizeText(
                                  "ALDO MORA C.",
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
                                  child: const AutoSizeText(
                                    "54 3499 7890 1289",
                                    style: TextStyle(
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
                                  child: const AutoSizeText(
                                    "06/24",
                                    style: TextStyle(
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

              ///=> Botón de continuar
              Padding(
                padding: EdgeInsets.only(
                    top: UtilSize.height(41, context),
                    left: UtilSize.width(15, context),
                    right: UtilSize.width(15, context)),
                child: ButtonPrimary(
                  width: size.width,
                  title: "Continuar",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          googleAuthenticator(context, size, loading),
                    );
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
