import 'package:ebloqs_app/src/screens/indentity/address_screen.dart';
import 'package:ebloqs_app/src/screens/indentity/take_picture_front_screen.dart';
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
        leadingWidth: size.width * 0.1417004048583,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemBarDark,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
          padding: EdgeInsets.only(
            top: size.height * 0.0292593211837486,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.0361072902338377),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/Vectores/Iconos/id.svg'),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.0384219554030875),
                      child: const Text(
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
                padding: EdgeInsets.only(
                    top: size.height * 0.031563126252505,
                    left: size.width * 0.0361072902338377,
                    right: size.width * 0.0361072902338377),
                child: Container(
                  width: size.width,
                  height: 4,
                  padding: EdgeInsets.only(right: size.width * 0.15),
                  decoration: const BoxDecoration(
                      color: Color(0xffeae4fc),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: size.width * 0.221474251093908,
                    ),
                    child: Container(
                      width: size.width * 0.221474251093908,
                      height: 4,
                      padding: EdgeInsets.only(
                          right: size.width * 0.589993284083278),
                      decoration: const BoxDecoration(
                        color: Color(0xff170658),
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.0281218613993974,
                    left: size.width * 0.0384219554030875),
                child: const Text(
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
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.00690108445612882,
                    left: size.width * 0.0384219554030875),
                child: SizedBox(
                  width: size.width * 0.853601340033502,
                  child: const Text(
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
                padding: EdgeInsets.only(
                    top: size.height * 0.0234623764035529,
                    left: size.width * 0.0384219554030875,
                    right: size.width * 0.0384219554030875),
                child: GestureDetector(
                  child: Container(
                    width: size.width,
                    height: size.height * 0.0785737867282932,
                    padding: EdgeInsets.only(
                        top: size.height * 0.0199664429530201,
                        left: size.width * 0.0430180949129396,
                        right: size.width * 0.0499490316004078,
                        bottom: size.height * 0.0199664429530201),
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
                  onTap: () {
                    Navigator.pushNamed(context, TakePictureFront.routeName);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.0188140433394927,
                    left: size.width * 0.0384219554030875,
                    right: size.width * 0.0384219554030875),
                child: Container(
                  width: size.width,
                  height: size.height * 0.0785737867282932,
                  padding: EdgeInsets.only(
                      top: size.height * 0.0199664429530201,
                      left: size.width * 0.0430180949129396,
                      right: size.width * 0.0499490316004078,
                      bottom: size.height * 0.0199664429530201),
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
                padding: EdgeInsets.only(
                    top: size.height * 0.0188140433394927,
                    left: size.width * 0.0384219554030875,
                    right: size.width * 0.0384219554030875),
                child: GestureDetector(
                  child: Container(
                    width: size.width,
                    height: size.height * 0.0785737867282932,
                    padding: EdgeInsets.only(
                        top: size.height * 0.0199664429530201,
                        left: size.width * 0.0430180949129396,
                        right: size.width * 0.0499490316004078,
                        bottom: size.height * 0.0199664429530201),
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
                  onTap: () {
                    Navigator.pushNamed(context, TakePictureFront.routeName);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.299852289512556,
                    left: size.width * 0.0361072902338377,
                    right: size.width * 0.0361072902338377,
                    bottom: size.height * 0.0557213930348259),
                child: ButtonPrimary(
                    width: size.width,
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
