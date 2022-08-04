import 'package:ebloqs_app/src/utilitis/tabbar.dart';
import 'package:ebloqs_app/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 55),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/Imagenes/avatar.png',
                    width: 25,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 259,
                    height: 36,
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
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              //Banner
              Container(
                width: 359,
                height: 164,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/Imagenes/Mask group.png'),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Column(
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
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              "0",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                              ),
                            ),
                            SizedBox(width: 13),
                            Text(
                              "EBL",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.55,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xff170658),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
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
              SizedBox(
                width: 355,
                height: 410,
                child: ListView.builder(
                  itemCount: inversiones.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 355,
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
                                  top: 6,
                                  right: 5,
                                  child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/Hearth.svg'))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 13.0, left: 12, right: 23),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      width: 141,
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
                                  width: 150,
                                  height: 49,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.40),
                                    color: const Color(0xfff9f9fa),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Center(
                              child: Container(
                                width: 385,
                                height: 0.88,
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Center(
                              child: Container(
                                width: 385,
                                height: 0.88,
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            child: Text(
                              "Rentabilidad acumulada promedio ${inversiones[index]['rentabilidad']}%",
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xff170658)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Center(
                              child: Container(
                                width: 385,
                                height: 0.88,
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
                            padding: const EdgeInsets.only(
                                bottom: 32, left: 12, right: 12),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 70.88,
                                  height: 24,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: const FlutterLogo(size: 24),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 15.63,
                                        top: 0,
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: const FlutterLogo(size: 24),
                                        ),
                                      ),
                                      Positioned(
                                        left: 31.26,
                                        top: 0,
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: const FlutterLogo(size: 24),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: const FlutterLogo(size: 24),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 12.0),
                                  child: SizedBox(
                                    width: 214,
                                    child: Text(
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
                    );
                  },
                ),
              ),
              //INVERSIONES CIUDAD 1
              const Padding(
                padding: EdgeInsets.only(top: 82.0, bottom: 13),
                child: Text(
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
                height: 365.76,
                child: ListView.builder(
                  itemCount: inversionesQuito.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index2) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        width: 172.76,
                        height: 340.76,
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
                                  top: 6,
                                  right: 5,
                                  child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/Hearth.svg'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 9.0, bottom: 4, left: 12, right: 12),
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
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, bottom: 8),
                              child: Text(
                                inversionesQuito[index2]['sector'],
                                style: const TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: Container(
                                width: 157,
                                height: 49,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 7),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 16),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Building.svg'),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              child: Center(
                                child: Container(
                                  width: 385,
                                  height: 0.88,
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
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
              const Padding(
                padding: EdgeInsets.only(top: 82.0, bottom: 13),
                child: Text(
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
                height: 380.76,
                child: ListView.builder(
                  itemCount: inversionesGuayaquil.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index3) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        width: 172.76,
                        height: 340.76,
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
                                  top: 6,
                                  right: 5,
                                  child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/Hearth.svg'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 9.0, bottom: 4, left: 12, right: 12),
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
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, bottom: 8),
                              child: Text(
                                inversionesGuayaquil[index3]['sector'],
                                style: const TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: Container(
                                width: 157,
                                height: 49,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 7),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 16),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Building.svg'),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              child: Center(
                                child: Container(
                                  width: 385,
                                  height: 0.88,
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
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
              const Padding(
                padding: EdgeInsets.only(top: 40.0, bottom: 16),
                child: Text(
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
                height: 285.64,
                child: ListView.builder(
                  itemCount: inversionesVehiculos.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index4) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Container(
                        width: 279.57,
                        height: 268.64,
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
                                  top: 6,
                                  right: 5,
                                  child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/Hearth.svg'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 18.0,
                                left: 15,
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
                              padding: const EdgeInsets.only(
                                  top: 7.0, left: 15, right: 80),
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
                                    width: 13,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 12),
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
                                      width: 13),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 15),
                              child: Center(
                                child: Container(
                                  width: 385,
                                  height: 0.88,
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
                              padding:
                                  const EdgeInsets.only(top: 16.0, bottom: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Plus.svg',
                                      width: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 9.0, right: 15),
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
              const Padding(
                padding: EdgeInsets.only(top: 40.0, bottom: 16),
                child: Text(
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
                height: 255.64,
                child: ListView.builder(
                  itemCount: inversionesEducacion.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index5) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Container(
                        width: 279.57,
                        height: 268.64,
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
                                  top: 6,
                                  right: 5,
                                  child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/Hearth.svg'),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 18.0,
                                left: 15,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 15),
                              child: Center(
                                child: Container(
                                  width: 385,
                                  height: 0.88,
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
                              padding:
                                  const EdgeInsets.only(top: 16.0, bottom: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Plus.svg',
                                      width: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 9.0, right: 15),
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
