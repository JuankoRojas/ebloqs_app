import 'dart:math';

import 'package:ebloqs_app/src/providers/account_info_provider.dart';
import 'package:ebloqs_app/src/screens/wallet/wallet_screen.dart';
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
  @override
  void initState() {
    final random = Random();
    const availableChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const availableNum = '1234567890';
    final randomString1 = List.generate(
            2, (index) => availableChars[random.nextInt(availableChars.length)])
        .join();

    final randomString2 = List.generate(
            2, (index) => availableChars[random.nextInt(availableChars.length)])
        .join();
    final randomString3 = List.generate(
            1, (index) => availableChars[random.nextInt(availableChars.length)])
        .join();
    final randomNum1 = List.generate(
        2, (index) => availableNum[random.nextInt(availableNum.length)]).join();
    final randomNum2 = List.generate(
        1, (index) => availableNum[random.nextInt(availableNum.length)]).join();
    referencia =
        '$randomString1$randomNum1$randomString2$randomNum2$randomString3';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String cuenta =
        Provider.of<AccountInfoProvider>(context).numeroCuenta.toString();
    String subCuenta = cuenta.substring(0, 4);

    String subCuenta2 = cuenta.substring(cuenta.length - 4);

    return Scaffold(
      body: SingleChildScrollView(
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
                  const Text(
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
                padding: EdgeInsets.only(top: size.height * (35 / size.height)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "USD",
                      style: TextStyle(
                        color: Color(0xff2504ca),
                        fontSize: 28,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
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
                padding: EdgeInsets.only(top: size.height * (16 / size.height)),
                child: SizedBox(
                  width: size.width * (340 / size.width),
                  child: Text(
                    "Transfiere tus fondos  a la cuenta que indica a continuación desde tu cuenta bancaria: $subCuenta*******$subCuenta2",
                    style: const TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * (53 / size.height)),
                child: const Text(
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
                padding: EdgeInsets.only(top: size.height * (12 / size.height)),
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
                          const Text(
                            "Nº De referencia",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 15,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
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
                      GestureDetector(
                        child: SvgPicture.asset(
                            'assets/Vectores/Iconos/Copy 2.svg'),
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: referencia));
                        },
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * (16 / size.height)),
                child: SizedBox(
                  width: size.width * (341 / size.width),
                  child: const Text(
                    "Incluye tu código de referencia en los comentarios: La transacción sin código, o un código incorrecto será rechazada.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * (32 / size.height)),
                child: const Text(
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
                padding: EdgeInsets.only(top: size.height * (3 / size.height)),
                child: const Text(
                  "Key Vision Development",
                  style: TextStyle(
                    color: Color(0xff2c3e50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * (18 / size.height)),
                child: const Text(
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
                padding: EdgeInsets.only(top: size.height * (3 / size.height)),
                child: const Text(
                  "1504546221",
                  style: TextStyle(
                    color: Color(0xff2c3e50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * (18 / size.height)),
                child: const Text(
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
                padding: EdgeInsets.only(top: size.height * (3 / size.height)),
                child: const Text(
                  "1504546221",
                  style: TextStyle(
                    color: Color(0xff2c3e50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * (18 / size.height)),
                child: const Text(
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
                padding: EdgeInsets.only(top: size.height * (3 / size.height)),
                child: const Text(
                  "SIGNNIIS33XXX",
                  style: TextStyle(
                    color: Color(0xff2c3e50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * (18 / size.height)),
                child: const Text(
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
                padding: EdgeInsets.only(top: size.height * (3 / size.height)),
                child: const Text(
                  "Signature Bank",
                  style: TextStyle(
                    color: Color(0xff2c3e50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * (18 / size.height)),
                child: const Text(
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
                padding: EdgeInsets.only(top: size.height * (3 / size.height)),
                child: const Text(
                  "565 Fith Avenue New York ",
                  style: TextStyle(
                    color: Color(0xff2c3e50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * (42 / size.height),
                    bottom: size.height * (60 / size.height)),
                child: GestureDetector(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: size.height * (52 / size.height),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x3f000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/png/buttongradient.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Terminar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, WalletScreen.routeName, (route) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
