import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProjectViewScreen extends StatefulWidget {
  static const routeName = 'ProjectViewScreen';
  const ProjectViewScreen({Key? key}) : super(key: key);

  @override
  State<ProjectViewScreen> createState() => _ProjectViewScreenState();
}

class _ProjectViewScreenState extends State<ProjectViewScreen> {
  int? currentIndex;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.56,
                  child: ExtendedImageGesturePageView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      List imagenes = [
                        'assets/Imagenes/Group 2149.jpg',
                        'assets/Imagenes/Group 2149.jpg',
                        'assets/Imagenes/Group 2149.jpg',
                        'assets/Imagenes/Group 2149.jpg',
                        'assets/Imagenes/Group 2149.jpg',
                        'assets/Imagenes/Group 2149.jpg',
                      ];
                      var item = imagenes[index];
                      Widget image = ExtendedImage.asset(
                        item,
                        fit: BoxFit.contain,
                        mode: ExtendedImageMode.gesture,
                        initGestureConfigHandler: (ExtendedImageState state) {
                          return GestureConfig(
                              inPageView: true,
                              initialScale: 1,
                              cacheGesture: false);
                        },
                      );
                      image = Container(
                        child: image,
                      );
                      if (index == currentIndex) {
                        return Hero(
                          tag: item + index.toString(),
                          child: image,
                        );
                      } else {
                        return image;
                      }
                    },
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    controller:
                        ExtendedPageController(initialPage: currentIndex ?? 0),
                    onPageChanged: (int index) {
                      currentIndex = index;
                      setState(() {});
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * (178 / size.height),
                      right: size.width * (15 / size.width),
                      left: size.width * (15 / size.width)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Precio edificio",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "USD \$4.700.000",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * (10 / size.height),
                            bottom: size.height * (7 / size.height)),
                        child: Container(
                          width: size.width * (345.5 / size.width),
                          height: 0.50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffc7c2d9),
                              width: 0.50,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Tokens emitidos",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "9.400",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * (10 / size.height),
                            bottom: size.height * (7 / size.height)),
                        child: Container(
                          width: size.width * (345.5 / size.width),
                          height: 0.50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffc7c2d9),
                              width: 0.50,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Tokens disponibles",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "7.857",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * (24 / size.height)),
                        child: SizedBox(
                          width: size.width,
                          height: size.height * (63 / size.height),
                          child: Stack(
                            children: [
                              Container(
                                width: size.width * (43 / size.width),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                    'assets/avatares/2x/profile-1-2x.png'),
                              ),
                              Positioned(
                                left: size.width * (25 / size.width),
                                child: Container(
                                  width: size.width * (43 / size.width),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                      'assets/avatares/2x/profile-2-2x.png'),
                                ),
                              ),
                              Positioned(
                                left: size.width * (50 / size.width),
                                child: Container(
                                  width: size.width * (43 / size.width),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                      'assets/avatares/2x/profile-3-2x.png'),
                                ),
                              ),
                              Positioned(
                                left: size.width * (75 / size.width),
                                child: Container(
                                  width: size.width * (43 / size.width),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                      'assets/avatares/2x/profile-4-2x.png'),
                                ),
                              ),
                              Positioned(
                                left: size.width * (102 / size.width),
                                child: Container(
                                  width: size.width * (22 / size.width),
                                  padding: EdgeInsets.only(
                                      top: size.height * (25 / size.height)),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child:
                                      Image.asset('assets/Imagenes/check.png'),
                                ),
                              ),
                              Positioned(
                                left: size.width * (134 / size.width),
                                child: SizedBox(
                                  width: size.width * (210 / size.width),
                                  child: const Text(
                                    "Únete y sé dueño de las  mejores oportunidades  de inversión inmobiliarias",
                                    style: TextStyle(
                                      color: Color(0xff170658),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * (10 / size.height)),
                        child: Container(
                          width: size.width,
                          height: size.height * (440 / size.height),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xffccc6dc),
                              width: 1,
                            ),
                            color: const Color(0xfff9f9fa),
                          ),
                          padding: EdgeInsets.only(
                            left: size.width * (13 / size.width),
                            right: size.width * (18 / size.width),
                            top: size.height * (23 / size.height),
                            bottom: size.height * (34 / size.height),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Datos del proyecto",
                                    style: TextStyle(
                                      color: Color(0xff2504ca),
                                      fontSize: 17,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Chevron.svg')
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * (33 / size.height),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/Vectores/Iconos/inversiones.svg'),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * (8 / size.width)),
                                      child: const Text(
                                        "Tipo de proyecto",
                                        style: TextStyle(
                                          color: Color(0xff170658),
                                          fontSize: 14,
                                          fontFamily: "Archivo",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * (11 / size.height),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Edificio superficie (m2)",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " 3.437",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * (9 / size.height),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Número departamentos",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "34",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * (9 / size.height),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Número amenidades",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "10",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * (9 / size.height),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Electrolineras",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "2",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * (9 / size.height),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Vehículo eléctrico comunal",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "1",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * (9 / size.height),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Concierge edificio",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "1",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * (30 / size.height),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/Vectores/Iconos/PC.svg'),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * (8 / size.width)),
                                      child: const Text(
                                        "Validación",
                                        style: TextStyle(
                                          color: Color(0xff170658),
                                          fontSize: 14,
                                          fontFamily: "Archivo",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * (11 / size.height),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Certificación EDGE",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Ok",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * (9 / size.height),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Fideicomiso ",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Ok",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * (9 / size.height),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Planos aprobados",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Ok",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: size.height * (9 / size.height),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Licencia de construcción",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "Ok",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * (24 / size.height)),
                        child: Container(
                          width: size.width,
                          height: size.height * (460 / size.height),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xffccc6dc),
                              width: 1,
                            ),
                            color: const Color(0xfff9f9fa),
                          ),
                          padding: EdgeInsets.only(
                            left: size.width * (13 / size.width),
                            right: size.width * (18 / size.width),
                            top: size.height * (23 / size.height),
                            bottom: size.height * (34 / size.height),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Tokenomics del proyecto",
                                    style: TextStyle(
                                      color: Color(0xff2504ca),
                                      fontSize: 17,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Chevron.svg')
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (30 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Interés durante construcción",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "USD \$215.000",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (30 / size.height)),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/trending up.svg'),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * (8 / size.width)),
                                    child: const Text(
                                      "Alquiler",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (13 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Renting anual",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "\$430.000",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (3 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Gasto anual",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " \$100.000",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (3 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Beneficio neto anual",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " \$330.000",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (33 / size.height)),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/trending up.svg'),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * (8 / size.width)),
                                    child: const Text(
                                      "Rentabilidad estimada",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (13 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Interés construcción (1 año)",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "\$215.000",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (3 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Renting neto (2 años)",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "\$660.000",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (3 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Plusvalía (3 años)",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "\$435.000",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (3 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Neto (3 años)",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "\$1.310.000",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (30 / size.height)),
                                child: SizedBox(
                                  width: size.width * (318 / size.width),
                                  child: const Text(
                                    "*Los intereses son promedios, su naturaleza es especulativa, implican un grado de riesgo. El pago es trimestral, anual y al final de la inversión.",
                                    style: TextStyle(
                                      color: Color(0xff170658),
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * (24 / size.height)),
                        child: Container(
                          width: size.width,
                          height: size.height * (545 / size.height),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xffccc6dc),
                              width: 1,
                            ),
                            color: const Color(0xfff9f9fa),
                          ),
                          padding: EdgeInsets.only(
                            left: size.width * (13 / size.width),
                            right: size.width * (18 / size.width),
                            top: size.height * (23 / size.height),
                            bottom: size.height * (34 / size.height),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Descripción de la zona",
                                    style: TextStyle(
                                      color: Color(0xff2504ca),
                                      fontSize: 17,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Chevron.svg')
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (33 / size.height)),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/trending up.svg'),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * (8 / size.width)),
                                    child: const Text(
                                      "Centros comerciales",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (11 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Mall el Jardín",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "5 min",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (6 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Quicentro shopping",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " 8 min",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (6 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "CCI",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " 9 min",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (6 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "CCNU",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " 9 min",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (33 / size.height)),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/trending up.svg'),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * (8 / size.width)),
                                    child: const Text(
                                      "Supermercados",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (11 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Megamaxi",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "7 min",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (6 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Mi Comisariato",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " 9 min",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (6 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Coral Hipermercado",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " 12min",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (33 / size.height)),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/trending up.svg'),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * (8 / size.width)),
                                    child: const Text(
                                      "Parques",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (11 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "La Carolina",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "4 min",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (6 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Metropolitano",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      " 7 min",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (33 / size.height)),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/trending up.svg'),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * (8 / size.width)),
                                    child: const Text(
                                      "Metrovía",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (11 / size.height)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Estación la carolina",
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      "5 min",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff170658),
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * (24 / size.height)),
                        child: Container(
                          width: size.width,
                          height: size.height * (204 / size.height),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xffccc6dc),
                              width: 1,
                            ),
                            color: const Color(0xfff9f9fa),
                          ),
                          padding: EdgeInsets.only(
                            left: size.width * (13 / size.width),
                            right: size.width * (18 / size.width),
                            top: size.height * (23 / size.height),
                            bottom: size.height * (34 / size.height),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Datos del promotor",
                                    style: TextStyle(
                                      color: Color(0xff2504ca),
                                      fontSize: 17,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/Chevron.svg')
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (34 / size.height)),
                                child: const Text(
                                  "MASCONSTRU SAS",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 14,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (11 / size.height)),
                                child: SizedBox(
                                  width: size.width * (308 / size.width),
                                  child: const Text(
                                    "La constructora se ha caracterizado por ofrecer al mercado de Quito, proyectos de vanguardia con dinámica social, moderna y sostenible.",
                                    style: TextStyle(
                                      color: Color(0xff170658),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: size.height * (410 / size.height),
              left: size.width * (15 / size.width),
              right: size.width * (15 / size.width),
              child: Container(
                width: size.width * (345 / size.width),
                height: size.height * (176 / size.height),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x16000000),
                      blurRadius: 20,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * (13 / size.height),
                          left: size.width * (13 / size.width)),
                      child: const Text(
                        "Proyecto",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: size.width * (13 / size.width)),
                      child: const Text(
                        "Heráldica",
                        style: TextStyle(
                          color: Color(0xff2504ca),
                          fontSize: 22,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: size.width * (13 / size.width)),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/Vectores/Iconos/location.svg'),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * (11.57 / size.width)),
                            child: SizedBox(
                              width: size.width * (301 / size.width),
                              child: const Text(
                                "Sector González Suárez, pasaje Juan Pareja y Jiménez de la Espada.",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * (6 / size.height),
                      ),
                      child: Container(
                        width: size.width * (344.50 / size.width),
                        height: 0.50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffc7c2d9),
                            width: 0.50,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * (345 / size.width),
                      height: size.height * (89 / size.height),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x16000000),
                            blurRadius: 20,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Color(0xfff6f4fd),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (18 / size.height),
                                    left: size.width * (13 / size.width)),
                                child: const Text(
                                  "USD \$500",
                                  style: TextStyle(
                                    color: Color(0xff2504ca),
                                    fontSize: 17,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * (13 / size.width)),
                                child: const Text(
                                  "Precio token",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 14,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * (13 / size.width)),
                                child: const Text(
                                  "1 EBL-HERALD-01",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: size.width * (10 / size.width),
                            ),
                            child: GestureDetector(
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    height: size.height * (52 / size.height),
                                    width: size.width * (139 / size.width),
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/png/buttongradient.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Center(
                                    child: Text(
                                      "Invertir",
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
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * (44 / size.height),
              left: size.width * (13 / size.width),
              child: GestureDetector(
                child: SvgPicture.asset('assets/Vectores/Iconos/Group 199.svg'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
                top: size.height * (44 / size.height),
                right: size.width * (13 / size.width),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * (8 / size.width),
                    vertical: size.height * (4 / size.height),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "1/5",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
              top: size.height * (306 / size.height),
              right: size.width * (13 / size.width),
              child: Column(
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                        'assets/Vectores/Iconos/Group 149.svg'),
                    onTap: () {},
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: size.height * (9 / size.height)),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                          'assets/Vectores/Iconos/Group 198.svg'),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
