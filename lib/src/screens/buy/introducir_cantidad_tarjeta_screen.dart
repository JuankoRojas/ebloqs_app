import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroducirCantidadTarjetaScreen extends StatefulWidget {
  static const String routeName = 'IntroducirCantidadTarjetaScreen';
  const IntroducirCantidadTarjetaScreen({Key? key}) : super(key: key);

  @override
  State<IntroducirCantidadTarjetaScreen> createState() =>
      _IntroducirCantidadTarjetaScreenState();
}

class _IntroducirCantidadTarjetaScreenState
    extends State<IntroducirCantidadTarjetaScreen> {
  final GlobalKey<FormState> formKey7 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey8 = GlobalKey<FormState>();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemBarDark,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 27, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                        'assets/Vectores/Iconos/Arrow left.svg'),
                    onTap: () {},
                  ),
                  Expanded(child: Container()),
                  const Text(
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
              const Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Text(
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
                padding: const EdgeInsets.only(top: 8.0),
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
                            height: 32,
                            color: const Color(0xffCDCCD1),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 19),
                            child: Text(
                              "EUR",
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
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 39.0),
                child: Text(
                  "Recibes:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 13,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Row(
                  children: const [
                    Text(
                      "98.20 ",
                      style: TextStyle(
                        color: Color(0xff2504ca),
                        fontSize: 28,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "EUR",
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
                padding: const EdgeInsets.only(top: 19.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Método de transacción:",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 14,
                      ),
                    ),
                    Text(
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
                padding: const EdgeInsets.only(top: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Comisión transacción:",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "1.80 EUR",
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
                padding: const EdgeInsets.only(top: 48.0),
                child: Container(
                  width: 345,
                  height: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffccc6dc),
                      width: 1,
                    ),
                    color: const Color(0xfff9f9fa),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 24.0, right: 13, bottom: 31, left: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Añadir información de la cuenta.",
                              style: TextStyle(
                                color: Color(0xff2504ca),
                                fontSize: 15,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              child: SvgPicture.asset(
                                  'assets/Vectores/Iconos/X.svg'),
                              onTap: () {},
                            )
                          ],
                        ),
                        Form(
                          key: formKey8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 29.0),
                                child: Text(
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
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextFormField(
                                  controller: nameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
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
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 16.0),
                                child: Text(
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
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextFormField(
                                  controller: bankNameController,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
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
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 149.73,
                                      height: 80,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "F. Vencimiento",
                                            style: TextStyle(
                                              color: Color(0xff170658),
                                              fontSize: 13,
                                              fontFamily: "Archivo",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: TextFormField(
                                              controller:
                                                  expirationDateController,
                                              keyboardType:
                                                  TextInputType.datetime,
                                              decoration: InputDecoration(
                                                labelStyle: const TextStyle(
                                                  color: Color(0xff9B99A3),
                                                  fontSize: 14,
                                                  fontFamily: "Archivo",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 149.73,
                                      height: 80,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "CVV",
                                            style: TextStyle(
                                              color: Color(0xff170658),
                                              fontSize: 13,
                                              fontFamily: "Archivo",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: TextFormField(
                                              controller: cvvController,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                labelStyle: const TextStyle(
                                                  color: Color(0xff9B99A3),
                                                  fontSize: 14,
                                                  fontFamily: "Archivo",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
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
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 52.0,
                ),
                child: GestureDetector(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: 52,
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
                          "Continuar",
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
                  onTap: () async {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 44),
                child: Container(
                  width: 348,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xfff9f9fa),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3f000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Registrar pago",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
