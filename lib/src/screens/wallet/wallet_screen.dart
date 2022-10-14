import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';

import 'package:ebloqs_app/src/providers/avatar_user_provider.dart';
import 'package:ebloqs_app/src/providers/user_info_provider.dart';
import 'package:ebloqs_app/src/screens/buy/comprar_screen.dart';
import 'package:ebloqs_app/src/screens/settings/settings_screen.dart';
import 'package:ebloqs_app/src/screens/transfer/transfer_screen.dart';
import 'package:ebloqs_app/src/services/auth_user_service.dart';
import 'package:ebloqs_app/src/services/balance_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/custom_modal_bottom_alert.dart';
import 'package:ebloqs_app/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class WalletScreen extends StatefulWidget {
  static const String routeName = 'WalletScreen';
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with AfterLayoutMixin<WalletScreen> {
  String? ebl;
  bool isLoading = false;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    getBalance();
    var userInfo =
        await AuthUserService().getUserInfo(accesstoken: Preferences.token!);
    Future.delayed(Duration.zero).then((_) =>
        Provider.of<UserInfoProvider>(context, listen: false)
            .userInfoSet(userInfo));
  }

  getBalance() async {
    print('token $Preferences.token!');
    var balance = await BalanceService().getBalanceOf(
        accesstoken: Preferences.token!, publicKey: Preferences.public_key!);
    setState(() {
      ebl = balance;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(Preferences.id_wallet);
    print(Preferences.public_key);

    print('ebl: $ebl');
    final avatarSelected = Provider.of<AvatarUserProvider>(context).avatarUser;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UtilSize.width(12, context),
            vertical: UtilSize.height(56, context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      width: UtilSize.width(32, context),
                      height: UtilSize.width(32, context),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        color: const Color(0xffeae4fc),
                      ),
                      child: (avatarSelected == null || avatarSelected.isEmpty)
                          ? SvgPicture.asset(
                              'assets/avatares/mascota/pet-4.svg',
                              width: size.width * 0.067,
                            )
                          : SvgPicture.asset(
                              avatarSelected,
                              width: size.width * 0.067,
                            ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
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
                      hintStyle: TextStyle(
                        color: const Color(0xff170658),
                        fontSize: UtilSize.width(13, context),
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
                padding: EdgeInsets.only(
                  top: UtilSize.height(15, context),
                ),
                child: FutureBuilder(
                  future: BalanceService().getBalanceOf(
                      accesstoken: Preferences.token!,
                      publicKey: Preferences.public_key!),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      print(snapshot.data);
                      final usd = double.parse(snapshot.data) * 0.05;

                      ebl = snapshot.data;

                      return Container(
                        width: size.width * 0.95,
                        height: UtilSize.height(215, context),
                        padding: EdgeInsets.only(
                          top: size.height * 0.0172413793103448,
                          right: UtilSize.width(12, context),
                          bottom: UtilSize.height(10, context),
                          left: UtilSize.width(16, context),
                        ),
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
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: UtilSize.height(15, context),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: const Color(0x14ffffff),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                      vertical: 4,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: UtilSize.width(16, context),
                                          height: UtilSize.width(16, context),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: SvgPicture.asset(
                                            'assets/Vectores/Iconos/candado.svg',
                                            color: Colors.white,
                                            width: UtilSize.width(16, context),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Row(
                                          children: [
                                            const AutoSizeText(
                                              "Balance Bloqueado ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontFamily: "Archivo",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            AutoSizeText(
                                              snapshot.data ?? '',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontFamily: "Archivo",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const AutoSizeText(
                                              ' EBL',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontFamily: "Archivo",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.00985221674876847,
                                      left: size.width * 0.0106666666666667),
                                  child: const AutoSizeText(
                                    "BALANCE DISPONIBLE",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.59,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * (7 / size.height),
                                      left: size.width * 0.0106666666666667),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AutoSizeText(
                                        snapshot.data ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 36,
                                        ),
                                      ),
                                      SizedBox(width: size.width * 0.035),
                                      const AutoSizeText(
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
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: const Color(0xff170658),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.033,
                                          vertical: size.height * 0.01,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              "$usd USD",
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
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left:
                                                size.width * 0.138666666666667),
                                        child: const AutoSizeText(
                                          "WALLET ID",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.59,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: UtilSize.height(15, context),
                                  ),
                                  child: Container(
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
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * (36 / size.height)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right:
                                                size.width * (12 / size.width),
                                            left:
                                                size.width * (17 / size.width)),
                                        child: GestureDetector(
                                          child: Container(
                                            width:
                                                size.width * (36 / size.width),
                                            height: size.height *
                                                (36 / size.height),
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
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    shape:
                                                        RoundedRectangleBorder(
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
                                                              const AutoSizeText(
                                                                "Wallet ID",
                                                                style:
                                                                    TextStyle(
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
                                                                  data: Preferences
                                                                      .public_key!,
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
                                                                child:
                                                                    AutoSizeText(
                                                                  Preferences
                                                                      .public_key!,
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        13,
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
                                                                        height: size.height *
                                                                            (52 /
                                                                                size.height),
                                                                        width: size.width *
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
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/png/buttongradient.png',
                                                                            width:
                                                                                size.width * (301 / size.width),
                                                                            height:
                                                                                size.height * (52 / size.height),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const Center(
                                                                        child:
                                                                            AutoSizeText(
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
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color: const Color(
                                                                          0xfff9f9fa),
                                                                    ),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          AutoSizeText(
                                                                        "Cerrar",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xff170658),
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
                    } else {
                      return Container();
                    }
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
                          const AutoSizeText(
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
                        customModalBottomAlert(
                            context,
                            size,
                            "Pronto podrás depositar dinero en tu billetera.",
                            isLoading,
                            '', () {
                          Navigator.pop(context);
                        });
                      },
                    ),
                    GestureDetector(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                              'assets/Vectores/Iconos/Retirar.svg'),
                          const AutoSizeText(
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
                      onTap: () {
                        customModalBottomAlert(
                            context,
                            size,
                            '''En la etapa 2 saldremos con la inversión en tokens de bienes y servicios. Aquí podrás retirar tu dinero sobre la rentabilidad de tus inversiones.

Espérala pronto!!''',
                            isLoading,
                            '', () {
                          Navigator.pop(context);
                        });
                      },
                    ),
                    GestureDetector(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                              'assets/Vectores/Iconos/Transferir.svg'),
                          const AutoSizeText(
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
                          const AutoSizeText(
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
                      width: UtilSize.width(284, context),
                      child: const AutoSizeText(
                        "Tú acreditación de tokens puede tardar de 5 minutos hasta 1 hora. Para conocer el estatus de clic en refrescar.",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: SvgPicture.asset(
                          'assets/Vectores/Iconos/refresh.svg'),
                      onTap: () {
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * (21 / size.height)),
                child: const AutoSizeText(
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
              //               child: const AutoSizeText(
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
              //                     AutoSizeText(
              //                       "Ebloqs",
              //                       style: TextStyle(
              //                         color: Color(0xff170658),
              //                         fontSize: 14,
              //                         fontFamily: "Archivo",
              //                         fontWeight: FontWeight.w600,
              //                       ),
              //                     ),
              //                     AutoSizeText(
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
              //         const AutoSizeText(
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
              //           child: const AutoSizeText(
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
                  //   child: const AutoSizeText(
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
                  //             AutoSizeText(
                  //               "Dólares",
                  //               style: TextStyle(
                  //                 color: Color(0xff170658),
                  //                 fontSize: 14,
                  //                 fontFamily: "Archivo",
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             AutoSizeText(
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
                  //       const AutoSizeText(
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
                  //             AutoSizeText(
                  //               "Euros",
                  //               style: TextStyle(
                  //                 color: Color(0xff170658),
                  //                 fontSize: 14,
                  //                 fontFamily: "Archivo",
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             AutoSizeText(
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
                  //       const AutoSizeText(
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
                    child: const AutoSizeText(
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
                        AutoSizeText(
                          ebl ?? '0.00',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
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
                  //             AutoSizeText(
                  //               "Bitcoin",
                  //               style: TextStyle(
                  //                 color: Color(0xff170658),
                  //                 fontSize: 14,
                  //                 fontFamily: "Archivo",
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             AutoSizeText(
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
                  //       const AutoSizeText(
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
                  //             AutoSizeText(
                  //               "Ethereum",
                  //               style: TextStyle(
                  //                 color: Color(0xff170658),
                  //                 fontSize: 14,
                  //                 fontFamily: "Archivo",
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //             AutoSizeText(
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
                  //       const AutoSizeText(
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
