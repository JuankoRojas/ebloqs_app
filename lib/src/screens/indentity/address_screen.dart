import 'package:ebloqs_app/src/screens/indentity/id_document_screen.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressScreen extends StatefulWidget {
  static const routeName = 'AddressScreen';
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final GlobalKey<FormState> _formKey12 = GlobalKey<FormState>();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
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
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/Vectores/Iconos/id.svg'),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        "Domicilio",
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
                  padding: EdgeInsets.only(right: size.width * 0.4),
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
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Form(
                    key: _formKey12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 16, left: 15.0),
                          child: Text(
                            "País",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 13,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 15.0, right: 15),
                          child: TextFormField(
                            controller: countryController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16, left: 15.0),
                          child: Text(
                            "Ciudad",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 13,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 15.0, right: 15),
                          child: TextFormField(
                            controller: cityController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16, left: 15.0),
                          child: Text(
                            "Dirección de domicilio",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 13,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 15.0, right: 15),
                          child: TextFormField(
                            controller: addressController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16, left: 15.0),
                          child: Text(
                            "Código Postal",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 13,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 15.0, right: 15),
                          child: TextFormField(
                            controller: zipController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 174, left: 15.0, right: 15, bottom: 48),
                          child: ButtonPrimary(
                              title: 'Continuar',
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, IdDocumentScreen.routeName);
                              },
                              load: isLoadLogin!,
                              disabled: isLoadLogin!),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
