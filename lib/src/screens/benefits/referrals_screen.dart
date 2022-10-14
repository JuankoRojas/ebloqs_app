import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class ReferralsScreen extends StatefulWidget {
  static const routeName = 'ReferralsScreen';
  const ReferralsScreen({super.key});

  @override
  State<ReferralsScreen> createState() => _ReferralsScreenState();
}

class _ReferralsScreenState extends State<ReferralsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0357142857142857,
                  left: size.width * 0.04),
              child: Row(children: [
                GestureDetector(
                  child:
                      SvgPicture.asset('assets/Vectores/Iconos/Arrow left.svg'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding:
                      EdgeInsets.only(right: size.width * 0.373333333333333),
                  child: AutoSizeText(
                    "Referidos",
                    style: TextStyle(
                      color: const Color(0xff170658),
                      fontSize: UtilSize.width(17, context),
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/png/referidos.png',
                    width: UtilSize.width(690, context),
                  ),
                  Positioned(
                    top: (size.height < 750)
                        ? UtilSize.height(437, context)
                        : UtilSize.height(327, context),
                    left: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      child: Container(
                        width: UtilSize.width(345, context),
                        height: UtilSize.height(87, context),
                        decoration:
                            const BoxDecoration(color: Color(0xff2504CA)),
                        child: Center(
                          child: AutoSizeText(
                            "MYX9PIA3",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: UtilSize.width(28, context),
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0652709359605911,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: Container(
                width: size.width,
                height: size.height * 0.0566502463054187,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xfff9f9fa),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText(
                      "Id. de la oferta de referido",
                      style: TextStyle(
                        color: const Color(0xff170658),
                        fontSize: UtilSize.width(13, context),
                      ),
                    ),
                    AutoSizeText(
                      "MYX9PIA3",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xff170658),
                        fontSize: UtilSize.width(13, context),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.11576354679803,
                  bottom: size.height * 0.0135467980295567),
              child: GestureDetector(
                child: SvgPicture.asset('assets/Vectores/Iconos/Compartir.svg'),
                onTap: () {
                  Share.share('MYX9PIA3');
                },
              ),
            ),
            AutoSizeText(
              "Compartir",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xff170658),
                fontSize: UtilSize.width(13, context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
