import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';

import 'package:ebloqs_app/src/screens/wallet/create_wallet_pass_screen.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadDocumentScreen extends StatefulWidget {
  static const routeName = 'UploadDocumentScreen';
  const UploadDocumentScreen({Key? key}) : super(key: key);

  @override
  State<UploadDocumentScreen> createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  bool? isLoadLogin = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: size.width * 0.139720558882236,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemBarDark,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.0359342915811089),
            child: SvgPicture.asset(
              'assets/Vectores/Iconos/Arrow left.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: const AutoSizeText(
          "Verificación Identidad",
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
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.0359342915811089),
            child: Row(
              children: [
                SvgPicture.asset('assets/Vectores/Iconos/id.svg'),
                Padding(
                  padding:
                      EdgeInsets.only(left: size.width * 0.0382383065892797),
                  child: const AutoSizeText(
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
                top: size.height * 0.0314162234042553,
                left: size.width * 0.0359342915811089,
                right: size.width * 0.0359342915811089),
            child: Container(
              width: size.width,
              height: 4,
              padding: EdgeInsets.only(right: size.width * 0.04),
              decoration: const BoxDecoration(
                  color: Color(0xffeae4fc),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.217376940865544,
                ),
                child: Container(
                  width: size.width * 0.217376940865544,
                  height: 4,
                  padding:
                      EdgeInsets.only(right: size.width * 0.577770470240053),
                  decoration: const BoxDecoration(
                    color: Color(0xff170658),
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.120437369351986),
            child: Center(
              child: SvgPicture.asset(
                'assets/Vectores/Iconos/checkcircle.svg',
                width: size.width * 0.162251655629139,
                height: size.height * 0.0787022165114038,
              ),
            ),
          ),
          const Center(
            child: AutoSizeText(
              "Documento cargado",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 22,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // const Center(
          //   child: AutoSizeText(
          //     "Continuemos y añade un selfie",
          //     style: TextStyle(
          //       color: Color(0xff170658),
          //       fontSize: 14,
          //       fontFamily: "Archivo",
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.382960704607046,
                left: size.width * 0.0361072902338377,
                right: size.width * 0.0361072902338377,
                bottom: size.height * 0.0557213930348259),
            child: ButtonPrimary(
                width: size.width,
                title: 'Continuar',
                onPressed: () {
                  Navigator.pushNamed(
                      context, CreateWalletPassScreen.routeName);
                },
                load: isLoadLogin!,
                disabled: isLoadLogin!),
          )
        ],
      )),
    );
  }
}
