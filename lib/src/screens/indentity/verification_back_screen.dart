import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:ebloqs_app/src/global/util_size.dart';

import 'package:ebloqs_app/src/models/camera_models.dart';
import 'package:ebloqs_app/src/providers/images_provider.dart';
import 'package:ebloqs_app/src/screens/indentity/take_picture_back_screen.dart';
import 'package:ebloqs_app/src/screens/indentity/upload_document_screen.dart';
import 'package:ebloqs_app/src/services/auth_user_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class VerificationBackScreen extends StatefulWidget {
  final XFile file;
  const VerificationBackScreen({Key? key, required this.file})
      : super(key: key);

  @override
  State<VerificationBackScreen> createState() => _VerificationBackScreenState();
}

class _VerificationBackScreenState extends State<VerificationBackScreen> {
  bool? isLoadLogin = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    OverlayFormat format = OverlayFormat.cardID1;
    CardOverlay overlay = CardOverlay.byFormat(format);
    final frontImage = Provider.of<ImagesProvider>(
      context,
    ).imageGetFrontFile;
    print('frontImage: $frontImage');
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
              padding: EdgeInsets.only(right: size.width * 0.12),
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
                        borderRadius: BorderRadius.all(Radius.circular(3)))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0247072035937751,
                left: size.width * 0.0359342915811089,
                right: size.width * 0.0359342915811089),
            child: AspectRatio(
              aspectRatio: overlay.ratio!,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: FractionalOffset.center,
                        image: FileImage(File(widget.file.path)))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.width * 0.028023352793995,
                left: size.width * 0.0359342915811089,
                right: size.width * 0.0359342915811089),
            child: Container(
              width: size.width,
              height: 53,
              padding: EdgeInsets.only(
                  left: size.width * 0.04375,
                  top: size.height * 0.0201558265582656,
                  bottom: size.height * 0.0201558265582656),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xffeae4fc),
                  width: 1,
                ),
                color: const Color(0xfff9f9fa),
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  "Lado Reverso",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.width * 0.028023352793995,
                left: size.width * 0.0359342915811089),
            child: const AutoSizeText(
              "Para el reconocimiento, tu foto debe ser:",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 16,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0247072035937751,
                left: size.width * 0.0359342915811089),
            child: Row(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff5932c7),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: size.width * 0.0194444444444445),
                  child: const AutoSizeText(
                    "Legible, clara y no borrosa",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.width * 0.028023352793995,
                left: size.width * 0.0359342915811089),
            child: Row(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff5932c7),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: size.width * 0.0194444444444445),
                  child: const AutoSizeText(
                    "No reflectiva, ni muy oscura",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.width * 0.028023352793995,
                left: size.width * 0.0359342915811089),
            child: Row(
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff5932c7),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: size.width * 0.0194444444444445),
                  child: const AutoSizeText(
                    "A color, no a blanco y negro",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.100779132791328,
                left: size.width * 0.0359342915811089,
                right: size.width * 0.0359342915811089),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    width: size.width * 0.42,
                    height: UtilSize.height(52, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color(0xff170658),
                        width: 2,
                      ),
                    ),
                    child: const Center(
                      child: AutoSizeText(
                        "Tomar otra foto",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, TakePictureBack.routeName);
                  },
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: ButtonPrimary(
                      width: size.width * 0.42,
                      title: 'Continuar',
                      onPressed: () async {
                        setState(() {
                          isLoadLogin = true;
                        });
                        final response = await AuthUserService()
                            .uploadReverseDocument(
                                accesstoken: Preferences.token!,
                                type: 'Documento de identidad',
                                rever: widget.file);
                        if (response['message'] == "documentos cargados") {
                          setState(() {
                            isLoadLogin = false;
                          });
                          Future.delayed(Duration.zero).then((_) =>
                              Navigator.pushNamed(
                                  context, UploadDocumentScreen.routeName));
                        }
                      },
                      load: isLoadLogin!,
                      disabled: isLoadLogin!),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
