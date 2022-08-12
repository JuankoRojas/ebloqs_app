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
                  padding:
                      const EdgeInsets.only(top: 178, right: 15.0, left: 15),
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
                        padding: const EdgeInsets.only(top: 10.0, bottom: 7),
                        child: Container(
                          width: 345.50,
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
                        padding: const EdgeInsets.only(top: 10.0, bottom: 7),
                        child: Container(
                          width: 345.50,
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
                        padding: const EdgeInsets.only(top: 24.0),
                        child: SizedBox(
                          width: size.width,
                          height: 63,
                          child: Stack(
                            children: [
                              Container(
                                width: 43,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                    'assets/avatares/2x/profile-1-2x.png'),
                              ),
                              Positioned(
                                left: 25,
                                child: Container(
                                  width: 43,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                      'assets/avatares/2x/profile-2-2x.png'),
                                ),
                              ),
                              Positioned(
                                left: 50,
                                child: Container(
                                  width: 43,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                      'assets/avatares/2x/profile-3-2x.png'),
                                ),
                              ),
                              Positioned(
                                left: 75,
                                child: Container(
                                  width: 43,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                      'assets/avatares/2x/profile-4-2x.png'),
                                ),
                              ),
                              Positioned(
                                left: 102,
                                child: Container(
                                  width: 22,
                                  padding: const EdgeInsets.only(top: 25),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child:
                                      Image.asset('assets/Imagenes/check.png'),
                                ),
                              ),
                              const Positioned(
                                left: 134,
                                child: SizedBox(
                                  width: 210,
                                  child: Text(
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
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          width: 345,
                          height: 440,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xffccc6dc),
                              width: 1,
                            ),
                            color: const Color(0xfff9f9fa),
                          ),
                          padding: const EdgeInsets.only(
                            left: 13,
                            right: 18,
                            top: 23,
                            bottom: 34,
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
                                padding: const EdgeInsets.only(
                                  top: 33.0,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/Vectores/Iconos/inversiones.svg'),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
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
                                padding: const EdgeInsets.only(
                                  top: 11.0,
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
                                padding: const EdgeInsets.only(
                                  top: 9.0,
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
                                padding: const EdgeInsets.only(
                                  top: 9.0,
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
                                padding: const EdgeInsets.only(
                                  top: 9.0,
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
                                padding: const EdgeInsets.only(
                                  top: 9.0,
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
                                padding: const EdgeInsets.only(
                                  top: 9.0,
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
                                padding: const EdgeInsets.only(
                                  top: 30.0,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/Vectores/Iconos/PC.svg'),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
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
                                padding: const EdgeInsets.only(
                                  top: 11.0,
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
                                padding: const EdgeInsets.only(
                                  top: 9.0,
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
                                padding: const EdgeInsets.only(
                                  top: 9.0,
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
                                padding: const EdgeInsets.only(
                                  top: 9.0,
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
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Container(
                          width: 345,
                          height: 460,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xffccc6dc),
                              width: 1,
                            ),
                            color: const Color(0xfff9f9fa),
                          ),
                          padding: const EdgeInsets.only(
                            left: 13,
                            right: 18,
                            top: 23,
                            bottom: 34,
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
                                padding: const EdgeInsets.only(top: 30.0),
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
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/trending up.svg'),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
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
                                padding: const EdgeInsets.only(top: 13.0),
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
                                padding: const EdgeInsets.only(top: 3.0),
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
                                padding: const EdgeInsets.only(top: 3.0),
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
                                padding: const EdgeInsets.only(top: 33.0),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/trending up.svg'),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
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
                                padding: const EdgeInsets.only(top: 13.0),
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
                                padding: const EdgeInsets.only(top: 3.0),
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
                                padding: const EdgeInsets.only(top: 3.0),
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
                                padding: const EdgeInsets.only(top: 3.0),
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
                              const Padding(
                                padding: EdgeInsets.only(top: 30.0),
                                child: SizedBox(
                                  width: 318,
                                  child: Text(
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
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Container(
                          width: 345,
                          height: 545,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xffccc6dc),
                              width: 1,
                            ),
                            color: const Color(0xfff9f9fa),
                          ),
                          padding: const EdgeInsets.only(
                            left: 13,
                            right: 18,
                            top: 23,
                            bottom: 34,
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
                                padding: const EdgeInsets.only(top: 33.0),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/trending up.svg'),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
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
                                padding: const EdgeInsets.only(top: 11.0),
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
                                padding: const EdgeInsets.only(top: 6.0),
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
                                padding: const EdgeInsets.only(top: 6.0),
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
                                padding: const EdgeInsets.only(top: 6.0),
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
                                padding: const EdgeInsets.only(top: 33.0),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/trending up.svg'),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
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
                                padding: const EdgeInsets.only(top: 11.0),
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
                                padding: const EdgeInsets.only(top: 6.0),
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
                                padding: const EdgeInsets.only(top: 6.0),
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
                                padding: const EdgeInsets.only(top: 33.0),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/trending up.svg'),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
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
                                padding: const EdgeInsets.only(top: 11.0),
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
                                padding: const EdgeInsets.only(top: 6.0),
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
                                padding: const EdgeInsets.only(top: 33.0),
                                child: Row(children: [
                                  SvgPicture.asset(
                                      'assets/Vectores/Iconos/trending up.svg'),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
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
                                padding: const EdgeInsets.only(top: 11.0),
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
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Container(
                          width: 345,
                          height: 204,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xffccc6dc),
                              width: 1,
                            ),
                            color: const Color(0xfff9f9fa),
                          ),
                          padding: const EdgeInsets.only(
                            left: 13,
                            right: 18,
                            top: 23,
                            bottom: 34,
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
                              const Padding(
                                padding: EdgeInsets.only(top: 34.0),
                                child: Text(
                                  "MASCONSTRU SAS",
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 14,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 11.0),
                                child: SizedBox(
                                  width: 308,
                                  child: Text(
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
              top: 410,
              left: 15,
              right: 15,
              child: Container(
                width: 345,
                height: 176,
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
                    const Padding(
                      padding: EdgeInsets.only(top: 13.0, left: 13),
                      child: Text(
                        "Proyecto",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 13),
                      child: Text(
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
                      padding: const EdgeInsets.only(left: 13),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/Vectores/Iconos/location.svg'),
                          const Padding(
                            padding: EdgeInsets.only(left: 11.57),
                            child: SizedBox(
                              width: 301,
                              child: Text(
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
                      padding: const EdgeInsets.only(
                        top: 6.0,
                      ),
                      child: Container(
                        width: 344.50,
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
                      width: 345,
                      height: 89,
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
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 18.0, left: 13),
                                child: Text(
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
                                padding: EdgeInsets.only(left: 13),
                                child: Text(
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
                                padding: EdgeInsets.only(left: 13),
                                child: Text(
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
                            padding: const EdgeInsets.only(
                              right: 10.0,
                            ),
                            child: GestureDetector(
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    height: 52,
                                    width: 139,
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
              top: 44,
              left: 13,
              child: GestureDetector(
                child: SvgPicture.asset('assets/Vectores/Iconos/Group 199.svg'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
                top: 44,
                right: 13,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
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
              top: 306,
              right: 13,
              child: Column(
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                        'assets/Vectores/Iconos/Group 149.svg'),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9.0),
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
