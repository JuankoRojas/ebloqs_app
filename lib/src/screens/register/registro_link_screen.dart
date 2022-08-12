import 'package:ebloqs_app/src/providers/user_info_provider.dart';
import 'package:ebloqs_app/src/screens/wallet/create_wallet_pass_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RegistroLinkScreen extends StatefulWidget {
  static const routeName = 'RegistroLinkScreen';
  const RegistroLinkScreen({Key? key}) : super(key: key);

  @override
  State<RegistroLinkScreen> createState() => _RegistroLinkScreenState();
}

class _RegistroLinkScreenState extends State<RegistroLinkScreen> {
  @override
  Widget build(BuildContext context) {
    String? email = Provider.of<UserInfoProvider>(context).emailget;
    print(email);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 130),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/Vectores/Iconos/Group2148.svg',
                    width: 98,
                    height: 98,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0, left: 205),
                  child: SvgPicture.asset(
                    'assets/Vectores/Iconos/checkcircle.svg',
                    width: 27,
                    height: 27,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text(
                  email ?? '',
                  style: const TextStyle(
                    color: Color(0xff170658),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 29.0),
              child: Container(
                height: 78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color(0xffeae4fc),
                    width: 1,
                  ),
                  color: const Color(0xfff9f9fa),
                ),
                child: const Center(
                  child: Text(
                    '''Hemos enviado un link a tu correo para
continuar el proceso de registro en Ebloqs''',
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3f000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/png/buttongradient.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Abrir mi correo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/svg/close.svg',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 31.0, left: 30, right: 30),
                              child: GestureDetector(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/Imagenes/image2.png',
                                      width: 43,
                                      height: 43,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 26.0),
                                      child: Text(
                                        "Abrir Gmail",
                                        style: TextStyle(
                                          color: Color(0xff170658),
                                          fontSize: 15,
                                          fontFamily: "Archivo",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    SvgPicture.asset(
                                      'assets/Vectores/Iconos/chevronright.svg',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                onTap: () async {
                                  // bool isInstalled =
                                  //     await DeviceApps.isAppInstalled(
                                  //         'com.google.android.gm');
                                  // print(isInstalled);
                                  // if (isInstalled != false) {
                                  //   // AndroidIntent intent = const AndroidIntent(
                                  //   //     action: 'action_view', data: '');
                                  //   // await intent.launch();
                                  //   DeviceApps.openApp('com.google.android.gm');
                                  // } else {
                                  //   String url =
                                  //       'https://play.google.com/store/apps/details?id=com.google.android.gm&gl=US';
                                  //   if (await canLaunchUrl(Uri.parse(url))) {
                                  //     await launchUrl(Uri.parse(url));
                                  //   } else {
                                  //     throw 'Could not launch $url';
                                  //   }
                                  // }
                                  Navigator.pushNamed(context,
                                      CreateWalletPassScreen.routeName);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 31.0, left: 30, right: 30),
                              child: GestureDetector(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/Imagenes/image1.png',
                                      width: 43,
                                      height: 43,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 26.0),
                                      child: Text(
                                        "Abrir Outlook",
                                        style: TextStyle(
                                          color: Color(0xff170658),
                                          fontSize: 15,
                                          fontFamily: "Archivo",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    SvgPicture.asset(
                                      'assets/Vectores/Iconos/chevronright.svg',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                onTap: () async {
                                  // bool isInstalled =
                                  //     await DeviceApps.isAppInstalled(
                                  //         'com.microsoft.office.outlook');
                                  // print(isInstalled);
                                  // if (isInstalled != false) {
                                  //   // AndroidIntent intent = const AndroidIntent(
                                  //   //     action: 'action_view', data: '');
                                  //   // await intent.launch();
                                  //   DeviceApps.openApp(
                                  //       'com.microsoft.office.outlook');
                                  // } else {
                                  //   String url =
                                  //       'https://play.google.com/store/apps/details?id=com.microsoft.office.outlook&gl=US';
                                  //   if (await canLaunchUrl(Uri.parse(url))) {
                                  //     await launchUrl(Uri.parse(url));
                                  //   } else {
                                  //     throw 'Could not launch $url';
                                  //   }
                                  // }
                                  Navigator.pushNamed(context,
                                      CreateWalletPassScreen.routeName);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 31.0, left: 30, right: 30, bottom: 67),
                              child: GestureDetector(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/Imagenes/image3.png',
                                      width: 43,
                                      height: 43,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 26.0),
                                      child: Text(
                                        "Abrir Apple Mail",
                                        style: TextStyle(
                                          color: Color(0xff170658),
                                          fontSize: 15,
                                          fontFamily: "Archivo",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    SvgPicture.asset(
                                      'assets/Vectores/Iconos/chevronright.svg',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                                onTap: () async {
                                  Navigator.pushNamed(context,
                                      CreateWalletPassScreen.routeName);
                                },
                              ),
                            )
                          ],
                        );
                      });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 82.0),
              child: Text(
                "¿No recibiste el correo?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff170658),
                  fontSize: 13,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                "Envíalo otra vez",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff2504ca),
                  fontSize: 13,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
