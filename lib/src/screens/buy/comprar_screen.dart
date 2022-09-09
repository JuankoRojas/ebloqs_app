import 'package:after_layout/after_layout.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:ebloqs_app/src/providers/locations_provider.dart';
import 'package:ebloqs_app/src/screens/buy/introducir_cantidad_tarjeta_screen.dart';
import 'package:ebloqs_app/src/screens/buy/introducir_cantidad_transferencia_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';

class ComprarScreen extends StatefulWidget {
  static const String routeName = 'ComprarScreen';
  const ComprarScreen({Key? key}) : super(key: key);

  @override
  State<ComprarScreen> createState() => _ComprarScreenState();
}

class _ComprarScreenState extends State<ComprarScreen>
    with AfterLayoutMixin<ComprarScreen> {
  String text = '';
  double ingr = 0.0;
  double total = 0.0;
  bool transferSelect = false;
  bool bankSelect = false;

  @override
  void afterFirstLayout(BuildContext context) {
    useLocation();
  }

  void useLocation() async {
    var locationProvider =
        Provider.of<LocationsProvider>(context, listen: false);
    await locationProvider.requestPermisionLocation();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
    // String? isoCountryCode = systemLocales.first.countryCode;
    // print(isoCountryCode);

    if (text != '') {
      ingr = double.parse(text);
      total = ingr / 0.05;
    }
    final locationValue =
        Provider.of<LocationsProvider>(context).countryCode.text;
    if (locationValue.isEmpty) {
      return Scaffold(
        body: Center(
          child: Lottie.asset('assets/lottie/X2lNy3zK9f.json'),
        ),
      );
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
              right: size.width * (16 / size.width)),
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
                      print('pop');
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding:
                        EdgeInsets.only(left: size.width * (40 / size.width)),
                    child: const Text(
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
// if you need custom picker use this
                      pickerBuilder: (context, CountryCode? countryCode) {
                        return Container(
                          width: size.width * (90 / size.width),
                          height: size.height * (41 / size.height),
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
                                  width: size.width * (24 / size.width),
                                  height: size.height * (24 / size.height),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * (4 / size.width)),
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
                      initialSelection: locationValue,
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
              Padding(
                padding: EdgeInsets.only(top: size.height * (27 / size.height)),
                child: const Text(
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
                padding: EdgeInsets.only(top: size.height * (5 / size.height)),
                child: SizedBox(
                  width: size.width,
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
                            width: size.width * (20 / size.width),
                            height: size.height * (20 / size.height),
                            child: SvgPicture.asset(
                                'assets/Vectores/Iconos/ebloqscoinb.svg'),
                          ),
                          SizedBox(width: size.width * (10 / size.width)),
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
                          SizedBox(width: size.width * (10 / size.width)),
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
                          SizedBox(width: size.width * (10 / size.width)),
                          // Container(
                          //   width: size.width * (20 / size.width),
                          //   height: size.height * (20 / size.height),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(8),
                          //   ),
                          //   child: SvgPicture.asset(
                          //       'assets/Vectores/Iconos/dwon chevron.svg'),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * (18 / size.height)),
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
                padding: EdgeInsets.only(top: size.height * (8 / size.height)),
                child: Container(
                  width: size.width,
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
                        width: size.width * (44 / size.width),
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
                      SizedBox(
                        width: size.width * (10 / size.width),
                      ),
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
                      SizedBox(
                        width: size.width * (10 / size.width),
                      ),
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
                      SizedBox(
                        width: size.width * (10 / size.width),
                      ),
                      // Container(
                      //   width: size.width * (20 / size.width),
                      //   height: size.height * (20 / size.height),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8),
                      //   ),
                      //   child: SvgPicture.asset(
                      //       'assets/Vectores/Iconos/dwon chevron.svg'),
                      // ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * (18 / size.height),
                ),
                child: const Text(
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
                padding: EdgeInsets.only(
                  top: size.height * (8 / size.height),
                ),
                child: Container(
                  width: size.width,
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
                        width: size.width * (44 / size.width),
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
                      SizedBox(
                        width: size.width * (10 / size.width),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            total.toString(),
                            style: const TextStyle(
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
                padding: EdgeInsets.only(
                  top: size.height * (32 / size.height),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: size.width * (79 / size.width),
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
                        width: size.width * (79 / size.width),
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
                        width: size.width * (79 / size.width),
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
                        width: size.width * (79 / size.width),
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
                padding: EdgeInsets.only(
                  top: size.height * (24 / size.height),
                ),
                child: Container(
                  width: size.width,
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
                // leftButtonFn: () {
                //   setState(() {
                //     text = "$text.";
                //   });
                // },
                // leftIcon: const Icon(
                //   Icons.circle,
                //   color: Color(0xff170658),
                //   size: 6,
                // ),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * (56 / size.height),
                ),
                child: SizedBox(
                  width: size.width * (342 / size.width),
                  child: const Text(
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
                padding: EdgeInsets.only(
                  top: size.height * (15 / size.height),
                ),
                child: GestureDetector(
                  child: Container(
                    width: size.width,
                    height: size.height * (78 / size.height),
                    padding: EdgeInsets.only(
                      left: size.width * (18 / size.width),
                      right: size.width * (18 / size.width),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: (transferSelect)
                            ? const Color(0xff170658)
                            : const Color(0xffeae4fc),
                        width: 1,
                      ),
                      color: const Color(0xfff9f9fa),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/Vectores/Iconos/bank.svg',
                          color: (transferSelect)
                              ? const Color(0xff170658)
                              : const Color(0xff170658).withOpacity(0.5),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * (16 / size.width),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Transferencia Bancaria",
                                style: TextStyle(
                                  color: (transferSelect)
                                      ? const Color(0xff170658)
                                      : const Color(0xff170658)
                                          .withOpacity(0.5),
                                  fontSize: 15,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Desde tus bancos favoritos",
                                style: TextStyle(
                                  color: (transferSelect)
                                      ? const Color(0xff170658)
                                      : const Color(0xff170658)
                                          .withOpacity(0.5),
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: Container()),
                        // SvgPicture.asset(
                        //     'assets/Vectores/Iconos/chevronright.svg'),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      transferSelect = !transferSelect;
                      if (bankSelect) {
                        bankSelect = !bankSelect;
                      }
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * (8 / size.height),
                ),
                child: GestureDetector(
                  child: Container(
                    width: size.width,
                    height: size.height * (78 / size.height),
                    padding: EdgeInsets.only(
                      left: size.width * (18 / size.width),
                      right: size.width * (18 / size.width),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: (bankSelect)
                            ? const Color(0xff170658)
                            : const Color(0xffeae4fc),
                        width: 1,
                      ),
                      color: const Color(0xfff9f9fa),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/Vectores/Iconos/card.svg',
                          color: (bankSelect)
                              ? const Color(0xff170658)
                              : const Color(0xff170658).withOpacity(0.5),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * (16 / size.width),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tarjeta Bancaria",
                                style: TextStyle(
                                  color: (bankSelect)
                                      ? const Color(0xff170658)
                                      : const Color(0xff170658)
                                          .withOpacity(0.5),
                                  fontSize: 15,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Tarjeta de crédito o tarjeta de débito",
                                style: TextStyle(
                                  color: (bankSelect)
                                      ? const Color(0xff170658)
                                      : const Color(0xff170658)
                                          .withOpacity(0.5),
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: Container()),
                        // SvgPicture.asset(
                        //     'assets/Vectores/Iconos/chevronright.svg'),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      bankSelect = !bankSelect;
                      if (transferSelect) {
                        transferSelect = !transferSelect;
                      }
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * (24 / size.height),
                ),
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
                    if (text != '' && transferSelect) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              IntroducirCantidadTransferenciaScreen(
                            cantidadTransferencia: text,
                          ),
                        ),
                      );
                    } else if (text != '' && bankSelect) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  IntroducirCantidadTarjetaScreen(
                                    cantidadTarjeta: text,
                                  )));
                    }
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
