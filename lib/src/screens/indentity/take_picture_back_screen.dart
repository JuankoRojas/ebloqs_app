import 'package:camera/camera.dart';
import 'package:ebloqs_app/src/camera/camera_overlay.dart';
import 'package:ebloqs_app/src/models/camera_models.dart';
import 'package:ebloqs_app/src/screens/indentity/verification_back_screen.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TakePictureBack extends StatefulWidget {
  static const routeName = 'TakePictureBack';
  const TakePictureBack({Key? key}) : super(key: key);

  @override
  State<TakePictureBack> createState() => _TakePictureBackState();
}

class _TakePictureBackState extends State<TakePictureBack> {
  OverlayFormat format = OverlayFormat.cardID1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: size.width * 0.139720558882236,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemBarLight,
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
              color: Colors.white,
            ),
          ),
        ),
        title: const Text(
          "Documento de identidad",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: "Archivo",
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FutureBuilder<List<CameraDescription>?>(
            future: availableCameras(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == null || snapshot.data.isEmpty) {
                  return const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'No camera found',
                        style: TextStyle(color: Colors.white),
                      ));
                }
                return CameraOverlay(
                    snapshot.data!.first,
                    CardOverlay.byFormat(format),
                    (XFile file) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                VerificationBackScreen(file: file))));
              } else {
                return const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Obteniendo Camara',
                      style: TextStyle(color: Colors.black),
                    ));
              }
            },
          ),
          Positioned(
            top: size.height * 0.652054794520548,
            left: size.width * 0.0359342915811089,
            child: const Text(
              "Lado reverso",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.672730199613651,
            left: size.width * 0.0359342915811089,
            child: const Text(
              "Muestra tu documento de identidad del lado reverso",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          )
        ],
      ),
    );
  }
}