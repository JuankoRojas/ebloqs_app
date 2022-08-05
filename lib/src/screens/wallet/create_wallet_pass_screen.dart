import 'package:ebloqs_app/src/utilitis/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateWalletPassScreen extends StatefulWidget {
  static const String routeName = 'CreateWalletPassScreen';
  const CreateWalletPassScreen({Key? key}) : super(key: key);

  @override
  State<CreateWalletPassScreen> createState() => _CreateWalletPassScreenState();
}

class _CreateWalletPassScreenState extends State<CreateWalletPassScreen> {
  bool visible = false;
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  final GlobalKey<FormState> formKey3 = GlobalKey<FormState>();

  final TextEditingController passController = TextEditingController();
  final TextEditingController passConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: systemBarDark,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset('assets/png/02 1.png'),
              Padding(
                padding: const EdgeInsets.only(top: 62.0, left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.canPop(context);
                          },
                          child: SvgPicture.asset(
                              'assets/Vectores/Iconos/Arrow left.svg'),
                        ),
                        Expanded(child: Container()),
                        const Align(
                          alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              "Crea tu billetera",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 17,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 45.0),
                      child: Text(
                        "Crear contraseña",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 20,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        width: 345,
                        height: 76,
                        child: Text(
                          "Establezca una contraseña para su copia de seguridad en la nube y guárdela en un lugar seguro. No podemos restablecer la contraseña por usted. No reutilices tu contraseña de la nube.",
                          style: TextStyle(
                              color: Color(0xff170658),
                              fontSize: 14,
                              fontFamily: "Archivo",
                              fontWeight: FontWeight.w400,
                              height: 1.2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 15),
                      child: Form(
                        key: formKey3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Ingresa tu contraseña",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 13,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: TextFormField(
                                controller: passController,
                                obscureText: _showPassword,
                                style: const TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 16,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _showPassword = !_showPassword;
                                        });
                                      },
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: const Color(0xfff9f9fa),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/Vectores/Iconos/eye.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 27.0),
                              child: Text(
                                "Ingresa una vez más tu contraseña",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: TextFormField(
                                controller: passConfirmController,
                                obscureText: _showConfirmPassword,
                                style: const TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 16,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w400,
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _showConfirmPassword =
                                              !_showConfirmPassword;
                                        });
                                      },
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: const Color(0xfff9f9fa),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/Vectores/Iconos/eye.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 27.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.only(
                                        top: 5.67,
                                        bottom: 5.67,
                                        left: 4.33,
                                        right: 3.67),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xffeae4fc),
                                        width: 1,
                                      ),
                                      color: const Color(0xfff6f4fd),
                                    ),
                                    child: (visible == true)
                                        ? SvgPicture.asset(
                                            'assets/Vectores/Iconos/Checktherm.svg',
                                          )
                                        : Container(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: GestureDetector(
                                      child: const Text(
                                        "Acepto términos y condiciones ebloqs",
                                        style: TextStyle(
                                          color: Color(0xff170658),
                                          fontSize: 13,
                                          fontFamily: "Archivo",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          if (visible == false) {
                                            visible = true;
                                          } else {
                                            visible = false;
                                          }
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 204.0, right: 15),
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
                                "Continuar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                        onTap: () async {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
