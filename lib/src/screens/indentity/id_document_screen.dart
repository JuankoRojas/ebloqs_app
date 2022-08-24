import 'package:ebloqs_app/src/screens/indentity/address_screen.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IdDocumentScreen extends StatefulWidget {
  static const routeName = 'IdDocumentScreen';
  const IdDocumentScreen({Key? key}) : super(key: key);

  @override
  State<IdDocumentScreen> createState() => _IdDocumentScreenState();
}

class _IdDocumentScreenState extends State<IdDocumentScreen> {
  bool? isLoadLogin = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemBarDark,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              'assets/Vectores/Iconos/Arrow left.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: const Text(
          "Información personal",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/Vectores/Iconos/id.svg'),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        "Documento de identidad",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 13,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 27.0, left: 15, right: 15),
                child: Container(
                  width: size.width,
                  height: 4,
                  padding: EdgeInsets.only(right: size.width * 0.15),
                  decoration: const BoxDecoration(
                      color: Color(0xffeae4fc),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 94,
                    ),
                    child: Container(
                        width: 94,
                        height: 4,
                        padding: const EdgeInsets.only(right: 251),
                        decoration: const BoxDecoration(
                            color: Color(0xff170658),
                            borderRadius:
                                BorderRadius.all(Radius.circular(3)))),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24, left: 16.0),
                child: Text(
                  "Use documento válido de su país",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 15,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 6, left: 16.0),
                child: SizedBox(
                  width: 364,
                  child: Text(
                    "solo se aceptarán los documentos a  continuación, todos los demás documentos serán rechazados",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 16.0, right: 16),
                child: Container(
                  width: size.width,
                  height: 68,
                  padding: const EdgeInsets.only(
                      top: 17, left: 18.0, right: 21, bottom: 17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xffeae4fc),
                      width: 1,
                    ),
                    color: const Color(0xfff9f9fa),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Documento de identidad",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(child: Container()),
                      SvgPicture.asset(
                          'assets/Vectores/Iconos/chevronright.svg')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16.0, right: 16),
                child: Container(
                  width: size.width,
                  height: 68,
                  padding: const EdgeInsets.only(
                      top: 17, left: 18.0, right: 21, bottom: 17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xffeae4fc),
                      width: 1,
                    ),
                    color: const Color(0xfff9f9fa),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Pasaporte",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(child: Container()),
                      SvgPicture.asset(
                          'assets/Vectores/Iconos/chevronright.svg')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16.0, right: 16),
                child: Container(
                  width: size.width,
                  height: 68,
                  padding: const EdgeInsets.only(
                      top: 17, left: 18.0, right: 21, bottom: 17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xffeae4fc),
                      width: 1,
                    ),
                    color: const Color(0xfff9f9fa),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Licencia de conducir",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(child: Container()),
                      SvgPicture.asset(
                          'assets/Vectores/Iconos/chevronright.svg')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 261, left: 15.0, right: 15, bottom: 48),
                child: ButtonPrimary(
                    title: 'Continuar',
                    onPressed: () {
                      Navigator.pushNamed(context, AddressScreen.routeName);
                    },
                    load: isLoadLogin!,
                    disabled: isLoadLogin!),
              )
            ],
          ),
        ),
      ),
    );
  }
}
