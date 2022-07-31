import 'package:ebloqs_app/src/screens/onBoard/on_board_3_screen.dart';
import 'package:ebloqs_app/src/screens/register/registro_redes_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Onboard2Screen extends StatelessWidget {
  const Onboard2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/png/onboard2.png',
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 52.0, left: 33, right: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ebframe.svg',
                      width: 54,
                      height: 45,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            RegistroRedesScreen.routeName, (route) => false);
                      },
                      child: const Text(
                        'Salir',
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 15,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Positioned(
            top: 508,
            left: 31,
            child: SizedBox(
              width: 296,
              height: 128,
              child: Text(
                '''Se dueño de tokens que
representan una
propiedad o servicio.''',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 25,
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            top: 666,
            left: 23,
            child: SizedBox(
              width: 127,
              height: 43,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 43,
                        height: 43,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const FlutterLogo(size: 43),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 28,
                    top: 0,
                    child: Container(
                      width: 43,
                      height: 43,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const FlutterLogo(size: 43),
                    ),
                  ),
                  Positioned(
                    left: 56,
                    top: 0,
                    child: Container(
                      width: 43,
                      height: 43,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const FlutterLogo(size: 43),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 43,
                        height: 43,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const FlutterLogo(size: 43),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 27,
            top: 738,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Onboard3Screen(),
                    ),
                  );
                },
                icon: const Icon(
                  CupertinoIcons.arrow_right,
                  color: Color(0xff8966F0),
                )),
          )
        ],
      ),
    );
  }
}
