import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:ebloqs_app/src/providers/account_info_provider.dart';
import 'package:ebloqs_app/src/screens/buy/congrats_screen_transfer.dart';
import 'package:ebloqs_app/src/services/auth_user_service.dart';
import 'package:ebloqs_app/src/services/token_service.dart';
import 'package:ebloqs_app/src/services/transactions_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TransferirEbloqsScreen extends StatefulWidget {
  static const routeName = 'TransferirEbloqsScreen';
  final String? cantidadTransferencia;
  const TransferirEbloqsScreen({Key? key, this.cantidadTransferencia})
      : super(key: key);

  @override
  State<TransferirEbloqsScreen> createState() => _TransferirEbloqsScreenState();
}

class _TransferirEbloqsScreenState extends State<TransferirEbloqsScreen> {
  String referencia = '';
  String? randomNum1;
  var userInfoData;
  String? subCuenta;
  String? subCuenta2;
  String nombreBenf = "Key Vision Development";
  String numCuentBenf = "1504546221";
  String direccBenf = "1504546221";
  String codSwift = "SIGNNIIS33XXX";
  String nomBancRecep = "Signature Bank";
  String dirBancRecep = "565 Fith Avenue New York ";
  bool copiedRef = false;
  bool copiedBenef = false;
  bool copiedAccBenef = false;
  bool copiedDirBenef = false;
  bool copiedCodSwift = false;
  bool copiedBancRec = false;
  bool copiedDireccBanc = false;
  bool setTransaction = false;
  bool _isLoading = false;
  double? tokenValue;
  @override
  void initState() {
    userInfo();
    final random = Random();
    // const availableChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const availableNum = '1234567890';
    // final randomString1 = List.generate(
    //         2, (index) => availableChars[random.nextInt(availableChars.length)])
    //     .join();

    // final randomString2 = List.generate(
    //         2, (index) => availableChars[random.nextInt(availableChars.length)])
    //     .join();
    // final randomString3 = List.generate(
    //         1, (index) => availableChars[random.nextInt(availableChars.length)])
    //     .join();
    randomNum1 = List.generate(
        9, (index) => availableNum[random.nextInt(availableNum.length)]).join();
    // final randomNum2 = List.generate(
    //     1, (index) => availableNum[random.nextInt(availableNum.length)]).join();
    // referencia = userInfoData['idRef'];

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
    String cuenta =
        Provider.of<AccountInfoProvider>(context).numeroCuenta.toString();
    if (cuenta.length > 4) {
      subCuenta = cuenta.substring(0, 4);
      subCuenta2 = cuenta.substring(cuenta.length - 4);
    }
    if (userInfoData != null) {
      referencia = userInfoData['idRef'];
    }

    print('Public:${Preferences.public_key}');
    // if (setTransaction) {
    //   return Scaffold(
    //     body: Center(
    //       child: Lottie.asset('assets/lottie/X2lNy3zK9f.json'),
    //     ),
    //   );
    // }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * (27 / size.height),
                left: size.width * (16 / size.width),
                right: size.width * (16 / size.width)),
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
                      "Transferir a la cuenta ebloqs",
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
                  padding:
                      EdgeInsets.only(top: size.height * (35 / size.height)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        "USD",
                        style: TextStyle(
                          color: Color(0xff2504ca),
                          fontSize: 28,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      AutoSizeText(
                        widget.cantidadTransferencia ?? '',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
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
                  padding:
                      EdgeInsets.only(top: size.height * (16 / size.height)),
                  child: SizedBox(
                    width: size.width * (340 / size.width),
                    child: AutoSizeText(
                      "Transfiere tus fondos  a la cuenta que indica a continuación desde tu cuenta bancaria: $subCuenta*******$subCuenta2",
                      style: const TextStyle(
                        color: Color(0xff170658),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (33 / size.height)),
                  child: const AutoSizeText(
                    "Datos de la cuenta bancaria Ebloqs",
                    style: TextStyle(
                      color: Color(0xff2504ca),
                      fontSize: 15,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (12 / size.height)),
                  child: Container(
                    width: size.width,
                    height: size.height * (64 / size.height),
                    padding: EdgeInsets.only(
                        top: size.height * (10 / size.height),
                        right: size.width * (19 / size.width),
                        bottom: size.height * (10 / size.height),
                        left: size.width * (12 / size.width)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0xffeae4fc),
                        width: 1,
                      ),
                      color: const Color(0xfff9f9fa),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AutoSizeText(
                              "Nº De referencia",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 15,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AutoSizeText(
                              referencia,
                              style: const TextStyle(
                                color: Color(0xff2504ca),
                                fontSize: 20,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        (copiedRef)
                            ? Padding(
                                padding:
                                    EdgeInsets.only(right: size.width * 0.04),
                                child: SvgPicture.asset(
                                    'assets/Vectores/Iconos/copied.svg'),
                              )
                            : Padding(
                                padding:
                                    EdgeInsets.only(right: size.width * 0.04),
                                child: GestureDetector(
                                  child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/Copy 2.svg'),
                                  onTap: () {
                                    Clipboard.setData(
                                        ClipboardData(text: referencia));
                                    setState(() {
                                      copiedRef = true;
                                      Future.delayed(const Duration(minutes: 2))
                                          .then((value) {
                                        setState(() {
                                          copiedRef = false;
                                        });
                                      });
                                    });
                                  },
                                ),
                              )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (16 / size.height)),
                  child: SizedBox(
                    width: size.width * (341 / size.width),
                    child: const AutoSizeText(
                      "Incluye tu código de referencia en los comentarios: La transacción sin código, o un código incorrecto será rechazada.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (32 / size.height)),
                  child: const AutoSizeText(
                    "Nombre del Beneficiario de la cuenta",
                    style: TextStyle(
                      color: Color(0xff92959e),
                      fontSize: 13,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (3 / size.height)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        nombreBenf,
                        style: const TextStyle(
                          color: Color(0xff2c3e50),
                          fontSize: 15,
                        ),
                      ),
                      (copiedBenef)
                          ? Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.08),
                              child: SvgPicture.asset(
                                  'assets/Vectores/Iconos/copied.svg'),
                            )
                          : Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.08),
                              child: GestureDetector(
                                child: SvgPicture.asset(
                                    'assets/Vectores/Iconos/Copy 2.svg'),
                                onTap: () {
                                  Clipboard.setData(
                                      ClipboardData(text: nombreBenf));
                                  setState(() {
                                    copiedBenef = true;
                                    Future.delayed(const Duration(minutes: 2))
                                        .then((value) {
                                      setState(() {
                                        copiedBenef = false;
                                      });
                                    });
                                  });
                                },
                              ),
                            )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (18 / size.height)),
                  child: const AutoSizeText(
                    "Número de cuenta del beneficiario",
                    style: TextStyle(
                      color: Color(0xff92959e),
                      fontSize: 13,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (3 / size.height)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        numCuentBenf,
                        style: const TextStyle(
                          color: Color(0xff2c3e50),
                          fontSize: 15,
                        ),
                      ),
                      (copiedAccBenef)
                          ? Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.08),
                              child: SvgPicture.asset(
                                  'assets/Vectores/Iconos/copied.svg'),
                            )
                          : Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.08),
                              child: GestureDetector(
                                child: SvgPicture.asset(
                                    'assets/Vectores/Iconos/Copy 2.svg'),
                                onTap: () {
                                  Clipboard.setData(
                                      ClipboardData(text: numCuentBenf));
                                  setState(() {
                                    copiedAccBenef = true;
                                    Future.delayed(const Duration(minutes: 2))
                                        .then((value) {
                                      setState(() {
                                        copiedAccBenef = false;
                                      });
                                    });
                                  });
                                },
                              ),
                            )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (18 / size.height)),
                  child: const AutoSizeText(
                    "Dirección de Beneficiario",
                    style: TextStyle(
                      color: Color(0xff92959e),
                      fontSize: 13,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (3 / size.height)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        direccBenf,
                        style: const TextStyle(
                          color: Color(0xff2c3e50),
                          fontSize: 15,
                        ),
                      ),
                      (copiedDirBenef)
                          ? Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.08),
                              child: SvgPicture.asset(
                                  'assets/Vectores/Iconos/copied.svg'),
                            )
                          : Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.08),
                              child: GestureDetector(
                                child: SvgPicture.asset(
                                    'assets/Vectores/Iconos/Copy 2.svg'),
                                onTap: () {
                                  Clipboard.setData(
                                      ClipboardData(text: direccBenf));
                                  setState(() {
                                    copiedDirBenef = true;
                                    Future.delayed(const Duration(minutes: 2))
                                        .then((value) {
                                      setState(() {
                                        copiedDirBenef = false;
                                      });
                                    });
                                  });
                                },
                              ),
                            )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (18 / size.height)),
                  child: const AutoSizeText(
                    "Código SWITF",
                    style: TextStyle(
                      color: Color(0xff92959e),
                      fontSize: 13,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (3 / size.height)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        codSwift,
                        style: const TextStyle(
                          color: Color(0xff2c3e50),
                          fontSize: 15,
                        ),
                      ),
                      (copiedCodSwift)
                          ? Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.08),
                              child: SvgPicture.asset(
                                  'assets/Vectores/Iconos/copied.svg'),
                            )
                          : Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.08),
                              child: GestureDetector(
                                child: SvgPicture.asset(
                                    'assets/Vectores/Iconos/Copy 2.svg'),
                                onTap: () {
                                  Clipboard.setData(
                                      ClipboardData(text: codSwift));
                                  setState(() {
                                    copiedCodSwift = true;
                                    Future.delayed(const Duration(minutes: 2))
                                        .then((value) {
                                      setState(() {
                                        copiedCodSwift = false;
                                      });
                                    });
                                  });
                                },
                              ),
                            )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (18 / size.height)),
                  child: const AutoSizeText(
                    "Nombre del Banco receptor",
                    style: TextStyle(
                      color: Color(0xff92959e),
                      fontSize: 13,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (3 / size.height)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        nomBancRecep,
                        style: const TextStyle(
                          color: Color(0xff2c3e50),
                          fontSize: 15,
                        ),
                      ),
                      (copiedBancRec)
                          ? Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.08),
                              child: SvgPicture.asset(
                                  'assets/Vectores/Iconos/copied.svg'),
                            )
                          : Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.08),
                              child: GestureDetector(
                                child: SvgPicture.asset(
                                    'assets/Vectores/Iconos/Copy 2.svg'),
                                onTap: () {
                                  Clipboard.setData(
                                      ClipboardData(text: nomBancRecep));
                                  setState(() {
                                    copiedBancRec = true;
                                    Future.delayed(const Duration(minutes: 2))
                                        .then((value) {
                                      setState(() {
                                        copiedBancRec = false;
                                      });
                                    });
                                  });
                                },
                              ),
                            )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (18 / size.height)),
                  child: const AutoSizeText(
                    "Dirección del Banco receptor",
                    style: TextStyle(
                      color: Color(0xff92959e),
                      fontSize: 13,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * (3 / size.height)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        dirBancRecep,
                        style: const TextStyle(
                          color: Color(0xff2c3e50),
                          fontSize: 15,
                        ),
                      ),
                      (copiedDireccBanc)
                          ? Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.08),
                              child: SvgPicture.asset(
                                  'assets/Vectores/Iconos/copied.svg'),
                            )
                          : Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.08),
                              child: GestureDetector(
                                child: SvgPicture.asset(
                                    'assets/Vectores/Iconos/Copy 2.svg'),
                                onTap: () {
                                  Clipboard.setData(
                                      ClipboardData(text: dirBancRecep));
                                  setState(() {
                                    copiedDireccBanc = true;
                                    Future.delayed(const Duration(minutes: 2))
                                        .then((value) {
                                      setState(() {
                                        copiedDireccBanc = false;
                                      });
                                    });
                                  });
                                },
                              ),
                            )
                    ],
                  ),
                ),
                (copiedRef ||
                        copiedBenef ||
                        copiedAccBenef ||
                        copiedDirBenef ||
                        copiedCodSwift ||
                        copiedBancRec ||
                        copiedDireccBanc)
                    ? Container(
                        width: size.width,
                        height: size.height * 0.041871921182266,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff130a37),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Vectores/Iconos/copied.svg',
                                color: const Color(0xff00C853),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: size.width * 0.032),
                                child: const AutoSizeText(
                                  "Copiado correctamente",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(
                        width: 0,
                        height: 0,
                      ),
                Padding(
                    padding: EdgeInsets.only(
                        top: size.height * (42 / size.height),
                        bottom: size.height * (60 / size.height)),
                    child: ButtonPrimary(
                      width: double.infinity,
                      title: "Terminar",
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        var amount =
                            double.parse(widget.cantidadTransferencia!) /
                                tokenValue!;
                        var parsedAmount = amount.toInt();
                        try {
                          if (Preferences.public_key != null &&
                              Preferences.token != null &&
                              Preferences.userName != null) {
                            final response =
                                await TransactionsService().createTransaction(
                              token: Preferences.token!,
                              refId: referencia,
                              client: Preferences.public_key!,
                              amount: widget.cantidadTransferencia!,
                              clientName: Preferences.userName!,
                              paymentNumber: cuenta,
                              status: 0,
                              type: 0,
                              id: randomNum1.toString(),
                            );
                            if (response.isNotEmpty) {
                              setState(() {
                                _isLoading = true;
                              });
                              debugPrint('response.toString()');
                              debugPrint(response.toString());
                              Future.delayed(Duration.zero).then(
                                (_) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CongratsScreenTransfer(
                                      total: amount,
                                    ),
                                  ),
                                ),
                              );
                            }
                          }
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      },
                      load: _isLoading,
                      disabled: _isLoading,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
