import 'package:ebloqs_app/src/screens/legal/therms_conditions_screen.dart';
import 'package:ebloqs_app/src/screens/wallet/create_wallet_screen.dart';
import 'package:ebloqs_app/src/services/create_wallet_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/custom_modal_bottom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateWalletPassScreen extends StatefulWidget {
  static const String routeName = 'CreateWalletPassScreen';
  const CreateWalletPassScreen({Key? key}) : super(key: key);

  @override
  State<CreateWalletPassScreen> createState() => _CreateWalletPassScreenState();
}

class _CreateWalletPassScreenState extends State<CreateWalletPassScreen> {
  String? errorValidation;
  bool isLoading = false;
  bool visible = false;
  bool _showPassword = true;
  bool _showConfirmPassword = true;
  final GlobalKey<FormState> formKey3 = GlobalKey<FormState>();

  final TextEditingController passController = TextEditingController();
  final TextEditingController passConfirmController = TextEditingController();

  bool validarEstructuraContrasena(String value) {
    String patron =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~_]).{8,}$';
    RegExp regExp = RegExp(patron);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   systemOverlayStyle: systemBarDark,
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        // ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset('assets/png/02 1.png'),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.075, left: size.width * 0.037),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
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
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.055),
                      child: const Text(
                        "Crear contraseña",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 20,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.013),
                      child: SizedBox(
                        width: size.width * 0.91,
                        height: size.height * 0.095,
                        child: const Text(
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
                      padding: EdgeInsets.only(
                          top: size.height * 0.035, right: size.width * 0.037),
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
                              padding:
                                  EdgeInsets.only(top: size.height * 0.005),
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
                                          width: size.width * 0.065,
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
                                  validator: (value) {
                                    print(value);
                                    if (value!.isEmpty) {
                                      setState(() {
                                        errorValidation =
                                            'Por Favor,  debes completar todos los registros para continuar';
                                      });

                                      return '';
                                    } else if (!validarEstructuraContrasena(
                                        value)) {
                                      setState(() {
                                        errorValidation =
                                            '''Ingresar al menos 8 caracteres, una mayúscula,
una minúscula, un número y un carácter especial''';
                                      });
                                      return '';
                                    }
                                    return null;
                                  }),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: size.height * 0.035),
                              child: const Text(
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
                              padding:
                                  EdgeInsets.only(top: size.height * 0.005),
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
                                        width: size.width * 0.065,
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
                                validator: (value) {
                                  print(value);
                                  if (value!.isEmpty) {
                                    setState(() {
                                      errorValidation =
                                          'Por Favor,  debes completar todos los registros para continuar';
                                    });

                                    return '';
                                  } else if (passController.text !=
                                      passConfirmController.text) {
                                    setState(() {
                                      errorValidation =
                                          'Las contraseñas no coinciden';
                                    });
                                    return '';
                                  } else if (!validarEstructuraContrasena(
                                      value)) {
                                    setState(() {
                                      errorValidation =
                                          '''Ingresar al menos 8 caracteres, una mayúscula,
una minúscula, un número y un carácter especial''';
                                    });
                                    return '';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: size.height * 0.035),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      width: size.width * 0.065,
                                      height: size.width * 0.065,
                                      padding: EdgeInsets.only(
                                          top: size.height * 0.006,
                                          bottom: size.height * 0.006,
                                          left: size.width * 0.0097,
                                          right: size.width * 0.0077),
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
                                    onTap: () {
                                      setState(() {
                                        if (visible == false) {
                                          visible = true;
                                          errorValidation =
                                              'Debes aceptar los términos y condiciones';
                                        } else {
                                          visible = false;
                                        }
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.03),
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
                                        Navigator.pushNamed(context,
                                            ThermsConditionsScreen.routeName);
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
                      padding: EdgeInsets.only(
                          top: size.height * 0.255, right: size.width * 0.037),
                      child: GestureDetector(
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              height: size.height * 0.062,
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
                        onTap: () async {
                          print('walle5t');
                          if (formKey3.currentState!.validate() &&
                              passController.text ==
                                  passConfirmController.text &&
                              visible == true) {
                            print(formKey3.currentState!.validate());

                            try {
                              final Map response = await CreateWallet()
                                  .createWallet(pass: passController.text);
                              print(response);
                              if (response.isNotEmpty) {
                                Preferences.id_wallet = response['id_wallet'];
                                Preferences.public_key = response['public_key'];
                                Preferences.mnemonic = response['mnemonic'];
                                Future.delayed(Duration.zero).then((_) =>
                                    Navigator.pushNamed(
                                        context, CreateWalletScreen.routeName));
                              }
                            } catch (e) {
                              print(e);
                            }
                          } else {
                            if (visible == false) {
                              setState(() {
                                errorValidation =
                                    'Debes aceptar los términos y condiciones';
                              });
                              customModalBottomAlert(
                                  context, size, errorValidation, isLoading, '',
                                  () {
                                Navigator.pop(context);
                              });
                            }
                            customModalBottomAlert(
                                context, size, errorValidation, isLoading, '',
                                () {
                              Navigator.pop(context);
                            });
                          }
                        },
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
