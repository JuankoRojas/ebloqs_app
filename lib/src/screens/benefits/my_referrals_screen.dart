import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyReferralsScreen extends StatefulWidget {
  static const routeName = 'MyReferralsScreen';
  const MyReferralsScreen({super.key});

  @override
  State<MyReferralsScreen> createState() => _MyReferralsScreenState();
}

class _MyReferralsScreenState extends State<MyReferralsScreen> {
  bool load = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
                  child: const AutoSizeText(
                    "Beneficios",
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
              padding: EdgeInsets.only(top: size.height * 0.00985221674876847),
              child: const AutoSizeText(
                "Recomienda amigos y gana tokens EBL",
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
              padding: EdgeInsets.only(top: size.height * 0.11576354679803),
              child: SvgPicture.asset(
                  'assets/Vectores/Ilustraciones/Group 1950.svg'),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0738916256157636,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: Container(
                width: size.width,
                height: size.height * 0.423645320197044,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xffccc6dc),
                    width: 1,
                  ),
                  color: const Color(0xfff9f9fa),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.041871921182266,
                      left: size.width * 0.0533333333333333,
                      right: size.width * 0.0533333333333333),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AutoSizeText(
                        "Mis referidos",
                        style: TextStyle(
                          color: Color(0xff2504ca),
                          fontSize: 15,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.0800492610837438,
                            bottom: size.height * 0.0147783251231527),
                        child: Center(
                            child: SvgPicture.asset(
                                'assets/Vectores/Iconos/Group 1948.svg')),
                      ),
                      const Center(
                        child: AutoSizeText(
                          "No se han encontrado referidos",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.0566502463054187),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ButtonPrimary(
                              width: size.width,
                              title: 'Invitar amigos',
                              onPressed: () {},
                              load: load),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
