import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
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
  int currentIndex = 0;
  Widget? image;
  var item;
  bool isLoading = false;
  bool showProjectData = false;
  bool showTokenomics = false;
  bool showDescription = false;
  bool showPromoterData = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.height);
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
                  // width: double.infinity,
                  height: (size.height < 750)
                      ? UtilSize.height(590, context)
                      : UtilSize.height(498, context),
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
                      item = imagenes[index];
                      image = ExtendedImage.asset(
                        item,
                        fit: BoxFit.contain,
                        mode: ExtendedImageMode.gesture,
                        initGestureConfigHandler: (ExtendedImageState state) {
                          return GestureConfig(
                            inPageView: true,
                            initialScale: 1,
                            cacheGesture: false,
                          );
                        },
                      );
                      image = Container(
                        child: image,
                      );
                      if (index == currentIndex) {
                        return Hero(
                          tag: item + index.toString(),
                          child: image!,
                        );
                      } else {
                        return image!;
                      }
                    },
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    controller:
                        ExtendedPageController(initialPage: currentIndex),
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: UtilSize.height(128, context),
                    right: size.width * (15 / size.width),
                    left: size.width * (15 / size.width),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Precio edificio",
                            style: TextStyle(
                              color: const Color(0xff170658),
                              fontSize: UtilSize.width(14, context),
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "USD \$4.700.000",
                            style: TextStyle(
                              color: const Color(0xff170658),
                              fontSize: UtilSize.width(14, context),
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
                        children: [
                          Text(
                            "Tokens emitidos",
                            style: TextStyle(
                              color: const Color(0xff170658),
                              fontSize: UtilSize.width(14, context),
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "9.400",
                            style: TextStyle(
                              color: const Color(0xff170658),
                              fontSize: UtilSize.width(14, context),
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
                        children: [
                          Text(
                            "Tokens disponibles",
                            style: TextStyle(
                              color: const Color(0xff170658),
                              fontSize: UtilSize.width(14, context),
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "7.857",
                            style: TextStyle(
                              color: const Color(0xff170658),
                              fontSize: UtilSize.width(14, context),
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
                                  width: UtilSize.width(200, context),
                                  child: Text(
                                    "Únete y sé dueño de las  mejores oportunidades  de inversión inmobiliarias",
                                    style: TextStyle(
                                      color: const Color(0xff170658),
                                      fontSize: UtilSize.width(12, context),
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
                        child: GestureDetector(
                          child: Container(
                            width: size.width,
                            // height: size.height * (440 / size.height),
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
                                    Text(
                                      "Datos del proyecto",
                                      style: TextStyle(
                                        color: const Color(0xff2504ca),
                                        fontSize: UtilSize.width(17, context),
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    showProjectData
                                        ? SvgPicture.asset(
                                            'assets/Vectores/Iconos/Chevron.svg')
                                        : SvgPicture.asset(
                                            'assets/Vectores/Iconos/dwon chevron.svg')
                                  ],
                                ),
                                showProjectData
                                    ? Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: size.height *
                                                  (33 / size.height),
                                            ),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/Vectores/Iconos/inversiones.svg'),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: size.width *
                                                          (8 / size.width)),
                                                  child: Text(
                                                    "Tipo de proyecto",
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xff170658),
                                                      fontSize: UtilSize.width(
                                                          14, context),
                                                      fontFamily: "Archivo",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: size.height *
                                                  (11 / size.height),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Edificio superficie (m2)",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  " 3.437",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: size.height *
                                                  (9 / size.height),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Número departamentos",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "34",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: size.height *
                                                  (9 / size.height),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
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
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: size.height *
                                                  (9 / size.height),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Electrolineras",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "2",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: size.height *
                                                  (9 / size.height),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Vehículo eléctrico comunal",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "1",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: size.height *
                                                  (9 / size.height),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Concierge edificio",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "1",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: size.height *
                                                  (30 / size.height),
                                            ),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/Vectores/Iconos/PC.svg'),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: size.width *
                                                          (8 / size.width)),
                                                  child: Text(
                                                    "Validación",
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xff170658),
                                                      fontSize: UtilSize.width(
                                                          14, context),
                                                      fontFamily: "Archivo",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: size.height *
                                                  (11 / size.height),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Certificación EDGE",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "Ok",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: size.height *
                                                  (9 / size.height),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Fideicomiso ",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "Ok",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: size.height *
                                                  (9 / size.height),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Planos aprobados",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "Ok",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: size.height *
                                                  (9 / size.height),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Licencia de construcción",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "Ok",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              showProjectData = !showProjectData;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * (24 / size.height)),
                        child: GestureDetector(
                          child: Container(
                            width: size.width,
                            // height: size.height * (460 / size.height),
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
                                    Text(
                                      "Tokenomics del proyecto",
                                      style: TextStyle(
                                        color: const Color(0xff2504ca),
                                        fontSize: UtilSize.width(17, context),
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    showTokenomics
                                        ? SvgPicture.asset(
                                            'assets/Vectores/Iconos/Chevron.svg')
                                        : SvgPicture.asset(
                                            'assets/Vectores/Iconos/dwon chevron.svg')
                                  ],
                                ),
                                showTokenomics
                                    ? Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (30 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Interés durante construcción",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "USD \$215.000",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (30 / size.height)),
                                            child: Row(children: [
                                              SvgPicture.asset(
                                                  'assets/Vectores/Iconos/trending up.svg'),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: size.width *
                                                        (8 / size.width)),
                                                child: Text(
                                                  "Alquiler",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                    fontFamily: "Archivo",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (13 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Renting anual",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "\$430.000",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (3 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Gasto anual",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  " \$100.000",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (3 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Beneficio neto anual",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  " \$330.000",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (33 / size.height)),
                                            child: Row(children: [
                                              SvgPicture.asset(
                                                  'assets/Vectores/Iconos/trending up.svg'),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: size.width *
                                                        (8 / size.width)),
                                                child: Text(
                                                  "Rentabilidad estimada",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                    fontFamily: "Archivo",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (13 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Interés construcción (1 año)",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "\$215.000",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (3 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Renting neto (2 años)",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "\$660.000",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (3 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Plusvalía (3 años)",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "\$435.000",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (3 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Neto (3 años)",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "\$1.310.000",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (30 / size.height)),
                                            child: SizedBox(
                                              width: size.width *
                                                  (318 / size.width),
                                              child: Text(
                                                "*Los intereses son promedios, su naturaleza es especulativa, implican un grado de riesgo. El pago es trimestral, anual y al final de la inversión.",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xff170658),
                                                  fontSize: UtilSize.width(
                                                      11, context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              showTokenomics = !showTokenomics;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * (24 / size.height)),
                        child: GestureDetector(
                          child: Container(
                            width: size.width,
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
                                    Text(
                                      "Descripción de la zona",
                                      style: TextStyle(
                                        color: const Color(0xff2504ca),
                                        fontSize: UtilSize.width(17, context),
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    showDescription
                                        ? SvgPicture.asset(
                                            'assets/Vectores/Iconos/Chevron.svg')
                                        : SvgPicture.asset(
                                            'assets/Vectores/Iconos/dwon chevron.svg')
                                  ],
                                ),
                                showDescription
                                    ? Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (33 / size.height)),
                                            child: Row(children: [
                                              SvgPicture.asset(
                                                  'assets/Vectores/Iconos/trending up.svg'),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: size.width *
                                                        (8 / size.width)),
                                                child: Text(
                                                  "Centros comerciales",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                    fontFamily: "Archivo",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (11 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Mall el Jardín",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "5 min",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (6 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Quicentro shopping",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  " 8 min",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (6 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "CCI",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  " 9 min",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (6 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "CCNU",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  " 9 min",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (33 / size.height)),
                                            child: Row(children: [
                                              SvgPicture.asset(
                                                  'assets/Vectores/Iconos/trending up.svg'),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: size.width *
                                                        (8 / size.width)),
                                                child: Text(
                                                  "Supermercados",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                    fontFamily: "Archivo",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (11 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Megamaxi",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "7 min",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (6 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Mi Comisariato",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  " 9 min",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (6 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Coral Hipermercado",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  " 12min",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (33 / size.height)),
                                            child: Row(children: [
                                              SvgPicture.asset(
                                                  'assets/Vectores/Iconos/trending up.svg'),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: size.width *
                                                        (8 / size.width)),
                                                child: Text(
                                                  "Parques",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                    fontFamily: "Archivo",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (11 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "La Carolina",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "4 min",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (6 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Metropolitano",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  " 7 min",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (33 / size.height)),
                                            child: Row(children: [
                                              SvgPicture.asset(
                                                  'assets/Vectores/Iconos/trending up.svg'),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: size.width *
                                                        (8 / size.width)),
                                                child: Text(
                                                  "Metrovía",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                    fontFamily: "Archivo",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (11 / size.height)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Estación la carolina",
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                ),
                                                Text(
                                                  "5 min",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff170658),
                                                    fontSize: UtilSize.width(
                                                        14, context),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              showDescription = !showDescription;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * (24 / size.height)),
                        child: GestureDetector(
                          child: Container(
                            width: size.width,
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
                                    Text(
                                      "Datos del promotor",
                                      style: TextStyle(
                                        color: const Color(0xff2504ca),
                                        fontSize: UtilSize.width(17, context),
                                        fontFamily: "Archivo",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    showPromoterData
                                        ? SvgPicture.asset(
                                            'assets/Vectores/Iconos/Chevron.svg')
                                        : SvgPicture.asset(
                                            'assets/Vectores/Iconos/dwon chevron.svg')
                                  ],
                                ),
                                showPromoterData
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (34 / size.height)),
                                            child: Text(
                                              "MASCONSTRU SAS",
                                              style: TextStyle(
                                                color: const Color(0xff170658),
                                                fontSize:
                                                    UtilSize.width(14, context),
                                                fontFamily: "Archivo",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height *
                                                    (11 / size.height)),
                                            child: SizedBox(
                                              width: size.width *
                                                  (308 / size.width),
                                              child: Text(
                                                "La constructora se ha caracterizado por ofrecer al mercado de Quito, proyectos de vanguardia con dinámica social, moderna y sostenible.",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xff170658),
                                                  fontSize: UtilSize.width(
                                                      14, context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              showPromoterData = !showPromoterData;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: (size.height < 750)
                  ? UtilSize.height(480, context)
                  : UtilSize.height(410, context),
              left: size.width * (15 / size.width),
              right: size.width * (15 / size.width),
              child: Container(
                width: size.width * (345 / size.width),
                height: UtilSize.height(210, context),
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
                      child: Text(
                        "Proyecto",
                        style: TextStyle(
                          color: const Color(0xff170658),
                          fontSize: UtilSize.width(14, context),
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: size.width * (13 / size.width)),
                      child: Text(
                        "Heráldica",
                        style: TextStyle(
                          color: const Color(0xff2504ca),
                          fontSize: UtilSize.width(22, context),
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
                              width: UtilSize.width(290, context),
                              child: Text(
                                "Sector González Suárez, pasaje Juan Pareja y Jiménez de la Espada.",
                                style: TextStyle(
                                  color: const Color(0xff170658),
                                  fontSize: UtilSize.width(12, context),
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
                      height: UtilSize.height(89, context),
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
                                child: Text(
                                  "USD \$500",
                                  style: TextStyle(
                                    color: const Color(0xff2504ca),
                                    fontSize: UtilSize.width(15, context),
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * (13 / size.width)),
                                child: Text(
                                  "Precio token",
                                  style: TextStyle(
                                    color: const Color(0xff170658),
                                    fontSize: UtilSize.width(12, context),
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * (13 / size.width)),
                                child: Text(
                                  "1 EBL-HERALD-01",
                                  style: TextStyle(
                                    color: const Color(0xff170658),
                                    fontSize: UtilSize.width(12, context),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                right: UtilSize.width(10, context),
                                top: UtilSize.height(20, context),
                                bottom: UtilSize.height(20, context),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: ButtonPrimary(
                                  width: UtilSize.width(139, context),
                                  title: 'Invertir',
                                  onPressed: () {},
                                  load: isLoading,
                                  disabled: isLoading,
                                ),
                              )),
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
                    children: [
                      Text(
                        "${(currentIndex + 1)}/5",
                        style: const TextStyle(
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
              top: (size.height < 750)
                  ? UtilSize.height(321, context)
                  : UtilSize.height(300, context),
              right: size.width * (13 / size.width),
              child: Column(
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                        'assets/Vectores/Iconos/Group 149.svg'),
                    onTap: () {
                      print('zoom');
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child: ExtendedImage.asset(
                                item,
                                fit: BoxFit.contain,
                                //enableLoadState: false,
                                mode: ExtendedImageMode.gesture,
                                initGestureConfigHandler: (state) {
                                  return GestureConfig(
                                    minScale: 0.9,
                                    animationMinScale: 0.7,
                                    maxScale: 3.0,
                                    animationMaxScale: 3.5,
                                    speed: 1.0,
                                    inertialSpeed: 100.0,
                                    initialScale: 1.0,
                                    inPageView: false,
                                    initialAlignment: InitialAlignment.center,
                                  );
                                },
                              ),
                            );
                          }));
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: size.height * (9 / size.height)),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                          'assets/Vectores/Iconos/Group 198.svg'),
                      onTap: () {
                        print('like');
                      },
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
