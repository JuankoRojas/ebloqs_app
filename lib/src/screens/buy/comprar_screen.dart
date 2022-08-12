import 'package:country_list_pick/country_list_pick.dart';
import 'package:ebloqs_app/src/screens/buy/introducir_cantidad_transferencia_screen.dart';
import 'package:ebloqs_app/src/utilitis/tabbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class ComprarScreen extends StatefulWidget {
  static const String routeName = 'ComprarScreen';
  const ComprarScreen({Key? key}) : super(key: key);

  @override
  State<ComprarScreen> createState() => _ComprarScreenState();
}

class _ComprarScreenState extends State<ComprarScreen> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
    String? isoCountryCode = systemLocales.first.countryCode;
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                        'assets/Vectores/Iconos/Arrow left.svg'),
                    onTap: () {
                      Navigator.canPop(context);
                    },
                  ),
                  Expanded(child: Container()),
                  const Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text(
                      "Comprar",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 17,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  CountryListPick(
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: const Text(
                          'Selecciona tu país',
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 17,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        centerTitle: true,
                        leadingWidth: 44,
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 16),
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
// if you need custom picker use this
                      pickerBuilder: (context, CountryCode? countryCode) {
                        return Container(
                          width: 90,
                          height: 41,
                          padding: const EdgeInsets.only(
                              top: 11, right: 6, bottom: 10, left: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: const Color(0xffcdccd1),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
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
                                  countryCode!.flagUri!,
                                  package: 'country_list_pick',
                                  width: 24,
                                  height: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  countryCode.code!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                  'assets/Vectores/Iconos/dwon chevron.svg'),
                            ],
                          ),
                        );
                      },

                      // To disable option set to false
                      theme: CountryTheme(
                          isShowFlag: true,
                          isShowTitle: false,
                          isShowCode: false,
                          isDownIcon: true,
                          showEnglishName: false,
                          labelColor: const Color(0xff170658),
                          searchText: 'Buscar',
                          searchHintText: 'Buscar país',
                          lastPickText: 'Ultima selección'),
                      // Set default value
                      initialSelection: isoCountryCode,
                      // or
                      // initialSelection: 'US'
                      onChanged: (CountryCode? countryCode) {
                        print(countryCode.toString());
                      },
                      // Whether to allow the widget to set a custom UI overlay
                      useUiOverlay: false,
                      // Whether the country list should be wrapped in a SafeArea
                      useSafeArea: false),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 27.0),
                child: Text(
                  "Vas a comprar",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 13,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: SizedBox(
                  width: 343,
                  child: Material(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: Color(0xffcdccd1),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset('assets/Imagenes/eblcoin.png'),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      "ebloqs",
                                      style: TextStyle(
                                        color: Color(0xff383346),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: SizedBox(
                              child: Text(
                                "EBL",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xff383346),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SvgPicture.asset(
                                'assets/Vectores/Iconos/dwon chevron.svg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
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
                child: Container(
                  width: 343,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: const Color(0xffcdccd1),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 44,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  "USD",
                                  style: TextStyle(
                                    color: Color(0xff383346),
                                    fontSize: 14,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            text,
                            style: const TextStyle(
                              color: Color(0xff383346),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: SizedBox(
                          child: Text(
                            "USD",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xff383346),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                            'assets/Vectores/Iconos/dwon chevron.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Text(
                  "Total EBL",
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
                child: Container(
                  width: 343,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: const Color(0xffcdccd1),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 44,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  "EBL",
                                  style: TextStyle(
                                    color: Color(0xff383346),
                                    fontSize: 14,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: SizedBox(
                          child: Text(
                            "10.000",
                            style: TextStyle(
                              color: Color(0xff383346),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 79,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: const Color(0xffcdccd1),
                            width: 1,
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: const SizedBox(
                          child: Text(
                            "\$50",
                            style: TextStyle(
                              color: Color(0xff383346),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          text = '50';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 79,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: const Color(0xffcdccd1),
                            width: 1,
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: const SizedBox(
                          child: Text(
                            "\$100",
                            style: TextStyle(
                              color: Color(0xff383346),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          text = '100';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 79,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: const Color(0xffcdccd1),
                            width: 1,
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: const SizedBox(
                          child: Text(
                            "\$200",
                            style: TextStyle(
                              color: Color(0xff383346),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          text = '200';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 79,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: const Color(0xffcdccd1),
                            width: 1,
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: const SizedBox(
                          child: Text(
                            "\$400",
                            style: TextStyle(
                              color: Color(0xff383346),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          text = '400';
                        });
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Container(
                  width: 341,
                  height: 1,
                  color: const Color(0xffD3D2D6),
                ),
              ),
              NumericKeyboard(
                onKeyboardTap: _onKeyboardTap,
                textColor: const Color(0xff170658),
                rightButtonFn: () {
                  setState(() {
                    if (text.isNotEmpty) {
                      text = text.substring(0, text.length - 1);
                    }
                  });
                },
                rightIcon: const Icon(
                  Icons.backspace_outlined,
                  color: Color(0xff170658),
                ),
                leftButtonFn: () {
                  setState(() {
                    text = "$text.";
                  });
                },
                leftIcon: const Icon(
                  Icons.circle,
                  color: Color(0xff170658),
                  size: 6,
                ),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 56.0),
                child: SizedBox(
                  width: 342,
                  child: Text(
                    "Método de Pago",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 15,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  width: 345,
                  height: 78,
                  padding: const EdgeInsets.only(left: 18, right: 18),
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
                      SvgPicture.asset('assets/Vectores/Iconos/bank.svg'),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Transferencia Bancaria",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 15,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Desde tus bancos favoritos",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      SvgPicture.asset(
                          'assets/Vectores/Iconos/chevronright.svg'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: 345,
                  height: 78,
                  padding: const EdgeInsets.only(left: 18, right: 18),
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
                      SvgPicture.asset('assets/Vectores/Iconos/card.svg'),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Tarjeta Bancaria",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 15,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Tarjeta de crédito o tarjeta de débito",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      SvgPicture.asset(
                          'assets/Vectores/Iconos/chevronright.svg'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24.0,
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
                          "Confirmar",
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
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            IntroducirCantidadTransferenciaScreen(
                          cantidadTransferencia: text,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onKeyboardTap(String value) {
    setState(() {
      print(text);
      text = text + value;
    });
  }
}
