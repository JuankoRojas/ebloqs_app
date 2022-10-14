import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/providers/avatar_user_provider.dart';
import 'package:ebloqs_app/src/screens/wallet/wallet_screen.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AvatarSelectionScreen extends StatefulWidget {
  static const String routeName = 'AvatarSelectionScreen';
  const AvatarSelectionScreen({super.key});

  @override
  State<AvatarSelectionScreen> createState() => _AvatarSelectionScreenState();
}

class _AvatarSelectionScreenState extends State<AvatarSelectionScreen> {
  bool load = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final avatarSelected = Provider.of<AvatarUserProvider>(context).avatarUser;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.0738916256157636,
                    left: size.width * 0.064,
                    right: size.width * 0.0426666666666667),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                          'assets/Vectores/Iconos/Arrow left.svg'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const AutoSizeText(
                      "Selecciona un avatar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 17,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      child: SvgPicture.asset(
                          'assets/Vectores/Iconos/Question.svg'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.0332512315270936),
                child: Center(
                  child: Container(
                    width: 78,
                    height: 78,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      color: const Color(0xffeae4fc),
                    ),
                    child: (avatarSelected == null || avatarSelected.isEmpty)
                        ? SvgPicture.asset('assets/avatares/mascota/pet-4.svg')
                        : SvgPicture.asset(avatarSelected),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.0566502463054187,
                    left: size.width * 0.04),
                child: const AutoSizeText(
                  "Selecciona tu avatar favorito",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 15,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.0369458128078818),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset('assets/uavatares/1.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                  listen: false)
                              .avatarSetUser = 'assets/uavatares/1.svg';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset('assets/uavatares/2.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                  listen: false)
                              .avatarSetUser = 'assets/uavatares/2.svg';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset('assets/uavatares/3.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                  listen: false)
                              .avatarSetUser = 'assets/uavatares/3.svg';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset('assets/uavatares/4.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                  listen: false)
                              .avatarSetUser = 'assets/uavatares/4.svg';
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.0369458128078818),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset(
                            'assets/avatares/avatar/men/men-1.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                      listen: false)
                                  .avatarSetUser =
                              'assets/avatares/avatar/men/men-1.svg';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset(
                            'assets/avatares/avatar/men/men-4.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                      listen: false)
                                  .avatarSetUser =
                              'assets/avatares/avatar/men/men-4.svg';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset(
                            'assets/avatares/avatar/girls/girl-1.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                      listen: false)
                                  .avatarSetUser =
                              'assets/avatares/avatar/girls/girl-1.svg';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset(
                            'assets/avatares/avatar/girls/girl-4.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                      listen: false)
                                  .avatarSetUser =
                              'assets/avatares/avatar/girls/girl-4.svg';
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.0369458128078818),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset(
                            'assets/avatares/avatar/men/men-5.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                      listen: false)
                                  .avatarSetUser =
                              'assets/avatares/avatar/men/men-5.svg';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset(
                            'assets/avatares/avatar/men/men-6.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                      listen: false)
                                  .avatarSetUser =
                              'assets/avatares/avatar/men/men-6.svg';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset(
                            'assets/avatares/avatar/girls/girl-5.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                      listen: false)
                                  .avatarSetUser =
                              'assets/avatares/avatar/girls/girl-5.svg';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset(
                            'assets/avatares/avatar/girls/girl-6.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                      listen: false)
                                  .avatarSetUser =
                              'assets/avatares/avatar/girls/girl-6.svg';
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.0369458128078818),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset(
                            'assets/avatares/mascota/pet-1.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                      listen: false)
                                  .avatarSetUser =
                              'assets/avatares/mascota/pet-1.svg';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset(
                            'assets/avatares/mascota/pet-2.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                      listen: false)
                                  .avatarSetUser =
                              'assets/avatares/mascota/pet-2.svg';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset(
                            'assets/avatares/mascota/pet-3.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                      listen: false)
                                  .avatarSetUser =
                              'assets/avatares/mascota/pet-3.svg';
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: const Color(0xffeae4fc),
                        ),
                        child: SvgPicture.asset(
                            'assets/avatares/mascota/pet-4.svg'),
                      ),
                      onTap: () {
                        setState(() {
                          Provider.of<AvatarUserProvider>(context,
                                      listen: false)
                                  .avatarSetUser =
                              'assets/avatares/mascota/pet-4.svg';
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.172413793103448,
                    left: size.width * 0.04,
                    right: size.width * 0.04),
                child: ButtonPrimary(
                    width: size.width,
                    title: 'Continuar',
                    onPressed: () {
                      Navigator.pushNamed(context, WalletScreen.routeName);
                    },
                    load: load),
              )
            ]),
      ),
    );
  }
}
