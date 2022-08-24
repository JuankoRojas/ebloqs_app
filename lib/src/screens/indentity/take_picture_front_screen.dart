import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TakePictureFront extends StatefulWidget {
  static const routeName = 'TakePictureFront';
  const TakePictureFront({Key? key}) : super(key: key);

  @override
  State<TakePictureFront> createState() => _TakePictureFrontState();
}

class _TakePictureFrontState extends State<TakePictureFront> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leadingWidth: 60,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemBarLight,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
    );
  }
}
