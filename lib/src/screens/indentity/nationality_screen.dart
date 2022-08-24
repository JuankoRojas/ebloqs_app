import 'package:country_list_pick/country_list_pick.dart';

import 'package:dotted_line/dotted_line.dart';
import 'package:ebloqs_app/src/screens/indentity/personal_information_screen.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NationalityScreen extends StatefulWidget {
  static const routeName = 'NationalityScreen';
  const NationalityScreen({Key? key}) : super(key: key);

  @override
  State<NationalityScreen> createState() => _NationalityScreenState();
}

class _NationalityScreenState extends State<NationalityScreen> {
  bool? isLoadLogin = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
    String? isoCountryCode = systemLocales.first.countryCode;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemBarDark,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              'assets/Vectores/Iconos/Arrow left.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: const Text(
          "Identidad",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff170658),
            fontSize: 17,
            fontFamily: "Archivo",
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 26, left: 14, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Selecciona tu país de residencia",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 17,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w700,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 5,
              ),
              child: SizedBox(
                width: 345,
                child: Text(
                  "Asegúrese de que su país de residencia coincida con su identificación válida.  Su identidad podría no ser validada según la selección.",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 18,
              ),
              child: Text(
                "Nacionalidad",
                style: TextStyle(
                  color: Color(0xff170658),
                  fontSize: 15,
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              child: CountryListPick(
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
                      padding:
                          EdgeInsets.only(left: size.width * (16 / size.width)),
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
                  pickerBuilder: (context, CountryCode? countryCode) {
                    return Container(
                      width: size.width,
                      height: 52,
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
                          Text(
                            countryCode!.name!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
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
                                countryCode.flagUri!,
                                package: 'country_list_pick',
                                width: size.width * (24 / size.width),
                                height: size.height * (24 / size.height),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          SvgPicture.asset(
                              'assets/Vectores/Iconos/dwon chevron.svg'),
                        ],
                      ),
                    );
                  },
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
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 32,
              ),
              child: Text(
                "Proceso de verificación",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff170658),
                  fontSize: 14,
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 17,
              ),
              child: SizedBox(
                width: size.width,
                height: 250,
                child: Stack(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xff2504ca),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          "1",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 12,
                      left: 67,
                      child: Text(
                        "Verificación identidad",
                        style: TextStyle(
                          color: Color(0xff2504ca),
                          fontSize: 14,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 67,
                      child: Container(
                        width: size.width * 0.77,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xffeae4fc),
                            width: 1,
                          ),
                          color: const Color(0xfff9f9fa),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 13),
                              child: SvgPicture.asset(
                                  'assets/Vectores/Iconos/id.svg'),
                            ),
                            const Text(
                              "Documento de identidad",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 13,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 38.0, right: 14),
                              child: Text(
                                "Pendiente",
                                style: TextStyle(
                                  color: Color(0xffeb4040),
                                  fontSize: 11,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 108,
                      left: 67,
                      child: Container(
                        width: size.width * 0.77,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xffeae4fc),
                            width: 1,
                          ),
                          color: const Color(0xfff9f9fa),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 13),
                              child: SvgPicture.asset(
                                  'assets/Vectores/Iconos/face id.svg'),
                            ),
                            const Text(
                              "Identificación facial",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 13,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 70.0, right: 14),
                              child: Text(
                                "Pendiente",
                                style: TextStyle(
                                  color: Color(0xffeb4040),
                                  fontSize: 11,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 40,
                      left: 20,
                      child: SizedBox(
                        height: 128,
                        width: 128,
                        child: DottedLine(
                          direction: Axis.vertical,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: Color(0xff2504ca),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 165,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color(0xfff6f4fd),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xff2504ca),
                            )),
                        child: const Center(
                          child: Text(
                            "2",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 15,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 175,
                      left: 67,
                      child: Text(
                        "Domicilio",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 205,
                      left: 67,
                      child: Container(
                        width: size.width * 0.77,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xffeae4fc),
                            width: 1,
                          ),
                          color: const Color(0xfff9f9fa),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 17.0, right: 10),
                              child: SvgPicture.asset(
                                  'assets/Vectores/Iconos/map.svg'),
                            ),
                            const Text(
                              "Dirección de domicilio",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 13,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 58.0, right: 14),
                              child: Text(
                                "Pendiente",
                                style: TextStyle(
                                  color: Color(0xffeb4040),
                                  fontSize: 11,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 35,
              ),
              child: Text(
                "Tiempo de revisión máxima: 72 horas laborables.",
                style: TextStyle(
                  color: Color(0xff170658),
                  fontSize: 13,
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 65,
              ),
              child: ButtonPrimary(
                title: 'Continuar',
                onPressed: () {
                  Navigator.pushNamed(context, PersonalInformation.routeName);
                },
                load: isLoadLogin!,
                disabled: isLoadLogin!,
              ),
            )
          ],
        ),
      ),
    );
  }
}
