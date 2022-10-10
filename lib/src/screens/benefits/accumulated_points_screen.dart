import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccumulatedPointsScreen extends StatefulWidget {
  static const routeName = 'AccumulatedPointsScreen';
  const AccumulatedPointsScreen({super.key});

  @override
  State<AccumulatedPointsScreen> createState() =>
      _AccumulatedPointsScreenState();
}

class _AccumulatedPointsScreenState extends State<AccumulatedPointsScreen> {
  bool load = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('assets/png/02 1.png'),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0997536945812808,
                left: size.width * 0.04,
                right: size.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: SvgPicture.asset(
                        'assets/Vectores/Iconos/checkcircle.svg')),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * 0.0197044334975369),
                  child: Center(
                    child: Text(
                      "¡Felicitaciones has acumulado puntos!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xff170658),
                        fontSize: UtilSize.width(15, context),
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * 0.0197044334975369),
                  child: Center(
                    child: Container(
                      width: size.width * 0.498666666666667,
                      height: size.height * 0.0714285714285714,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xfff6f4fd),
                      ),
                      child: Center(
                        child: Text(
                          "2000 pts",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xff2504ca),
                            fontSize: UtilSize.width(34, context),
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * 0.0431034482758621),
                  child: Text(
                    "Canjea tus puntos",
                    style: TextStyle(
                      color: const Color(0xff170658),
                      fontSize: UtilSize.width(13, context),
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * 0.0197044334975369),
                  child: Container(
                    width: size.width,
                    height: UtilSize.height(265, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xffdce2ea),
                        width: 1,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x60cad3d5),
                          blurRadius: 15,
                          offset: Offset(0, 0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.0332512315270936,
                          left: size.width * 0.064,
                          right: size.width * 0.064),
                      child: Column(
                        children: [
                          Text(
                            "Tus puntos te dan derecho a un cupón de",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xff170658),
                              fontSize: UtilSize.width(15, context),
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: size.height * 0.0258620689655172,
                                bottom: size.height * 0.0258620689655172),
                            child: Container(
                              width: size.width * 0.432,
                              height: size.height * 0.0714285714285714,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color(0xfff6f4fd),
                              ),
                              child: Center(
                                child: Text(
                                  "50 EBL",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xff2504ca),
                                    fontSize: UtilSize.width(34, context),
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ButtonPrimary(
                                width: size.width,
                                title: 'Generar cupón',
                                onPressed: () {},
                                load: load),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * 0.0307881773399015),
                  child: Container(
                      width: size.width,
                      height: size.height * 0.0652709359605911,
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
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.04,
                                right: size.width * 0.0506666666666667),
                            child: SvgPicture.asset(
                                'assets/Vectores/Iconos/wallet.svg'),
                          ),
                          Text(
                            "Tus ebloqs se encuentran en tu billetera",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xff170658),
                              fontSize: UtilSize.width(13, context),
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
