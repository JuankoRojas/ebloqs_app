import 'package:ebloqs_app/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WalletScreen extends StatefulWidget {
  static const String routeName = 'WalletScreen';
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.035, vertical: size.height * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/Imagenes/avatar.png',
                    width: size.width * 0.067,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: size.width * 0.69,
                    height: size.height * 0.047,
                    child: OutlineSearchBar(
                      borderRadius: BorderRadius.circular(100),
                      borderColor: const Color(0xffeae4fc),
                      searchButtonIconColor: const Color(0xff170658),
                      hideSearchButton: true,
                      hintText: 'Buscar Propiedades',
                      hintStyle: const TextStyle(
                        color: Color(0xff170658),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/Vectores/Iconos/Bell.svg',
                      width: size.width * 0.06,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  width: 359,
                  height: 164,
                  padding: const EdgeInsets.only(
                      top: 24, right: 12, bottom: 10, left: 16),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/Imagenes/Mask group.png'),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "BALANCE DISPONIBLE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.59,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 7.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "15000",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 36,
                                  ),
                                ),
                                SizedBox(width: size.width * 0.035),
                                const Text(
                                  "EBL",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.55,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color(0xff170658),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.033,
                                vertical: size.height * 0.01,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "1,500 USD",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: size.width * 0.15,
                            height: size.width * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white.withOpacity(0.7),
                                  const Color(0x00ffffff)
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 36.0),
                            child: Row(
                              children: [
                                const Text(
                                  "WALLET ID",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.59,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15.0, left: 17),
                                  child: GestureDetector(
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.white.withOpacity(0.7),
                                            const Color(0x00ffffff)
                                          ],
                                        ),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            'assets/Vectores/Iconos/qr2.svg'),
                                      ),
                                    ),
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          // barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              contentPadding: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              content: SizedBox(
                                                width: 333,
                                                height: 597,
                                                child: Stack(
                                                  children: [
                                                    Image.asset(
                                                        'assets/Imagenes/Pop up.png'),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          "Wallet ID",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff2504ca),
                                                            fontSize: 20,
                                                            fontFamily:
                                                                "Archivo",
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 7.0),
                                                          child: QrImage(
                                                            data:
                                                                "0xbc1655182858764PxC90298",
                                                            version:
                                                                QrVersions.auto,
                                                            size: 222.0,
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 25.0),
                                                          child: Text(
                                                            "0xbc1655182858764PxC90298",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 35.0,
                                                                  right: 16,
                                                                  bottom: 8,
                                                                  left: 16),
                                                          child:
                                                              GestureDetector(
                                                            child: Stack(
                                                              alignment:
                                                                  AlignmentDirectional
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  height: 52,
                                                                  width: 301,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    // boxShadow: const [
                                                                    //   BoxShadow(
                                                                    //     color: Color(
                                                                    //         0x3f000000),
                                                                    //     blurRadius:
                                                                    //         4,
                                                                    //     offset: Offset(
                                                                    //         0,
                                                                    //         2),
                                                                    //   ),
                                                                    // ],
                                                                  ),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/png/buttongradient.png',
                                                                      width:
                                                                          301,
                                                                      height:
                                                                          52,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                const Center(
                                                                  child: Text(
                                                                    "Compartir",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          "Archivo",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            onTap: () {},
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 16,
                                                                  left: 16),
                                                          child:
                                                              GestureDetector(
                                                            child: Container(
                                                              width: 301,
                                                              height: 52,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: const Color(
                                                                    0xfff9f9fa),
                                                              ),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  "Cerrar",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff170658),
                                                                    fontSize:
                                                                        14,
                                                                    fontFamily:
                                                                        "Archivo",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                  ),
                                ),
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white.withOpacity(0.7),
                                        const Color(0x00ffffff)
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                        'assets/Vectores/Iconos/copy2.svg'),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                            'assets/Vectores/Iconos/Depositar.svg'),
                        const Text(
                          "Depositar",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 12,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset('assets/Vectores/Iconos/Retirar.svg'),
                        const Text(
                          "Retirar",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 12,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                            'assets/Vectores/Iconos/Transferir.svg'),
                        const Text(
                          "Transferir",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 12,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset('assets/Vectores/Iconos/Comprar.svg'),
                        const Text(
                          "Comprar",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 12,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 37.25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 284,
                      child: Text(
                        "Tu acreditación de criptos puede tardar de cinco minutos hasta una hora.",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/Vectores/Iconos/refresh.svg')
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 21.0),
                child: Text(
                  "Saldos disponibles",
                  style: TextStyle(
                    color: Color(0xff2504ca),
                    fontSize: 15,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 12.0),
                            child: Text(
                              "Tokens",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 14,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/Imagenes/Ebloqs.png',
                              width: 42,
                              height: 42,
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
                                    "EBL-HERALD-01.",
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
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Disponibles",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 14,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 21.0),
                        child: Text(
                          "50",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 14,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  width: 376.50,
                  height: 0.50,
                  color: const Color(0xffc9d1d1),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      "Dinero",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 42,
                            height: 42,
                            child: Image.asset('assets/Imagenes/Dolares.png')),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Dólares",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 14,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "USD",
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
                          "1,500.00",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 14,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 42,
                            height: 42,
                            child: Image.asset('assets/Imagenes/Euros.png')),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Euros",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 14,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "EUR",
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
                          "135.00",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 14,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  width: 376.50,
                  height: 0.50,
                  color: const Color(0xffc9d1d1),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      "Criptos",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 42,
                            height: 42,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xffe2e2e2),
                                  Color(0xfffbfbfb),
                                  Color(0xffe5e4e8)
                                ],
                              ),
                            ),
                            child: SvgPicture.asset(
                                'assets/Vectores/Iconos/Group 1807.svg')),
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
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 42,
                            height: 42,
                            child: Image.asset('assets/Imagenes/Bitcoin.png')),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Bitcoin",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 14,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "BTC",
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
                          "0.00004378",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 14,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 42,
                            height: 42,
                            child: Image.asset('assets/Imagenes/Ethereum.png')),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Ethereum",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 14,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "ETH",
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
                          "0.00000398",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 14,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigator(),
    );
  }
}
