import 'package:device_apps/device_apps.dart';
import 'package:ebloqs_app/src/providers/user_info_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RegistroLinkScreen extends StatefulWidget {
  static const routeName = 'RegistroLinkScreen';
  const RegistroLinkScreen({Key? key}) : super(key: key);

  @override
  State<RegistroLinkScreen> createState() => _RegistroLinkScreenState();
}

class _RegistroLinkScreenState extends State<RegistroLinkScreen> {
  String splitEmail = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String? email = Provider.of<UserInfoProvider>(context).emailget;
    if (email != '') {
      splitEmail = email!.split('@')[1];
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 34, left: 22),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(
                    'assets/Vectores/Iconos/Arrow left.svg',
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.5),
                  child: Text(
                    'Regresar',
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 14,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/Vectores/Iconos/Group2148.svg',
                        width: size.width * 0.25,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.086, left: size.width * 0.545),
                      child: SvgPicture.asset(
                        'assets/Vectores/Iconos/checkcircle.svg',
                        width: size.width * 0.07,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.025),
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
                  padding: EdgeInsets.only(top: size.height * 0.037),
                  child: Container(
                    height: size.height * 0.095,
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
                  padding: EdgeInsets.only(top: size.height * 0.025),
                  child: GestureDetector(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: size.width * 0.135,
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
                    onTap: () async {
                      if (splitEmail.contains('gmail')) {
                        bool isInstalled = await DeviceApps.isAppInstalled(
                            'com.google.android.gm');
                        print(isInstalled);
                        if (isInstalled != false) {
                          DeviceApps.openApp('com.google.android.gm');
                          Future.delayed(Duration.zero)
                              .then((_) => Navigator.pop(context));
                        } else {
                          String url =
                              'https://play.google.com/store/apps/details?id=com.google.android.gm&gl=US';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw 'Could not launch $url';
                          }
                        }
                      } else if (splitEmail.contains('gmail')) {
                        bool isInstalled = await DeviceApps.isAppInstalled(
                            'com.google.android.gm');
                        print(isInstalled);
                        if (isInstalled != false) {
                          DeviceApps.openApp('com.google.android.gm');
                          Future.delayed(Duration.zero)
                              .then((_) => Navigator.pop(context));
                        } else {
                          String url = 'https://mail.google.com/';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw 'Could not launch $url';
                          }
                        }
                      } else if (splitEmail.contains('outlook')) {
                        bool isInstalled = await DeviceApps.isAppInstalled(
                            'com.microsoft.office.outlook');
                        print(isInstalled);
                        if (isInstalled != false) {
                          DeviceApps.openApp('com.microsoft.office.outlook');
                        } else {
                          String url = 'https://outlook.live.com/';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw 'Could not launch $url';
                          }
                        }
                      } else if (splitEmail.contains('mail')) {
                        bool isInstalled = await DeviceApps.isAppInstalled(
                            'com.apple.mobilemail');
                        print(isInstalled);
                        if (isInstalled != false) {
                          DeviceApps.openApp('com.apple.mobilemail');
                        }
                        //  else {
                        //   String url =
                        //       'https://play.google.com/store/apps/details?id=com.microsoft.office.outlook&gl=US';
                        //   if (await canLaunchUrl(Uri.parse(url))) {
                        //     await launchUrl(Uri.parse(url));
                        //   } else {
                        //     throw 'Could not launch $url';
                        //   }
                        // }
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.1),
                  child: const Text(
                    "¿No recibiste el correo?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 13,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.015),
                  child: const Text(
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
        ],
      ),
    );
  }
}
