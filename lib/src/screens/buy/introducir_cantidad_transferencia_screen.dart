import 'package:ebloqs_app/src/screens/buy/transferir_ebloqs_screen.dart';
import 'package:ebloqs_app/src/utilitis/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  final TextEditingController quantityController = TextEditingController();

  PageController controller = PageController();
  String nombreTitular = '';
  String nombreBanco = '';
  String numeroTarjeta = '';

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.height);
    quantityController.text = widget.cantidadTransferencia!;
    print(_current);
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
                  key: formKey9,
                  child: TextFormField(
                    controller: quantityController,
                    keyboardType: TextInputType.emailAddress,
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
                      "50.00 ",
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
                      "50.00 EUR",
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
                padding: const EdgeInsets.only(top: 48),
                child: SizedBox(
                  width: 345,
                  height: 400,
                  child: PageView(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const Center(
                        child: SizedBox(
                          width: 342,
                          height: 194,
                        ),
                      ),
                      PageForm(
                        controller: controller,
                        name: nombreTitular,
                        bankName: nombreBanco,
                        accountNumber: numeroTarjeta,
                      ),
                      PageConfirm(
                          name: nombreTitular,
                          bankName: nombreBanco,
                          accountNumber: numeroTarjeta),
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
                padding: const EdgeInsets.only(top: 100.0, bottom: 56),
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
                  onTap: () {
                    if (_current == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransferirEbloqsScreen(),
                        ),
                      );
                    }
                    setState(() {
                      controller.jumpToPage(_current + 1);
                    });
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

class PageForm extends StatefulWidget {
  final PageController controller;
  String? name;
  String? bankName;
  String? accountNumber;
  PageForm(
      {Key? key,
      required this.controller,
      required this.name,
      required this.bankName,
      required this.accountNumber})
      : super(key: key);

  @override
  State<PageForm> createState() => _PageFormState();
}

class _PageFormState extends State<PageForm> {
  final GlobalKey<FormState> formKey10 = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    widget.name = nameController.text;
    widget.bankName = bankNameController.text;
    widget.accountNumber = accountNumberController.text;
    return Container(
      width: 345,
      height: 421,
      padding: const EdgeInsets.only(top: 24, right: 13, bottom: 31, left: 13),
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
            key: formKey10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 29.0),
                  child: Text(
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
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
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
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    controller: accountNumberController,
                    keyboardType: TextInputType.number,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageConfirm extends StatefulWidget {
  final String name;
  final String bankName;
  final String accountNumber;
  const PageConfirm(
      {Key? key,
      required this.name,
      required this.bankName,
      required this.accountNumber})
      : super(key: key);

  @override
  State<PageConfirm> createState() => _PageConfirmState();
}

class _PageConfirmState extends State<PageConfirm> {
  bool isCheckedBankInfo = false;
  bool isCheckedtransactInfo = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 421,
      padding: const EdgeInsets.only(top: 24, right: 13, bottom: 31, left: 13),
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
          const Text(
            "Confirmar información de la cuenta",
            style: TextStyle(
              color: Color(0xff170658),
              fontSize: 14,
              fontFamily: "Archivo",
              fontWeight: FontWeight.w600,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 3.0),
            child: Text(
              "Confirma la información a continuación y marca la casilla de descarga de responsabilidad.",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 13,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24),
            child: Text(
              "Nombre del titular",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 14,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 3.0),
            child: Text(
              "Jorge Ramirez",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 13,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              "Nombre del banco",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 14,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 3.0),
            child: Text(
              "Banco Pichincha",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 13,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              "Número de cuenta",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 14,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 3.0),
            child: Text(
              "307712005",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 13,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26.0),
            child: Container(
              width: 306.11,
              height: 1,
              color: const Color(0xffCCC6DC),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 22,
                  height: 22,
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
                        });
                      }),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
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
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 22,
                  height: 22,
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
                        });
                      }),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: SizedBox(
                    width: 271,
                    height: 36,
                    child: Text(
                      "Confirmo que la información de la cuenta bancaria se usará para la transacción",
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
