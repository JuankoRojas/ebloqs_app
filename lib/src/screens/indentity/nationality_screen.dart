import 'package:after_layout/after_layout.dart';
import 'package:country_list_pick/country_list_pick.dart';

import 'package:dotted_line/dotted_line.dart';
import 'package:ebloqs_app/src/providers/locations_provider.dart';
import 'package:ebloqs_app/src/screens/home_screen.dart';
import 'package:ebloqs_app/src/screens/indentity/personal_information_screen.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class NationalityScreen extends StatefulWidget {
  static const routeName = 'NationalityScreen';
  const NationalityScreen({Key? key}) : super(key: key);

  @override
  State<NationalityScreen> createState() => _NationalityScreenState();
}

class _NationalityScreenState extends State<NationalityScreen>
    with AfterLayoutMixin<NationalityScreen> {
  bool? isLoadLogin = false;

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
      appBar: AppBar(
        leadingWidth: size.width * 0.1458333333333384,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemBarDark,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.0361072902338377),
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
        padding: EdgeInsets.only(
            top: size.height * 0.0298360655737705,
            left: size.width * 0.0327540106951872,
            right: size.width * 0.0327540106951872),
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
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
              ),
              child: SizedBox(
                width: size.width * 0.805268422807603,
                child: const Text(
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
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.0206320615686917,
              ),
              child: const Text(
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
              padding: EdgeInsets.only(
                top: size.height * 0.00946265630280501,
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
                      height: size.height * 0.0602250165453343,
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
                            padding: EdgeInsets.only(
                                left: size.width * 0.0186294078509648),
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
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.0373208930356548,
              ),
              child: const Text(
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
              padding: EdgeInsets.only(
                top: size.height * 0.01994301994302,
              ),
              child: SizedBox(
                width: size.width,
                height: size.height * 0.286228328426562,
                child: Stack(
                  children: [
                    Container(
                      width: size.width * 0.0929306339196815,
                      height: size.height * 0.0457441594510701,
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
                    Positioned(
                      top: size.height * 0.0137075718015666,
                      left: size.width * 0.155298013245033,
                      child: const Text(
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
                      top: size.height * 0.0684596577017115,
                      left: size.width * 0.155298013245033,
                      child: Container(
                        width: size.width * 0.77,
                        height: size.height * 0.0433083686095735,
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
                              padding: EdgeInsets.only(
                                  left: size.width * 0.0242466227918255,
                                  right: size.width * 0.031292984869326),
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
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.0878757846052198,
                                  right: size.width * 0.0327540106951872),
                              child: const Text(
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
                      top: size.height * 0.122946820621239,
                      left: size.width * 0.156751336898396,
                      child: Container(
                        width: size.width * 0.77,
                        height: size.height * 0.0440105890138981,
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
                              padding: EdgeInsets.only(
                                  left: size.width * 0.0242466227918255,
                                  right: size.width * 0.031292984869326),
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
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.161502966381015,
                                  right: size.width * 0.0327540106951872),
                              child: const Text(
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
                      top: size.height * 0.0462198745460548,
                      left: size.width * 00460374876685301,
                      child: SizedBox(
                        height: size.height * 0.14554905782976,
                        width: size.width * 0.293963254593176,
                        child: const DottedLine(
                          direction: Axis.vertical,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 4.0,
                          dashColor: Color(0xff2504ca),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.187408729514847,
                      child: Container(
                        width: size.width * 0.0935828877005349,
                        height: size.height * 0.0462198745460548,
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
                    Positioned(
                      top: size.height * 0.198541329011345,
                      left: size.width * 0.155298013245033,
                      child: const Text(
                        "Domicilio",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.232313420754412,
                      left: size.width * 0.155298013245033,
                      child: Container(
                        width: size.width * 0.77,
                        height: size.height * 0.0440105890138981,
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
                              padding: EdgeInsets.only(
                                  left: size.width * 0.0405313351498638,
                                  right: size.width * 0.0242466227918255),
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
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.132896890343699,
                                  right: size.width * 0.0327540106951872),
                              child: const Text(
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
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.0396183699870634,
              ),
              child: const Text(
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
              padding: EdgeInsets.only(
                top: size.height * 0.0734937812954289,
              ),
              child: ButtonPrimary(
                width: size.width,
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
