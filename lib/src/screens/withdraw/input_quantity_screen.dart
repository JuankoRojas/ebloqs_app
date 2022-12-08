import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:ebloqs_app/src/global/util_size.dart';

import 'package:ebloqs_app/src/providers/locations_provider.dart';
import 'package:ebloqs_app/src/screens/withdraw/withdraw_info_screen.dart';
import 'package:ebloqs_app/src/services/balance_service.dart';
import 'package:ebloqs_app/src/services/token_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/custom_modal_bottom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class InputQuantityScreen extends StatefulWidget {
  static const String routeName = 'InputQuantityScreen';

  const InputQuantityScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<InputQuantityScreen> createState() => _InputQuantityScreenState();
}

class _InputQuantityScreenState extends State<InputQuantityScreen> {
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
  String? cantidadTransferencia;
  String? ebl;
  double? tokenValue;
  @override
  void initState() {
    getBalance();
    getTokenValue();

    // quantityController.text = "559.72";
    super.initState();
  }

  getBalance() async {
    var balance = await BalanceService().getBalanceOf(
        accesstoken: Preferences.token!, publicKey: Preferences.public_key!);
    if (!mounted) return;
    setState(() {
      ebl = balance;
    });
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
    // print(size.height);

    print(_current);

    if (ebl != null && tokenValue != null) {
      cantidadTransferencia = (double.parse(ebl!)
          //  * tokenValue!
          )
          .toStringAsFixed(2);

      if (quantityController.text.isEmpty && cantidadTransferencia != null) {
        quantityController.text = cantidadTransferencia!;
        if (cantidadTransferencia != null &&
            cantidadTransferencia!.isNotEmpty &&
            quantityController.text == cantidadTransferencia) {
          cantidad = double.parse(cantidadTransferencia!);
          recibes = cantidad;
          print(cantidad);
          print(recibes);
        }
      }
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   systemOverlayStyle: systemBarDark,
      //   automaticallyImplyLeading: false,
      // ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
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
                          '${recibes ?? ''}',
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
                      top: size.height * (10 / size.height),
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
                      top: size.height * (28 / size.height),
                    ),
                    child: SizedBox(
                      width: size.width,
                      height: (errorValidation == null)
                          ? size.height * (900 / size.height)
                          : size.height * (1043 / size.height),
                      child: PageView(
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // Center(
                          //   child: SizedBox(
                          //     width: size.width * (342 / size.width),
                          //     height: size.height * (194 / size.height),
                          //   ),
                          // ),
                          PageForm(
                            controller: controller,
                            formKey10: formKey10,
                          ),
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
                        top: size.height * (20 / size.height),
                        bottom: size.height * (56 / size.height),
                      ),
                      child: ButtonPrimary(
                        width: double.infinity,
                        title: "Continuar",
                        onPressed: () {
                          if (_current == 0) {
                            if (formKey10.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WithDrawInfoScreen(
                                    amount: quantityController.text,
                                  ),
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

  final TextEditingController nameBeneficiaryController =
      TextEditingController();
  final TextEditingController bankNameBeneficiaryController =
      TextEditingController();
  final TextEditingController accountBeneficiaryNumberController =
      TextEditingController();
  final TextEditingController codigoSWIFTBICController =
      TextEditingController();
  final TextEditingController beneficiaryIDNumberController =
      TextEditingController();
  final TextEditingController beneficiaryAddressController =
      TextEditingController();
  final TextEditingController beneficiaryCityController =
      TextEditingController();
  final TextEditingController beneficiaryProvinceController =
      TextEditingController();

  @override
  void initState() {
    useLocation();
    super.initState();
  }

  void useLocation() async {
    var locationProvider =
        Provider.of<LocationsProvider>(context, listen: false);
    await locationProvider.requestPermisionLocation();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locationValue =
        Provider.of<LocationsProvider>(context).countryCode.text;
    if (locationValue.isEmpty) {
      return Scaffold(
        body: Center(
          child: Lottie.asset('assets/lottie/X2lNy3zK9f.json'),
        ),
      );
    }
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
                "Información del retiro",
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
                    left: UtilSize.width(8, context),
                  ),
                  child: const AutoSizeText(
                    "Nombres y apellidos del beneficiario",
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
                    left: UtilSize.width(8, context),
                    right: UtilSize.width(8, context),
                  ),
                  child: TextFormField(
                    controller: nameBeneficiaryController,
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
                    ],
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: const Color(0xffffffff),
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
                        // Provider.of<AccountInfoProvider>(context, listen: false)
                        //     .nombreTitular = value;
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
                    left: UtilSize.width(8, context),
                  ),
                  child: const AutoSizeText(
                    "Número de la cuenta del beneficiario",
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
                    left: UtilSize.width(8, context),
                    right: UtilSize.width(8, context),
                  ),
                  child: TextFormField(
                    controller: accountBeneficiaryNumberController,
                    maxLength: 50,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: const Color(0xffffffff),
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
                        // Provider.of<AccountInfoProvider>(context, listen: false)
                        //     .numeroCuenta = int.parse(value);
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
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * (16 / size.height),
                    left: UtilSize.width(8, context),
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
                    left: UtilSize.width(8, context),
                    right: UtilSize.width(8, context),
                  ),
                  child: TextFormField(
                    controller: bankNameBeneficiaryController,
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
                    ],
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: const Color(0xffffffff),
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
                        // Provider.of<AccountInfoProvider>(context, listen: false)
                        //     .nombreBanco = value;
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
                    left: UtilSize.width(8, context),
                  ),
                  child: const AutoSizeText(
                    "Código SWIFT/BIC",
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
                    left: UtilSize.width(8, context),
                    right: UtilSize.width(8, context),
                  ),
                  child: TextFormField(
                    controller: codigoSWIFTBICController,
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
                    ],
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: const Color(0xffffffff),
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
                        // Provider.of<AccountInfoProvider>(context, listen: false)
                        //     .nombreBanco = value;
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
                    left: UtilSize.width(8, context),
                  ),
                  child: const AutoSizeText(
                    "Nº. Identificación beneficiario",
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
                    left: UtilSize.width(8, context),
                    right: UtilSize.width(8, context),
                  ),
                  child: TextFormField(
                    controller: beneficiaryIDNumberController,
                    maxLength: 50,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: const Color(0xffffffff),
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
                        // Provider.of<AccountInfoProvider>(context, listen: false)
                        //     .numeroCuenta = int.parse(value);
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
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * (16 / size.height),
                    left: UtilSize.width(8, context),
                  ),
                  child: const AutoSizeText(
                    "Dirección del beneficiario (línea 1)",
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
                    left: UtilSize.width(8, context),
                    right: UtilSize.width(8, context),
                  ),
                  child: TextFormField(
                    controller: beneficiaryAddressController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: const Color(0xffffffff),
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
                        // Provider.of<AccountInfoProvider>(context, listen: false)
                        //     .nombreBanco = value;
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
                  padding: EdgeInsets.only(top: UtilSize.height(13, context)),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: AutoSizeText(
                      "Escribir la dirección en inglés",
                      style: TextStyle(
                        color: Color(0xff818181),
                        fontSize: 11,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * (16 / size.height),
                    left: UtilSize.width(8, context),
                  ),
                  child: const AutoSizeText(
                    "País",
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
                    top: size.height * 0.00946265630280501,
                  ),
                  child: CountryListPick(
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: const AutoSizeText(
                          'Selecciona el país',
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 17,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        centerTitle: true,
                        leadingWidth: size.width * (44 / size.width),
                        leading: Padding(
                          padding: EdgeInsets.only(
                              left: size.width * (16 / size.width)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              'assets/Vectores/Iconos/Arrow left.svg',
                            ),
                          ),
                        ),
                      ),
                      pickerBuilder: (context, CountryCode? countryCode) {
                        return Container(
                          width: size.width,
                          height: UtilSize.height(58, context),
                          padding: EdgeInsets.only(
                            top: size.height * (11 / size.height),
                            right: size.width * (6 / size.width),
                            bottom: size.height * (10 / size.height),
                            left: size.width * (7 / size.width),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: const Color(0xffcdccd1),
                                width: 1,
                              ),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                countryCode!.name!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.0186294078509648),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 3),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    countryCode.flagUri!,
                                    package: 'country_list_pick',
                                    width: size.width * (24 / size.width),
                                    height: size.height * (24 / size.height),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              SvgPicture.asset(
                                  'assets/Vectores/Iconos/dwon chevron.svg'),
                            ],
                          ),
                        );
                      },
                      theme: CountryTheme(
                          isShowFlag: true,
                          isShowTitle: false,
                          isShowCode: false,
                          isDownIcon: true,
                          showEnglishName: false,
                          labelColor: const Color(0xff170658),
                          searchText: 'País',
                          searchHintText: 'Buscar país',
                          lastPickText: 'Ultima selección'),
                      // Set default value
                      initialSelection: locationValue,
                      // or
                      // initialSelection: 'US'
                      onChanged: (CountryCode? countryCode) {
                        print(countryCode?.name.toString());
                      },
                      // Whether to allow the widget to set a custom UI overlay
                      useUiOverlay: false,
                      // Whether the country list should be wrapped in a SafeArea
                      useSafeArea: false),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * (16 / size.height),
                    left: UtilSize.width(8, context),
                    right: UtilSize.width(8, context),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AutoSizeText(
                            "Ciudad",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 13,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: size.height * (8 / size.height),
                            ),
                            child: SizedBox(
                              width: UtilSize.width(145, context),
                              child: TextFormField(
                                controller: beneficiaryCityController,
                                keyboardType: TextInputType.streetAddress,
                                decoration: InputDecoration(
                                  counterText: '',
                                  filled: true,
                                  fillColor: const Color(0xffffffff),
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
                                    // Provider.of<AccountInfoProvider>(context, listen: false)
                                    //     .nombreBanco = value;
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
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AutoSizeText(
                            "Provincia",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 13,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: size.height * (8 / size.height),
                            ),
                            child: SizedBox(
                              width: UtilSize.width(145, context),
                              child: TextFormField(
                                controller: beneficiaryProvinceController,
                                keyboardType: TextInputType.streetAddress,
                                decoration: InputDecoration(
                                  counterText: '',
                                  filled: true,
                                  fillColor: const Color(0xffffffff),
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
                                    // Provider.of<AccountInfoProvider>(context, listen: false)
                                    //     .nombreBanco = value;
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
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
