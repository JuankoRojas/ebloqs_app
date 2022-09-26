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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0357142857142857, left: size.width * 0.04),
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
                padding: EdgeInsets.only(right: size.width * 0.373333333333333),
                child: const Text(
                  "Referidos",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 17,
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
                Image.asset('assets/png/referidos.png'),
                Positioned(
                  top: size.height * 0.431034482758621,
                  left: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    child: Container(
                      width: size.width * 0.92,
                      height: size.height * 0.107142857142857,
                      decoration: const BoxDecoration(color: Color(0xff2504CA)),
                      child: const Center(
                        child: Text(
                          "MYX9PIA3",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
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
                children: const [
                  Text(
                    "Id. de la oferta de referido",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "MYX9PIA3",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
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
          const Text(
            "Compartir",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff170658),
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
