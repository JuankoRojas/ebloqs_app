import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';

import 'package:ebloqs_app/src/providers/account_info_provider.dart';
import 'package:ebloqs_app/src/screens/buy/comprar_screen.dart';
import 'package:ebloqs_app/src/screens/buy/transferir_ebloqs_screen.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/custom_modal_bottom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class IntroducirCantidadTransferenciaScreen extends StatefulWidget {
  static const String routeName = 'IntroducirCantidadTransferenciaScreen';
  final String? cantidadTransferencia;
  const IntroducirCantidadTransferenciaScreen(
      {Key? key, this.cantidadTransferencia})
      : super(key: key);

  @override
  State<IntroducirCantidadTransferenciaScreen> createState() =>
      _IntroducirCantidadTransferenciaScreenState();
}

class _IntroducirCantidadTransferenciaScreenState
    extends State<IntroducirCantidadTransferenciaScreen> {
  final GlobalKey<FormState> formKey9 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey10 = GlobalKey<FormState>();

  final TextEditingController quantityController = TextEditingController();

  PageController controller = PageController();
  String? errorValidation;
  int _current = 0;
  double comision = 50.00;
  double? cantidad;
  double? recibes;
  bool isLoading = false;
  @override
  void initState() {
    quantityController.text = widget.cantidadTransferencia!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print(size.height);

    print(_current);
    if (widget.cantidadTransferencia!.isNotEmpty &&
        quantityController.text == widget.cantidadTransferencia) {
      cantidad = double.parse(widget.cantidadTransferencia!);
      recibes = cantidad;
      print(cantidad);
      print(recibes);
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   systemOverlayStyle: systemBarDark,
      //   automaticallyImplyLeading: false,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * (27 / size.height),
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
                      Navigator.pushNamed(context, ComprarScreen.routeName);
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
                  top: size.height * (32 / size.height),
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
                  key: formKey9,
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
                    // onEditingComplete: () {
                    //   setState(() {
                    //     cantidad = double.parse(quantityController.text);
                    //   });
                    // },
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                          cantidad = double.parse(value);
                          recibes = cantidad;
                        }
                      });
                    },
                    validator: (value) {
                      if (quantityController.text.isEmpty) {
                        if (value!.isEmpty) {
                          setState(() {
                            errorValidation =
                                'Por favor,  debes completar todos los registros para continuar';
                          });

                          return '';
                        }
                        return null;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * (39 / size.height),
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
                      "Banco (SWIFT)",
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
                child: SizedBox(
                  width: size.width,
                  height: size.height * (457 / size.height),
                  child: PageView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Center(
                        child: SizedBox(
                          width: size.width * (342 / size.width),
                          height: size.height * (194 / size.height),
                        ),
                      ),
                      PageForm(
                        controller: controller,
                        formKey10: formKey10,
                      ),
                      const PageConfirm(),
                    ],
                    onPageChanged: (page) {
                      setState(() {
                        _current = page;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: size.height * (100 / size.height),
                    bottom: size.height * (56 / size.height),
                  ),
                  child: ButtonPrimary(
                    width: double.infinity,
                    title: "Continuar",
                    onPressed: () {
                      if (_current == 2 &&
                          Provider.of<AccountInfoProvider>(context,
                                      listen: false)
                                  .checkedBankInfo ==
                              true &&
                          Provider.of<AccountInfoProvider>(context,
                                      listen: false)
                                  .checkedtransactInfo ==
                              true) {
                        if (formKey9.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransferirEbloqsScreen(
                                  cantidadTransferencia: recibes.toString()),
                            ),
                          );
                        } else {
                          setState(() {
                            errorValidation =
                                'Por favor,  debes completar todos los registros para continuar';
                          });
                          customModalBottomAlert(
                              context, size, errorValidation, isLoading, '',
                              () {
                            Navigator.pop(context);
                          });
                        }
                      }
                      if (_current == 1) {
                        if (formKey10.currentState!.validate()) {
                          setState(() {
                            controller.jumpToPage(_current + 1);
                          });
                        } else {
                          setState(() {
                            errorValidation =
                                'Por favor,  debes completar todos los registros para continuar';
                          });
                          customModalBottomAlert(
                              context, size, errorValidation, isLoading, '',
                              () {
                            Navigator.pop(context);
                          });
                        }
                      }
                      if (_current == 0) {
                        setState(() {
                          controller.jumpToPage(_current + 1);
                        });
                      }
                    },
                    load: isLoading,
                    disabled: isLoading,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class PageForm extends StatefulWidget {
  final PageController controller;
  final GlobalKey<FormState> formKey10;

  const PageForm(
      {Key? key, required this.controller, required, required this.formKey10})
      : super(key: key);

  @override
  State<PageForm> createState() => _PageFormState();
}

class _PageFormState extends State<PageForm> {
  String? errorValidation;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      // height: size.height * (421 / size.height),
      padding: EdgeInsets.only(
        top: size.height * (24 / size.height),
        right: size.width * (13 / size.width),
        bottom: UtilSize.height(31, context),
        left: size.width * (13 / size.width),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xffccc6dc),
          width: 1,
        ),
        color: const Color(0xfff9f9fa),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AutoSizeText(
                "Añadir información de la cuenta.",
                style: TextStyle(
                  color: Color(0xff2504ca),
                  fontSize: 15,
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                child: SvgPicture.asset('assets/Vectores/Iconos/X.svg'),
                onTap: () {
                  setState(() {
                    widget.controller.jumpToPage(0);
                  });
                },
              )
            ],
          ),
          Form(
            key: widget.formKey10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * (29 / size.height),
                  ),
                  child: const AutoSizeText(
                    "Nombre del titular",
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
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
                    ],
                    decoration: InputDecoration(
                      counterText: '',
                      labelStyle: const TextStyle(
                        color: Color(0xff9B99A3),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        Provider.of<AccountInfoProvider>(context, listen: false)
                            .nombreTitular = value;
                      });
                    },
                    validator: (value) {
                      print(value);
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
                    top: size.height * (16 / size.height),
                  ),
                  child: const AutoSizeText(
                    "Nombre del Banco",
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
                  child: TextFormField(
                    controller: bankNameController,
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
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
                    onChanged: (value) {
                      setState(() {
                        Provider.of<AccountInfoProvider>(context, listen: false)
                            .nombreBanco = value;
                      });
                    },
                    validator: (value) {
                      print(value);
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
                    top: size.height * (16 / size.height),
                  ),
                  child: const AutoSizeText(
                    "Número de la cuenta",
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
                  child: TextFormField(
                    controller: accountNumberController,
                    maxLength: 50,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
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
                    onChanged: (value) {
                      setState(() {
                        Provider.of<AccountInfoProvider>(context, listen: false)
                            .numeroCuenta = int.parse(value);
                      });
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
    );
  }
}

class PageConfirm extends StatefulWidget {
  const PageConfirm({
    Key? key,
  }) : super(key: key);

  @override
  State<PageConfirm> createState() => _PageConfirmState();
}

class _PageConfirmState extends State<PageConfirm> {
  bool isCheckedBankInfo = false;
  bool isCheckedtransactInfo = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String? nombreTitular =
        Provider.of<AccountInfoProvider>(context).nombreTitular;
    String? nombreBanco = Provider.of<AccountInfoProvider>(context).nombreBanco;
    int? numeroCuenta = Provider.of<AccountInfoProvider>(context).numeroCuenta;
    return Container(
      width: size.width,
      height: size.height * (430 / size.height),
      padding: EdgeInsets.only(
        top: size.height * (24 / size.height),
        right: size.width * (13 / size.width),
        bottom: size.height * (31 / size.height),
        left: size.width * (13 / size.width),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xffccc6dc),
          width: 1,
        ),
        color: const Color(0xfff9f9fa),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            "Confirmar información de la cuenta",
            style: TextStyle(
              color: Color(0xff170658),
              fontSize: 14,
              fontFamily: "Archivo",
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * (3 / size.height),
            ),
            child: const AutoSizeText(
              "Confirma la información a continuación y marca la casilla de descarga de responsabilidad.",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 13,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * (24 / size.height),
            ),
            child: const AutoSizeText(
              "Nombre del titular",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 14,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * (3 / size.height),
            ),
            child: AutoSizeText(
              nombreTitular ?? '',
              style: const TextStyle(
                color: Color(0xff170658),
                fontSize: 13,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * (20 / size.height),
            ),
            child: const AutoSizeText(
              "Nombre del banco",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 14,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * (3 / size.height),
            ),
            child: AutoSizeText(
              nombreBanco ?? '',
              style: const TextStyle(
                color: Color(0xff170658),
                fontSize: 13,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * (20 / size.height),
            ),
            child: const AutoSizeText(
              "Número de cuenta",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 14,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * (3 / size.height),
            ),
            child: AutoSizeText(
              numeroCuenta.toString(),
              style: const TextStyle(
                color: Color(0xff170658),
                fontSize: 13,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * (26 / size.height),
            ),
            child: Container(
              width: size.width,
              height: 1,
              color: const Color(0xffCCC6DC),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * (26 / size.height),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: UtilSize.width(22, context),
                  height: UtilSize.height(22, context),
                  child: Checkbox(
                      value: isCheckedBankInfo,
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      side: const BorderSide(
                        color: Color(0xffCCC6DC),
                        width: 1,
                      ),
                      activeColor: const Color(0xff170658),
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedBankInfo = value!;
                          Provider.of<AccountInfoProvider>(context,
                                  listen: false)
                              .checkedBankInfo = isCheckedBankInfo;
                        });
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * (12 / size.width),
                  ),
                  child: const AutoSizeText(
                    "Confirma la información de la cuenta bancaria.",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * (16 / size.height),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: UtilSize.width(22, context),
                  height: UtilSize.height(22, context),
                  child: Checkbox(
                      value: isCheckedtransactInfo,
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      side: const BorderSide(
                        color: Color(0xffCCC6DC),
                        width: 1,
                      ),
                      activeColor: const Color(0xff170658),
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedtransactInfo = value!;
                          Provider.of<AccountInfoProvider>(context,
                                  listen: false)
                              .checkedtransactInfo = isCheckedtransactInfo;
                        });
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * (12 / size.width),
                  ),
                  child: SizedBox(
                    width: UtilSize.width(260, context),
                    height: size.height * (36 / size.height),
                    child: const AutoSizeText(
                      '''Confirmo que la información de la cuenta
bancaria se usará para la transacción''',
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
