import 'package:ebloqs_app/src/screens/project/project_view_screen.dart';
import 'package:ebloqs_app/src/utilitis/tabbar.dart';
import 'package:ebloqs_app/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Map<String, dynamic>> inversiones = [
      {
        'imagen': 'assets/Imagenes/heraldica.png',
        'inversion': 'Heráldica',
        'sector':
            'Sector González Suárez, pasaje Juan Pareja y Jiménez de la Espada.',
        'precio': '500',
        'pisos': '6',
        'rentabilidad': '31,5'
      },
    ];
    List<Map<String, dynamic>> inversionesQuito = [
      {
        'imagen': 'assets/Imagenes/quito1.png',
        'inversion': 'Heráldica',
        'sector': 'Av . Gonzalez Suarez y Av. Pinzon. Es 94',
        'precio': '100',
        'pisos': '6',
        'apartamentos': '36',
        'rentabilidad': '13.25'
      },
      {
        'imagen': 'assets/Imagenes/quito2.png',
        'inversion': 'Dinámica II',
        'sector': 'Av . Gonzalez Suarez y Av. Pinzon. Es 94',
        'precio': '120',
        'pisos': '6',
        'apartamentos': '36',
        'rentabilidad': '12.01'
      },
      {
        'imagen': 'assets/Imagenes/quito1.png',
        'inversion': 'Heráldica',
        'sector': 'Av . Gonzalez Suarez y Av. Pinzon. Es 94',
        'precio': '100',
        'pisos': '6',
        'apartamentos': '36',
        'rentabilidad': '13.25'
      },
      {
        'imagen': 'assets/Imagenes/quito2.png',
        'inversion': 'Dinámica II',
        'sector': 'Av . Gonzalez Suarez y Av. Pinzon. Es 94',
        'precio': '120',
        'pisos': '6',
        'apartamentos': '36',
        'rentabilidad': '12.01'
      },
    ];
    List<Map<String, dynamic>> inversionesGuayaquil = [
      {
        'imagen': 'assets/Imagenes/guayaquil1.png',
        'inversion': 'SOHO 360 Smart Office',
        'sector': 'Home Office - Consultorios · Puerto Santa Ana',
        'precio': '98',
        'pisos': '6',
        'apartamentos': '36',
        'rentabilidad': '13.25'
      },
      {
        'imagen': 'assets/Imagenes/guayaquil2.png',
        'inversion': 'Ágora Ciudad Médica',
        'sector': 'Av. Joaquín Orrantia y la Av. Abel Romeo Castillo',
        'precio': '103',
        'pisos': '6',
        'apartamentos': '36',
        'rentabilidad': '12.01'
      },
      {
        'imagen': 'assets/Imagenes/guayaquil1.png',
        'inversion': 'SOHO 360 Smart Office',
        'sector': 'Home Office - Consultorios · Puerto Santa Ana',
        'precio': '98',
        'pisos': '6',
        'apartamentos': '36',
        'rentabilidad': '13.25'
      },
      {
        'imagen': 'assets/Imagenes/guayaquil2.png',
        'inversion': 'Ágora Ciudad Médica',
        'sector': 'Av. Joaquín Orrantia y la Av. Abel Romeo Castillo',
        'precio': '103',
        'pisos': '6',
        'apartamentos': '36',
        'rentabilidad': '12.01'
      },
    ];
    List<Map<String, dynamic>> inversionesVehiculos = [
      {
        'imagen': 'assets/Imagenes/vehiculo1.png',
        'inversion': 'Jeep Wrangler 2017',
        'ratio': '4.91',
        'trips': '81',
        'star': 'All Star Host',
        'precio': '120',
      },
      {
        'imagen': 'assets/Imagenes/vehiculo2.png',
        'inversion': 'Jeep Wrangler 2017',
        'ratio': '4.91',
        'trips': '81',
        'star': 'All Star Host',
        'precio': '120',
      },
    ];
    List<Map<String, dynamic>> inversionesEducacion = [
      {
        'imagen': 'assets/Imagenes/educativa1.png',
        'inversion': 'Anáhuac México Norte',
        'oferta': 'Oferta educativa',
      },
      {
        'imagen': 'assets/Imagenes/educativa1.png',
        'inversion': 'Anáhuac México Norte',
        'oferta': 'Oferta educativa',
      },
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: systemBarDark,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.035, vertical: size.height * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/Imagenes/avatar.png',
                    width: size.width * 0.067,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: size.width * 0.69,
                    height: size.height * 0.047,
                    child: OutlineSearchBar(
                      borderRadius: BorderRadius.circular(100),
                      borderColor: const Color(0xffeae4fc),
                      searchButtonIconColor: const Color(0xff170658),
                      hideSearchButton: true,
                      hintText: 'Buscar Inversiones',
                      hintStyle: const TextStyle(
                        color: Color(0xff170658),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/Vectores/Iconos/Bell.svg',
                      width: size.width * 0.06,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              ImageSlideshow(

                  /// Auto scroll interval.
                  /// Do not auto scroll with null or 0.
                  autoPlayInterval: 3000,

                  /// Loops back to first slide.
                  isLoop: true,

                  /// The color to paint the indicator.
                  indicatorColor: Colors.transparent,

                  /// The color to paint behind th indicator.
                  indicatorBackgroundColor: Colors.transparent,
                  height: size.height * 0.25,
                  children: [
                    //tarjeta 1
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.02, bottom: size.height * 0.03),
                      child: Container(
                        width: size.width * 0.95,
                        height: size.height * 0.1,
                        padding: EdgeInsets.only(
                            top: size.height * 0.043,
                            left: size.width * 0.043,
                            right: size.width * 0.034),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/Imagenes/Mask group.png'),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "BALANCE DISPONIBLE",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.59,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.015),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "0",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 36,
                                        ),
                                      ),
                                      SizedBox(width: size.width * 0.035),
                                      const Text(
                                        "EBL",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.55,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.015),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: const Color(0xff170658),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.033,
                                      vertical: size.height * 0.01,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "0 USD",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontFamily: "Archivo",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: size.height * 0.022),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: size.width * 0.15,
                                    height: size.width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white.withOpacity(0.7),
                                          const Color(0x00ffffff)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/Vectores/Iconos/chevronright.svg',
                                    color: const Color(0xffffffff),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //tarjeta 2
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.02, bottom: size.height * 0.03),
                      child: Container(
                        width: size.width * 0.9,
                        height: size.height * 0.1,
                        padding: EdgeInsets.only(
                            top: size.height * 0.03,
                            left: size.width * 0.04,
                            right: size.width * 0.032),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/Imagenes/Mask group.png'),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.006,
                                      left: size.width * 0.11),
                                  child: Image.asset(
                                    'assets/Imagenes/Group 2066.png',
                                    width: size.width * 0.2,
                                    height: size.height * 0.09,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.027),
                                  child: const Text(
                                    "INVIERTE EN TOKENS EBLOQS",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: size.height * 0.022),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: size.height * 0.025,
                                        right: size.width * 0.05),
                                    child: const Text(
                                      "Preventa: Fase 1",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.59,
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: size.width * 0.04),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(126.47),
                                        color: const Color(0xff170658),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.04,
                                        vertical: size.width * 0.03,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "\$0,10 USD",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.44,
                                              fontFamily: "Archivo",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: size.width * 0.025),
                                    child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/chevronright.svg',
                                      color: const Color(0xffffffff),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
              //Banner

              // Inversión Inmobiliarias
              const Text(
                "Inversión Inmobiliarias",
                style: TextStyle(
                  color: Color(0xff170658),
                  fontSize: 15,
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.02),
                child: SizedBox(
                  width: size.width * 0.95,
                  height: size.height * 0.52,
                  child: ListView.builder(
                    itemCount: inversiones.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: Container(
                          width: size.width * 0.95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color(0xffeae4fc),
                              width: 0.88,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0f000000),
                                blurRadius: 17.62,
                                offset: Offset(0, 0),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.asset(inversiones[index]['imagen']),
                                  Positioned(
                                      top: size.height * 0.015,
                                      right: size.width * 0.03,
                                      child: SvgPicture.asset(
                                          'assets/Vectores/Iconos/Hearth.svg'))
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.017,
                                    left: size.width * 0.032,
                                    right: size.width * 0.032),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          inversiones[index]['inversion'],
                                          style: const TextStyle(
                                            color: Color(0xff170658),
                                            fontSize: 15,
                                            fontFamily: "Archivo",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.37,
                                          child: Text(
                                            inversiones[index]['sector'],
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                              color: Color(0xff170658),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Container(
                                      width: size.width * 0.4,
                                      height: size.height * 0.063,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.025,
                                          vertical: size.height * 0.009),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.40),
                                        color: const Color(0xfff9f9fa),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Precio x Token \$${inversiones[index]['precio']}",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Color(0xff2504ca),
                                              fontSize: 13,
                                              fontFamily: "Archivo",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Text(
                                            "1 EBL",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Color(0xff170658),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.032,
                                    vertical: size.height * 0.015),
                                child: Center(
                                  child: Container(
                                    width: size.width * 0.9,
                                    height: size.height * 0.001,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xff170658),
                                        width: 0.12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.032,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/Vectores/Iconos/Building.svg'),
                                    Text(
                                      "${inversiones[index]['pisos']} Pisos ",
                                      style: const TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 12,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    SvgPicture.asset(
                                        'assets/Vectores/Iconos/Plus.svg'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.032,
                                    vertical: size.height * 0.015),
                                child: Center(
                                  child: Container(
                                    width: size.width * 0.9,
                                    height: size.height * 0.001,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xff170658),
                                        width: 0.12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.032,
                                ),
                                child: Text(
                                  "Rentabilidad acumulada promedio ${inversiones[index]['rentabilidad']}%",
                                  style: const TextStyle(
                                      fontSize: 12, color: Color(0xff170658)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.032,
                                    vertical: size.height * 0.0152),
                                child: Center(
                                  child: Container(
                                    width: size.width * 0.9,
                                    height: size.height * 0.001,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xff170658),
                                        width: 0.12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: size.height * 0.04,
                                    left: size.width * 0.032,
                                    right: size.width * 0.032),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.2,
                                      height: size.height * 0.03,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: size.width * 0.065,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                                'assets/avatares/2x/profile-1-2x.png'),
                                          ),
                                          Positioned(
                                            left: size.width * 0.045,
                                            child: Container(
                                              width: size.width * 0.065,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                  'assets/avatares/2x/profile-2-2x.png'),
                                            ),
                                          ),
                                          Positioned(
                                            left: size.width * 0.09,
                                            child: Container(
                                              width: size.width * 0.065,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                  'assets/avatares/2x/profile-3-2x.png'),
                                            ),
                                          ),
                                          Positioned(
                                            left: size.width * 0.13,
                                            child: Container(
                                              width: size.width * 0.065,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                  'assets/avatares/2x/profile-4-2x.png'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.03),
                                      child: SizedBox(
                                        width: size.width * 0.57,
                                        child: const Text(
                                          '''+ 100 personas ya compraron
                      tokens en esta propiedad.''',
                                          style: TextStyle(
                                            color: Color(0xff170658),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, ProjectViewScreen.routeName);
                        },
                      );
                    },
                  ),
                ),
              ),
              //INVERSIONES CIUDAD 1
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.105, bottom: size.height * 0.015),
                child: const Text(
                  "Inversiones en Quito",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 15,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.46,
                child: ListView.builder(
                  itemCount: inversionesQuito.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index2) {
                    return Padding(
                      padding: EdgeInsets.only(right: size.width * 0.04),
                      child: Container(
                        width: size.width * 0.46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xffeae4fc),
                            width: 0.88,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0f000000),
                              blurRadius: 17.62,
                              offset: Offset(0, 0),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.asset(inversionesQuito[index2]['imagen']),
                                Positioned(
                                  top: size.height * 0.008,
                                  right: size.width * 0.015,
                                  child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/Hearth.svg'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.012,
                                  bottom: size.height * 0.003,
                                  left: size.width * 0.032,
                                  right: size.width * 0.032),
                              child: Text(
                                inversionesQuito[index2]['inversion'],
                                style: const TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 14,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.032,
                                  right: size.width * 0.032,
                                  bottom: size.height * 0.01),
                              child: Text(
                                inversionesQuito[index2]['sector'],
                                style: const TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.0098),
                              child: Container(
                                width: size.width * 0.5,
                                height: size.height * 0.06,
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.007),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.40),
                                  color: const Color(0xfff9f9fa),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Precio token",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 10,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "USD\$ ${inversionesQuito[index2]['precio']}",
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            color: Color(0xff2504ca),
                                            fontSize: 13,
                                            fontFamily: "Archivo",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Text(
                                          "1 EBL",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xff170658),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.02),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Building.svg'),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.02),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${inversionesQuito[index2]['pisos']} Pisos ",
                                          style: const TextStyle(
                                            color: Color(0xff170658),
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "${inversionesQuito[index2]['apartamentos']} Apartamentos ",
                                          style: const TextStyle(
                                            color: Color(0xff170658),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Plus.svg'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.015),
                              child: Center(
                                child: Container(
                                  height: size.height * 0.001,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xff170658),
                                      width: 0.12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    "Rentabilidad",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff170658)),
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    "${inversionesQuito[index2]['rentabilidad']}%",
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xff170658)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Inversiones ciudad 2
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.105, bottom: size.height * 0.012),
                child: const Text(
                  "Inversiones en Guayaquil",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 15,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.475,
                child: ListView.builder(
                  itemCount: inversionesGuayaquil.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index3) {
                    return Padding(
                      padding: EdgeInsets.only(right: size.width * 0.045),
                      child: Container(
                        width: size.width * 0.46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xffeae4fc),
                            width: 0.88,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0f000000),
                              blurRadius: 17.62,
                              offset: Offset(0, 0),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                    inversionesGuayaquil[index3]['imagen']),
                                Positioned(
                                  top: size.height * 0.01,
                                  right: size.width * 0.015,
                                  child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/Hearth.svg'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.012,
                                  bottom: size.height * 0.007,
                                  left: size.width * 0.02,
                                  right: size.width * 0.02),
                              child: Text(
                                inversionesGuayaquil[index3]['inversion'],
                                style: const TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 14,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.034,
                                right: size.width * 0.034,
                                bottom: size.height * 0.01,
                              ),
                              child: Text(
                                inversionesGuayaquil[index3]['sector'],
                                style: const TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                              ),
                              child: Container(
                                width: size.width * 0.5,
                                height: size.height * 0.06,
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.025,
                                    vertical: size.height * 0.007),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.40),
                                  color: const Color(0xfff9f9fa),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Precio token",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 10,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "USD\$ ${inversionesGuayaquil[index3]['precio']}",
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            color: Color(0xff2504ca),
                                            fontSize: 13,
                                            fontFamily: "Archivo",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Text(
                                          "1 EBL",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xff170658),
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.02),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Building.svg'),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.02),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${inversionesGuayaquil[index3]['pisos']} Pisos ",
                                          style: const TextStyle(
                                            color: Color(0xff170658),
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "${inversionesGuayaquil[index3]['apartamentos']} Apartamentos ",
                                          style: const TextStyle(
                                            color: Color(0xff170658),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Plus.svg'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.017),
                              child: Center(
                                child: Container(
                                  width: size.width * 0.9,
                                  height: size.height * 0.002,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xff170658),
                                      width: 0.12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    "Rentabilidad",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff170658)),
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    "${inversionesGuayaquil[index3]['rentabilidad']}%",
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xff170658)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // INVERSION VEHÍCULOS
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.05, bottom: size.height * 0.02),
                child: const Text(
                  "Inversión vehículos",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 15,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.35,
                child: ListView.builder(
                  itemCount: inversionesVehiculos.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index4) {
                    return Padding(
                      padding: EdgeInsets.only(right: size.width * 0.05),
                      child: Container(
                        width: size.width * 0.74,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.64),
                          border: Border.all(
                            color: const Color(0xffeae4fc),
                            width: 0.64,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0f000000),
                              blurRadius: 12.83,
                              offset: Offset(0, 0),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                    inversionesVehiculos[index4]['imagen']),
                                Positioned(
                                  top: size.height * 0.01,
                                  right: size.width * 0.01,
                                  child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/Hearth.svg'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.023,
                                left: size.width * 0.04,
                              ),
                              child: Text(
                                inversionesVehiculos[index4]['inversion'],
                                style: const TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 14.57,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.01,
                                  left: size.width * 0.04,
                                  right: size.width * 0.21),
                              child: Row(
                                children: [
                                  Text(
                                    inversionesVehiculos[index4]['ratio'],
                                    style: const TextStyle(
                                      color: Color(0xff170658),
                                      fontSize: 10.93,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/Vectores/Iconos/star-fill1.svg',
                                    width: size.width * 0.035,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: size.width * 0.032,
                                      right: size.width * 0.032,
                                    ),
                                    child: Text(
                                      "(${inversionesVehiculos[index4]['trips']} trips)",
                                      style: const TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 10.93,
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/Vectores/Iconos/Award.svg',
                                    width: size.width * 0.035,
                                  ),
                                  Text(
                                    inversionesVehiculos[index4]['star'],
                                    style: const TextStyle(
                                      color: Color(0xff170658),
                                      fontSize: 10.93,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.032,
                                  vertical: size.height * 0.018),
                              child: Center(
                                child: Container(
                                  width: size.width * 0.9,
                                  height: size.height * 0.001,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xff170658),
                                      width: 0.12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.width * 0.04,
                                  bottom: size.height * 0.022),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Plus.svg',
                                      width: 18),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.02,
                                        right: size.width * 0.04),
                                    child: Text(
                                      "\$${inversionesVehiculos[index4]['precio']}/day",
                                      style: const TextStyle(
                                        color: Color(0xff2504ca),
                                        fontSize: 12.38,
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // INVERSION EDUCACIÓN
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.05, bottom: size.height * 0.02),
                child: const Text(
                  "Inversión educación",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 15,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.32,
                child: ListView.builder(
                  itemCount: inversionesEducacion.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index5) {
                    return Padding(
                      padding: EdgeInsets.only(right: size.width * 0.045),
                      child: Container(
                        width: size.width * 0.74,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.64),
                          border: Border.all(
                            color: const Color(0xffeae4fc),
                            width: 0.64,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0f000000),
                              blurRadius: 12.83,
                              offset: Offset(0, 0),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                    inversionesEducacion[index5]['imagen']),
                                Positioned(
                                  top: size.height * 0.007,
                                  right: size.width * 0.015,
                                  child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/Hearth.svg'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.023,
                                left: size.width * 0.04,
                              ),
                              child: Text(
                                inversionesEducacion[index5]['inversion'],
                                style: const TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 14.57,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.018),
                              child: Center(
                                child: Container(
                                  width: size.width * 0.9,
                                  height: size.height * 0.001,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xff170658),
                                      width: 0.12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.02,
                                  bottom: size.height * 0.022),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Plus.svg',
                                      width: 18),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.025,
                                        right: size.width * 0.04),
                                    child: Text(
                                      "${inversionesEducacion[index5]['oferta']}",
                                      style: const TextStyle(
                                        color: Color(0xff2504ca),
                                        fontSize: 12.38,
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigator(),
    );
  }
}
