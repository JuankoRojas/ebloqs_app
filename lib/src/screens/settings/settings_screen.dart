import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/providers/avatar_user_provider.dart';
import 'package:ebloqs_app/src/providers/user_info_provider.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_screen_route.dart';
import 'package:ebloqs_app/src/screens/settings/avatar_selection_screen.dart';
import 'package:ebloqs_app/src/screens/settings/payments_methods_screen.dart';
import 'package:ebloqs_app/src/screens/settings/personal_settings.dart';
import 'package:ebloqs_app/src/screens/settings/security_screen.dart';
import 'package:ebloqs_app/src/services/auth_user_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/custom_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'SettingsScreen';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool load = false;
  String? capitalized;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final avatarSelected = Provider.of<AvatarUserProvider>(context).avatarUser;
    final user = Provider.of<UserInfoProvider>(context).userInfoget;
    if (Preferences.userName != null) {
      capitalized = Preferences.userName![0].toUpperCase() +
          Preferences.userName!.substring(1);
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.08, right: size.width * 0.08),
                child: GestureDetector(
                    child: SvgPicture.asset(
                        'assets/Vectores/Iconos/Arrow left.svg'),
                    onTap: () => Navigator.pop(context)),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.0295566502463054,
                    left: size.width * 0.0426666666666667),
                child: Row(
                  children: [
                    (avatarSelected == null || avatarSelected.isEmpty)
                        ? SvgPicture.asset(
                            'assets/avatares/mascota/pet-4.svg',
                            width: size.width * 0.157333333333333,
                          )
                        : SvgPicture.asset(
                            avatarSelected,
                            width: size.width * 0.157333333333333,
                          ),
                    // Image.asset(
                    //   'assets/Imagenes/avatar.png',
                    //   width: size.width * 0.157333333333333,
                    //   fit: BoxFit.contain,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.0453333333333333,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            capitalized ?? '',
                            style: const TextStyle(
                              color: Color(0xff170658),
                              fontSize: 15,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AutoSizeText(
                            "ID: ${user["DniNumber"] ?? ''}",
                            style: const TextStyle(
                              color: Color(0xff170658),
                              fontSize: 13,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.0123152709359606),
                              child: Container(
                                width: size.width * 0.221333333333333,
                                height: size.height * 0.0369458128078818,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (user["verify"] == true)
                                      ? const Color(0xffb9f6ca)
                                      : const Color(0xffEC4141)
                                          .withOpacity(0.4),
                                ),
                                child: (user["verify"] == true)
                                    ? const Center(
                                        child: AutoSizeText(
                                          "Verificado",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff00c853),
                                            fontSize: 12,
                                            fontFamily: "Archivo",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      )
                                    : const Center(
                                        child: AutoSizeText(
                                          "No verificado",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xffEC4141),
                                            fontSize: 12,
                                            fontFamily: "Archivo",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.0221674876847291),
                child: Container(
                  width: size.width,
                  height: 0.50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffc9d1d1),
                      width: 0.50,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.0184729064039409,
                    left: size.width * 0.04,
                    right: size.width * 0.04),
                child: CustomSetting(
                  size: size,
                  setting: 'Cambiar avatar',
                  onTap: () {
                    Navigator.pushNamed(
                        context, AvatarSelectionScreen.routeName);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.0197044334975369,
                    left: size.width * 0.04,
                    right: size.width * 0.04),
                child: CustomSetting(
                  size: size,
                  setting: 'Métodos de pago',
                  onTap: () {
                    Navigator.pushNamed(
                        context, PaymentMethodsScreen.routeName);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.0197044334975369,
                    left: size.width * 0.04,
                    right: size.width * 0.04),
                child: CustomSetting(
                  size: size,
                  setting: 'Seguridad',
                  onTap: () {
                    Navigator.pushNamed(context, SecurityScreen.routeName);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.0197044334975369,
                    left: size.width * 0.04,
                    right: size.width * 0.04),
                child: CustomSetting(
                  size: size,
                  setting: 'Ajustes',
                  onTap: () {
                    Navigator.pushNamed(
                        context, PersonalSettingsScreen.routeName);
                  },
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //       top: size.height * 0.0197044334975369,
              //       left: size.width * 0.04,
              //       right: size.width * 0.04),
              //   child: CustomSetting(
              //     size: size,
              //     setting: 'Soporte',
              //     onTap: () {},
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(
              //       top: size.height * 0.0197044334975369,
              //       left: size.width * 0.04,
              //       right: size.width * 0.04),
              //   child: CustomSetting(
              //     size: size,
              //     setting: 'Siri configuración',
              //     onTap: () {},
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.172413793103448,
                    left: size.width * 0.04,
                    right: size.width * 0.04),
                child: GestureDetector(
                  child: Container(
                    width: size.width,
                    height: size.height * 0.0640394088669951,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xfff6f4fd),
                    ),
                    child: const Center(
                      child: AutoSizeText(
                        "Cerrar sesión",
                        style: TextStyle(
                          color: Color(0xff2504ca),
                          fontSize: 14,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      Preferences.uid = '';
                      Preferences.token = '';
                    });
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          OnBoardPageRoute.routeName, (route) => false);
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10, left: size.width * 0.04, right: size.width * 0.04),
                child: GestureDetector(
                  child: Container(
                    width: size.width,
                    height: size.height * 0.0640394088669951,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xfff6f4fd),
                    ),
                    child: const Center(
                      child: AutoSizeText(
                        "Eliminar Usuario",
                        style: TextStyle(
                          color: Color(0xff2504ca),
                          fontSize: 14,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    final response = await AuthUserService()
                        .deleteDataUser(accesstoken: Preferences.token!);
                    print(response);
                    if (response != null) {
                      setState(() {
                        Preferences.uid = '';
                        Preferences.token = '';
                      });
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            OnBoardPageRoute.routeName, (route) => false);
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
