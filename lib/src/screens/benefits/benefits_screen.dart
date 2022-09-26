import 'package:ebloqs_app/src/screens/benefits/exchange_screen.dart';
import 'package:ebloqs_app/src/screens/benefits/my_referrals_screen.dart';
import 'package:ebloqs_app/src/screens/benefits/my_rewards_screen.dart';
import 'package:ebloqs_app/src/screens/benefits/referrals_screen.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BenefitsScreen extends StatefulWidget {
  static const routeName = 'BenefitsScreen';
  const BenefitsScreen({super.key});

  @override
  State<BenefitsScreen> createState() => _BenefitsScreenState();
}

class _BenefitsScreenState extends State<BenefitsScreen> {
  bool load = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
            child: const Text(
              "Para la comunidad ebloqs",
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
                top: size.height * 0.107142857142857,
                left: size.width * 0.157333333333333,
                right: size.width * 0.157333333333333),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ButtonPrimary(
                  width: size.width,
                  title: "Invitar amigos",
                  onPressed: () {
                    Navigator.pushNamed(context, ReferralsScreen.routeName);
                  },
                  load: load),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.107142857142857,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                          'assets/Vectores/Iconos/Recompensas.svg'),
                      onTap: () {
                        Navigator.pushNamed(context, MyRewardsScreen.routeName);
                      },
                    ),
                    const Text(
                      "Recompensas",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 11.26,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                          'assets/Vectores/Iconos/Referidos.svg'),
                      onTap: () {
                        Navigator.pushNamed(
                            context, MyReferralsScreen.routeName);
                      },
                    ),
                    const Text(
                      "Referidos",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 11.26,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                          'assets/Vectores/Iconos/Consejos.svg'),
                      onTap: () {
                        Navigator.pushNamed(context, ExchangeScreen.routeName);
                      },
                    ),
                    const Text(
                      "Canje",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 11.26,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset('assets/Vectores/Iconos/QRig.svg'),
                    const Text(
                      "QR",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 11.26,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
