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
          padding: const EdgeInsets.only(top: 62.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 19),
                child: Row(
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                          'assets/Vectores/Iconos/Arrow left.svg'),
                      onTap: () {},
                    ),
                    Expanded(child: Container()),
                    const Text(
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
                padding: const EdgeInsets.only(top: 32.0),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: size.width * 0.5,
                        height: 54,
                        color: const Color(0xfff6f4fd),
                        child: const Center(
                          child: Text(
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
                        height: 54,
                        color: const Color(0xfff9f9fa),
                        child: const Center(
                          child: Text(
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
                padding: const EdgeInsets.only(top: 39.0, left: 16, right: 16),
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
                      padding: const EdgeInsets.only(
                          top: 36, left: 15.0, right: 15, bottom: 48),
                      child: ButtonPrimary(
                          title: 'Continuar',
                          onPressed: () {},
                          load: isLoadLogin!,
                          disabled: isLoadLogin!),
                    )
                  : const Padding(
                      padding: EdgeInsets.only(
                          top: 36, left: 15.0, right: 15, bottom: 48),
                      child: Text(
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
              children: const [
                Text(
                  "Historial",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 17,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
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
        const Padding(
          padding: EdgeInsets.only(top: 42.0),
          child: Text(
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
          padding: const EdgeInsets.only(top: 24.0),
          child: Row(
            children: [
              Image.asset(
                'assets/Imagenes/Group 1835.png',
                width: 35,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
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
          padding: const EdgeInsets.only(top: 20.0),
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
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              Image.asset(
                'assets/Imagenes/Group 1835.png',
                width: 35,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
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
          padding: const EdgeInsets.only(top: 20.0),
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
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              Image.asset(
                'assets/Imagenes/Group 1836.png',
                width: 35,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
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
          padding: const EdgeInsets.only(top: 20.0),
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
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              Image.asset(
                'assets/Imagenes/Group 1839.png',
                width: 35,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
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
          padding: const EdgeInsets.only(top: 20.0),
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
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              Image.asset(
                'assets/Imagenes/Group 1837.png',
                width: 35,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
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
          padding: const EdgeInsets.only(top: 20.0),
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
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              Image.asset(
                'assets/Imagenes/Group 1835.png',
                width: 35,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
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
              children: const [
                Text(
                  "Historial",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 17,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
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
        const Padding(
          padding: EdgeInsets.only(top: 42.0),
          child: Text(
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
          padding: const EdgeInsets.only(top: 24.0),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffe8e2f9),
                ),
                child: Image.asset(
                  'assets/Imagenes/eblcoin.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Ebloqs",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
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
              const Text(
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
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
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
      ],
    );
  }
}
