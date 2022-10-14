import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/screens/deposit/deposit_methods_screen.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DepositScreen extends StatefulWidget {
  static const String routeName = 'DepositScreen';
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  PageController pageController = PageController();
  bool? isLoadLogin = false;
  int _curr = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.0723936613844871),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.0711864406779662,
                    right: size.width * 0.0454079890747696),
                child: Row(
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                          'assets/Vectores/Iconos/Arrow left.svg'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(child: Container()),
                    const AutoSizeText(
                      "Depositar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 17,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                        child: SvgPicture.asset(
                            'assets/Vectores/Iconos/Question.svg')),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.037190768719907),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: size.width * 0.5,
                        height: size.height * 0.0626865671641791,
                        color: const Color(0xfff6f4fd),
                        child: const Center(
                          child: AutoSizeText(
                            "Efectivo",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 15,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (_curr == 1) {
                          setState(() {
                            _curr = 0;
                          });
                          pageController.jumpToPage(_curr);
                        }
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: size.width * 0.5,
                        height: size.height * 0.0626865671641791,
                        color: const Color(0xfff9f9fa),
                        child: const Center(
                          child: AutoSizeText(
                            "Criptomoneda",
                            style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 15,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (_curr == 0) {
                          setState(() {
                            _curr = 1;
                          });
                          pageController.jumpToPage(_curr);
                        }
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.0452211363259898,
                  left: size.width * 0.0385144429160936,
                  right: size.width * 0.0385144429160936,
                ),
                child: SizedBox(
                  height: size.height * 0.66,
                  width: double.infinity,
                  child: PageView(
                    controller: pageController,
                    children: const [Efectivo(), Criptomoneda()],
                  ),
                ),
              ),
              (_curr == 0)
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.0416942422236929,
                          left: size.width * 0.0361944157187177,
                          right: size.width * 0.0361944157187177,
                          bottom: size.height * 0.0559813395534822),
                      child: ButtonPrimary(
                          width: size.width,
                          title: 'Continuar',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, DepositMethodsScreen.routeName);
                          },
                          load: isLoadLogin!,
                          disabled: isLoadLogin!),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.0420841683366734,
                          left: size.width * 0.0361944157187177,
                          right: size.width * 0.0361944157187177,
                          bottom: size.height * 0.0559813395534822),
                      child: const AutoSizeText(
                        "Por el momento no podrá depositar a su billetera criptomonedas ",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 13,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class Efectivo extends StatefulWidget {
  const Efectivo({Key? key}) : super(key: key);

  @override
  State<Efectivo> createState() => _EfectivoState();
}

class _EfectivoState extends State<Efectivo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  "Historial",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 17,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * 0.0118143459915612),
                  child: const AutoSizeText(
                    "USD",
                    style: TextStyle(
                      color: Color(0xff2504ca),
                      fontSize: 20,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
            SvgPicture.asset('assets/Vectores/Iconos/Trash.svg')
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0485870104115023),
          child: const AutoSizeText(
            "Lista de divisas",
            style: TextStyle(
              color: Color(0xff170658),
              fontSize: 15,
              fontFamily: "Archivo",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0281548516842635),
          child: Row(
            children: [
              Image.asset(
                'assets/Imagenes/Group 1835.png',
                width: 35,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.0284071694284748),
                child: const AutoSizeText(
                  "Real Brasileño",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 14,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0231099372730274),
          child: Container(
            width: size.width,
            height: 0.50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffc9d1d1),
                width: 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0231099372730274),
          child: Row(
            children: [
              Image.asset(
                'assets/Imagenes/Group 1835.png',
                width: 35,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.0284071694284748),
                child: const AutoSizeText(
                  "Peso Colombiano",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 14,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0231099372730274),
          child: Container(
            width: size.width,
            height: 0.50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffc9d1d1),
                width: 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0231099372730274),
          child: Row(
            children: [
              Image.asset(
                'assets/Imagenes/Group 1836.png',
                width: 35,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.0284071694284748),
                child: const AutoSizeText(
                  "Sol Peruano",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 14,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0231099372730274),
          child: Container(
            width: size.width,
            height: 0.50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffc9d1d1),
                width: 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0231099372730274),
          child: Row(
            children: [
              Image.asset(
                'assets/Imagenes/Group 1839.png',
                width: 35,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.0284071694284748),
                child: const AutoSizeText(
                  "Euro",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 14,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0231099372730274),
          child: Container(
            width: size.width,
            height: 0.50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffc9d1d1),
                width: 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0231099372730274),
          child: Row(
            children: [
              Image.asset(
                'assets/Imagenes/Group 1837.png',
                width: 35,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.0284071694284748),
                child: const AutoSizeText(
                  "Dólar Americano",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 14,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0231099372730274),
          child: Container(
            width: size.width,
            height: 0.50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffc9d1d1),
                width: 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0231099372730274),
          child: Row(
            children: [
              Image.asset(
                'assets/Imagenes/Group 1835.png',
                width: 35,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.0284071694284748),
                child: const AutoSizeText(
                  "Peso Chileno",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 14,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Criptomoneda extends StatefulWidget {
  const Criptomoneda({Key? key}) : super(key: key);

  @override
  State<Criptomoneda> createState() => _CriptomonedaState();
}

class _CriptomonedaState extends State<Criptomoneda> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  "Historial",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 17,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * 0.0118143459915612),
                  child: const AutoSizeText(
                    "BTC",
                    style: TextStyle(
                      color: Color(0xff2504ca),
                      fontSize: 20,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
            SvgPicture.asset('assets/Vectores/Iconos/Trash.svg')
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0489266100848727),
          child: const AutoSizeText(
            "Lista de Criptomonedas",
            style: TextStyle(
              color: Color(0xff170658),
              fontSize: 15,
              fontFamily: "Archivo",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.0281218613993974),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffe8e2f9),
                ),
                child:
                    SvgPicture.asset('assets/Vectores/Iconos/ebloqscoinb.svg'),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.0290255701451279),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    AutoSizeText(
                      "Ebloqs",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AutoSizeText(
                      "EBL",
                      style: TextStyle(
                        color: Color(0xff8F8B9F),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              const AutoSizeText(
                "0.0000150",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff170658),
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.only(top: size.height * 0.0234623764035529),
        //   child: Container(
        //     width: size.width,
        //     height: 0.50,
        //     decoration: BoxDecoration(
        //       border: Border.all(
        //         color: const Color(0xffc9d1d1),
        //         width: 1,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
