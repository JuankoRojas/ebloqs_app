import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransferScreen extends StatefulWidget {
  static const String routeName = 'TransferScreen';
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  PageController pageController = PageController();
  bool? isLoadLogin = false;
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.073509485094851),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.0729166666666667,
                    right: size.width * 0.0461805555555556),
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
                    const Text(
                      "Transferir",
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
                padding: EdgeInsets.only(top: size.height * 0.0379403794037941),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: size.width * 0.5,
                        height: size.height * 0.0640243902439025,
                        color: const Color(0xfff6f4fd),
                        child: const Center(
                          child: Text(
                            "Dinero",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 15,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (_curr == 1) {
                          setState(() {
                            _curr = 0;
                          });
                          pageController.jumpToPage(_curr);
                        }
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: size.width * 0.5,
                        height: size.height * 0.0640243902439025,
                        color: const Color(0xfff9f9fa),
                        child: const Center(
                          child: Text(
                            "Tokens",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 15,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (_curr == 0) {
                          setState(() {
                            _curr = 1;
                          });
                          pageController.jumpToPage(_curr);
                        }
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.0260840108401084,
                  left: size.width * 0.0413194444444445,
                  right: size.width * 0.0413194444444445,
                ),
                child: SizedBox(
                  height: size.height * 0.7,
                  width: double.infinity,
                  child: PageView(
                    controller: pageController,
                    children: const [Dinero(), Tokens()],
                  ),
                ),
              ),
              (_curr == 0)
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.0426829268292683,
                          left: size.width * 0.0364583333333334,
                          right: size.width * 0.0364583333333334,
                          bottom: size.height * 0.0569105691056911),
                      child: ButtonPrimary(
                          width: size.width,
                          title: 'Continuar',
                          onPressed: () {},
                          load: isLoadLogin!,
                          disabled: isLoadLogin!),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.0130420054200542,
                        left: size.width * 0.0413194444444445,
                        right: size.width * 0.0413194444444445,
                      ),
                      child: const Text(
                        "Tiempo estimado de 1 hora",
                        style: TextStyle(
                          color: Color(0xff2504ca),
                          fontSize: 13,
                        ),
                      )),
              // Padding(
              //   padding: EdgeInsets.only(
              //       top: size.height * 0.0248983739837399,
              //       left: size.width * 0.0413194444444445,
              //       right: size.width * 0.0413194444444445,
              //       bottom: size.height * 0.0569105691056911),
              //   child: ButtonPrimary(
              //       width: size.width,
              //       title: 'Continuar',
              //       onPressed: () {},
              //       load: isLoadLogin!,
              //       disabled: isLoadLogin!),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class Dinero extends StatefulWidget {
  const Dinero({Key? key}) : super(key: key);

  @override
  State<Dinero> createState() => _DineroState();
}

class _DineroState extends State<Dinero> {
  final GlobalKey<FormState> _formKey13 = GlobalKey<FormState>();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedValue;
  String? byValue;
  String? toValue;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "USD", child: Text("USD")),
      const DropdownMenuItem(value: "Euros", child: Text("Euros")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get byItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Aldo Mora", child: Text("Aldo Mora")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get toItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Javier Cervantes", child: Text("Javier Cervantes")),
      const DropdownMenuItem(value: "Julian Usma", child: Text("Julian Usma")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey13,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Moneda",
            style: TextStyle(
              color: Color(0xff170658),
              fontSize: 13,
              fontFamily: "Archivo",
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.00948509485094851,
            ),
            child: DropdownButtonFormField(
                icon:
                    SvgPicture.asset('assets/Vectores/Iconos/dwon chevron.svg'),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 0.0),
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
              top: size.height * 0.018970189701897,
            ),
            child: const Text(
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
              top: size.height * 0.00948509485094851,
            ),
            child: TextFormField(
              controller: quantityController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffcdccd1), width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const Text(
              "De:",
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
                top: size.height * 0.00948509485094851,
              ),
              child: TextFormField()),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const Text(
              "Para:",
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
              top: size.height * 0.00948509485094851,
            ),
            child: DropdownButtonFormField(
                icon:
                    SvgPicture.asset('assets/Vectores/Iconos/dwon chevron.svg'),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                value: toValue,
                onChanged: (String? newValue) {
                  setState(() {
                    toValue = newValue!;
                  });
                },
                items: toItems),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const Text(
              "Descripción",
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
              top: size.height * 0.00948509485094851,
            ),
            child: TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  hintText: "Ubique descripción opcional"),
            ),
          )
        ],
      ),
    );
  }
}

class Tokens extends StatefulWidget {
  const Tokens({Key? key}) : super(key: key);

  @override
  State<Tokens> createState() => _TokensState();
}

class _TokensState extends State<Tokens> {
  final GlobalKey<FormState> _formKey14 = GlobalKey<FormState>();
  final TextEditingController quantity2Controller = TextEditingController();
  final TextEditingController walletToController = TextEditingController();
  final TextEditingController description2Controller = TextEditingController();
  String? selectedValue2;

  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "EBL", child: Text("EBL")),
      // const DropdownMenuItem(value: "EBL2", child: Text("EBL2")),
      // const DropdownMenuItem(value: "EBL3", child: Text("EBL3")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Tokens",
            style: TextStyle(
              color: Color(0xff170658),
              fontSize: 13,
              fontFamily: "Archivo",
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.00948509485094851,
            ),
            child: DropdownButtonFormField(
                icon:
                    SvgPicture.asset('assets/Vectores/Iconos/dwon chevron.svg'),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                value: selectedValue2,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue2 = newValue!;
                  });
                },
                items: dropdownItems2),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const Text(
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
              top: size.height * 0.00948509485094851,
            ),
            child: TextFormField(
              controller: quantity2Controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffcdccd1), width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const Text(
              "De:",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 13,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.00948509485094851),
            child: Container(
              width: size.width,
              height: size.height * 0.0616531165311653,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.0388888888888889),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color(0xffcdccd1),
                  width: 1,
                ),
              ),
              child: Row(
                children: const [
                  Text(
                    "Private Key Wallet",
                    style: TextStyle(
                      color: Color(0xff383346),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const Text(
              "Para:",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 13,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.00948509485094851),
            child: TextFormField(
              controller: walletToController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffcdccd1), width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const Text(
              "Descripción",
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
              top: size.height * 0.00948509485094851,
            ),
            child: TextFormField(
              controller: description2Controller,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  hintText: "Ubique descripción opcional"),
            ),
          )
        ],
      ),
    );
  }
}
