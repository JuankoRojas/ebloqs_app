import 'package:ebloqs_app/src/screens/buy/comprar_screen.dart';
import 'package:ebloqs_app/src/screens/deposit/deposit_screen.dart';
import 'package:ebloqs_app/src/screens/transfer/transfer_screen.dart';
import 'package:ebloqs_app/src/services/balance_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

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
                padding: EdgeInsets.only(top: size.height * (16 / size.height)),
                child: FutureBuilder(
                  future: BalanceService()
                      .getBalance(accesstoken: Preferences.id_wallet!),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    print(snapshot.data);
                    return Container(
                      width: size.width,
                      height: size.height * (175 / size.height),
                      padding: EdgeInsets.only(
                          top: size.height * (24 / size.height),
                          right: size.width * (12 / size.width),
                          bottom: size.height * (10 / size.height),
                          left: size.width * (16 / size.width)),
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
                                padding: EdgeInsets.only(
                                    top: size.height * (7 / size.height)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      snapshot.data ?? '',
                                      style: const TextStyle(
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
                                padding: EdgeInsets.only(
                                    top: size.height * (6 / size.height)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data} USD",
                                        style: const TextStyle(
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
                                padding: EdgeInsets.all(size.width * 0.02),
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
                                child: SvgPicture.asset(
                                    'assets/Vectores/Iconos/ebloqscoinb.svg'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * (36 / size.height)),
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
                                      padding: EdgeInsets.only(
                                          right: size.width * (15 / size.width),
                                          left: size.width * (17 / size.width)),
                                      child: GestureDetector(
                                        child: Container(
                                          width: size.width * (36 / size.width),
                                          height:
                                              size.height * (36 / size.height),
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
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  content: SizedBox(
                                                    width: size.width *
                                                        (333 / size.width),
                                                    height: size.height *
                                                        (597 / size.height),
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
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  top: size
                                                                          .height *
                                                                      (7 /
                                                                          size.height)),
                                                              child: QrImage(
                                                                data:
                                                                    "0xbc1655182858764PxC90298",
                                                                version:
                                                                    QrVersions
                                                                        .auto,
                                                                size: 222.0,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  top: size
                                                                          .height *
                                                                      (25 /
                                                                          size.height)),
                                                              child: const Text(
                                                                "0xbc1655182858764PxC90298",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 13,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  top: size
                                                                          .height *
                                                                      (35 /
                                                                          size
                                                                              .height),
                                                                  right: size
                                                                          .width *
                                                                      (16 /
                                                                          size
                                                                              .width),
                                                                  bottom: size
                                                                          .height *
                                                                      (8 /
                                                                          size
                                                                              .height),
                                                                  left: size
                                                                          .width *
                                                                      (16 /
                                                                          size.width)),
                                                              child:
                                                                  GestureDetector(
                                                                child: Stack(
                                                                  alignment:
                                                                      AlignmentDirectional
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      height: size
                                                                              .height *
                                                                          (52 /
                                                                              size.height),
                                                                      width: size
                                                                              .width *
                                                                          (301 /
                                                                              size.width),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
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
                                                                            BorderRadius.circular(5),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/png/buttongradient.png',
                                                                          width:
                                                                              size.width * (301 / size.width),
                                                                          height:
                                                                              size.height * (52 / size.height),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const Center(
                                                                      child:
                                                                          Text(
                                                                        "Compartir",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14,
                                                                          fontFamily:
                                                                              "Archivo",
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                onTap: () {
                                                                  Share.share(Preferences
                                                                      .id_wallet
                                                                      .toString());
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: size
                                                                          .width *
                                                                      (16 /
                                                                          size
                                                                              .width),
                                                                  left: size
                                                                          .width *
                                                                      (16 /
                                                                          size.width)),
                                                              child:
                                                                  GestureDetector(
                                                                child:
                                                                    Container(
                                                                  width: size
                                                                          .width *
                                                                      (301 /
                                                                          size.width),
                                                                  height: size
                                                                          .height *
                                                                      (52 /
                                                                          size.height),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
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
                                                                            FontWeight.w600,
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
                                    GestureDetector(
                                      child: Container(
                                        width: size.width * (36 / size.width),
                                        height:
                                            size.height * (36 / size.height),
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
                                              'assets/Vectores/Iconos/copy2.svg'),
                                        ),
                                      ),
                                      onTap: () {
                                        Clipboard.setData(ClipboardData(
                                            text: Preferences.id_wallet));
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * (16 / size.height)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Column(
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
                      onTap: () {
                        Navigator.pushNamed(context, DepositScreen.routeName);
                      },
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
                    GestureDetector(
                      child: Column(
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
                      onTap: () {
                        Navigator.pushNamed(context, TransferScreen.routeName);
                      },
                    ),
                    GestureDetector(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                              'assets/Vectores/Iconos/Comprar.svg'),
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
                      onTap: () {
                        Navigator.pushNamed(context, ComprarScreen.routeName);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: size.height * (37.25 / size.height)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * (284 / size.width),
                      child: const Text(
                        "Tú acreditación de tokens puede tardar de 5 minutos hasta 1 hora. Para conocer el estatus de clic en refrescar.",
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
              Padding(
                padding: EdgeInsets.only(top: size.height * (21 / size.height)),
                child: const Text(
                  "Saldos disponibles",
                  style: TextStyle(
                    color: Color(0xff2504ca),
                    fontSize: 15,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           children: [
              //             Padding(
              //               padding: EdgeInsets.only(
              //                   top: size.height * (12 / size.height)),
              //               child: const Text(
              //                 "Tokens",
              //                 style: TextStyle(
              //                   color: Color(0xff170658),
              //                   fontSize: 14,
              //                   fontFamily: "Archivo",
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(
              //               top: size.height * (8 / size.height)),
              //           child: Row(
              //             children: [
              //               Image.asset(
              //                 'assets/Imagenes/Ebloqs.png',
              //                 width: 42,
              //                 height: 42,
              //               ),
              //               Padding(
              //                 padding: EdgeInsets.only(
              //                     left: size.width * (12 / size.width)),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: const [
              //                     Text(
              //                       "Ebloqs",
              //                       style: TextStyle(
              //                         color: Color(0xff170658),
              //                         fontSize: 14,
              //                         fontFamily: "Archivo",
              //                         fontWeight: FontWeight.w600,
              //                       ),
              //                     ),
              //                     Text(
              //                       "EBL-HERALD-01.",
              //                       style: TextStyle(
              //                         color: Color(0xff8F8B9F),
              //                         fontSize: 14,
              //                         fontFamily: "Archivo",
              //                         fontWeight: FontWeight.w400,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       children: [
              //         const Text(
              //           "Disponibles",
              //           style: TextStyle(
              //             color: Color(0xff170658),
              //             fontSize: 14,
              //             fontFamily: "Archivo",
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //         Container(
              //           height: 8,
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(
              //               top: size.height * (21 / size.height)),
              //           child: const Text(
              //             "50",
              //             textAlign: TextAlign.right,
              //             style: TextStyle(
              //               color: Color(0xff170658),
              //               fontSize: 14,
              //               fontFamily: "Archivo",
              //               fontWeight: FontWeight.w400,
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ],
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: size.height * (16 / size.height)),
              //   child: Container(
              //     width: size.width * (376.50 / size.width),
              //     height: 0.50,
              //     color: const Color(0xffc9d1d1),
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // Padding(
                  //   padding:
                  //       EdgeInsets.only(top: size.height * (16 / size.height)),
                  //   child: const Text(
                  //     "Dinero",
                  //     style: TextStyle(
                  //       color: Color(0xff170658),
                  //       fontSize: 14,
                  //       fontFamily: "Archivo",
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding:
                  //       EdgeInsets.only(top: size.height * (8 / size.height)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SizedBox(
                  //           width: size.width * (42 / size.width),
                  //           height: size.height * (42 / size.height),
                  //           child: Image.asset('assets/Imagenes/Dolares.png')),
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //             left: size.width * (12 / size.width)),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: const [
                  //             Text(
                  //               "Dólares",
                  //               style: TextStyle(
                  //                 color: Color(0xff170658),
                  //                 fontSize: 14,
                  //                 fontFamily: "Archivo",
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             Text(
                  //               "USD",
                  //               style: TextStyle(
                  //                 color: Color(0xff8F8B9F),
                  //                 fontSize: 14,
                  //                 fontFamily: "Archivo",
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Expanded(child: Container()),
                  //       const Text(
                  //         "1,500.00",
                  //         textAlign: TextAlign.right,
                  //         style: TextStyle(
                  //           color: Color(0xff170658),
                  //           fontSize: 14,
                  //           fontFamily: "Archivo",
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding:
                  //       EdgeInsets.only(top: size.height * (16 / size.height)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SizedBox(
                  //           width: size.width * (42 / size.width),
                  //           height: size.height * (42 / size.height),
                  //           child: Image.asset('assets/Imagenes/Euros.png')),
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //             left: size.width * (12 / size.width)),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: const [
                  //             Text(
                  //               "Euros",
                  //               style: TextStyle(
                  //                 color: Color(0xff170658),
                  //                 fontSize: 14,
                  //                 fontFamily: "Archivo",
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             Text(
                  //               "EUR",
                  //               style: TextStyle(
                  //                 color: Color(0xff8F8B9F),
                  //                 fontSize: 14,
                  //                 fontFamily: "Archivo",
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Expanded(child: Container()),
                  //       const Text(
                  //         "135.00",
                  //         textAlign: TextAlign.right,
                  //         style: TextStyle(
                  //           color: Color(0xff170658),
                  //           fontSize: 14,
                  //           fontFamily: "Archivo",
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * (16 / size.height)),
                child: Container(
                  width: size.width * (376.50 / size.width),
                  height: 0.50,
                  color: const Color(0xffc9d1d1),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: size.height * (16 / size.height)),
                    child: const Text(
                      "Criptomonedas",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: size.height * (8 / size.height)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: size.width * (42 / size.width),
                            height: size.height * (42 / size.height),
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
                          padding: EdgeInsets.only(
                              left: size.width * (12 / size.width)),
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
                  // Padding(
                  //   padding:
                  //       EdgeInsets.only(top: size.height * (16 / size.height)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SizedBox(
                  //           width: 42,
                  //           height: 42,
                  //           child: Image.asset('assets/Imagenes/Bitcoin.png')),
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //             left: size.width * (12 / size.width)),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: const [
                  //             Text(
                  //               "Bitcoin",
                  //               style: TextStyle(
                  //                 color: Color(0xff170658),
                  //                 fontSize: 14,
                  //                 fontFamily: "Archivo",
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             Text(
                  //               "BTC",
                  //               style: TextStyle(
                  //                 color: Color(0xff8F8B9F),
                  //                 fontSize: 14,
                  //                 fontFamily: "Archivo",
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Expanded(child: Container()),
                  //       const Text(
                  //         "0.00004378",
                  //         textAlign: TextAlign.right,
                  //         style: TextStyle(
                  //           color: Color(0xff170658),
                  //           fontSize: 14,
                  //           fontFamily: "Archivo",
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding:
                  //       EdgeInsets.only(top: size.height * (16 / size.height)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SizedBox(
                  //           width: size.width * (42 / size.width),
                  //           height: size.height * (42 / size.height),
                  //           child: Image.asset('assets/Imagenes/Ethereum.png')),
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //             left: size.width * (12 / size.width)),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: const [
                  //             Text(
                  //               "Ethereum",
                  //               style: TextStyle(
                  //                 color: Color(0xff170658),
                  //                 fontSize: 14,
                  //                 fontFamily: "Archivo",
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             Text(
                  //               "ETH",
                  //               style: TextStyle(
                  //                 color: Color(0xff8F8B9F),
                  //                 fontSize: 14,
                  //                 fontFamily: "Archivo",
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Expanded(child: Container()),
                  //       const Text(
                  //         "0.00000398",
                  //         textAlign: TextAlign.right,
                  //         style: TextStyle(
                  //           color: Color(0xff170658),
                  //           fontSize: 14,
                  //           fontFamily: "Archivo",
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
