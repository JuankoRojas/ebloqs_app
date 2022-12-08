import 'package:auto_size_text/auto_size_text.dart';
import 'package:clipboard/clipboard.dart';
import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/screens/withdraw/input_quantity_screen.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/custom_modal_bottom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpGAuthenticatorScreen extends StatefulWidget {
  static const routeName = 'OtpGAuthenticatorScreen';
  const OtpGAuthenticatorScreen({super.key});

  @override
  State<OtpGAuthenticatorScreen> createState() =>
      _OtpGAuthenticatorScreenState();
}

class _OtpGAuthenticatorScreenState extends State<OtpGAuthenticatorScreen> {
  final GlobalKey<FormState> _otpForm = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  String? errorValidation;
  bool loading = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///=> Creación del titulo de header

              Padding(
                padding: EdgeInsets.only(
                  top: UtilSize.height(24, context),
                  left: UtilSize.width(15, context),
                  right: UtilSize.width(15, context),
                ),
                child: const AutoSizeText(
                  "Verificación con Google Authenticator",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 17,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              ///=> Creación del subtitulo de header

              Padding(
                padding: EdgeInsets.only(
                  top: UtilSize.height(12, context),
                  left: UtilSize.width(15, context),
                  right: UtilSize.width(15, context),
                ),
                child: const AutoSizeText(
                  "Así, se aplicará la vinculación correctamente",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 14,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              ///=> Creación de la imagen de la pantalla
              Padding(
                padding: EdgeInsets.only(
                  top: UtilSize.height(59, context),
                ),
                child: SvgPicture.asset(
                    "assets/Vectores/Ilustraciones/Group 2042.svg"),
              ),

              ///=> Creación del formulario de ingreso de otp
              Form(
                key: _otpForm,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: UtilSize.height(53, context),
                      ),
                      child: const AutoSizeText(
                        "Introduce el código de 6 dígitos de Google Authenticator",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 13,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: UtilSize.height(21, context),
                        left: UtilSize.width(15, context),
                        right: UtilSize.width(15, context),
                      ),
                      child: TextFormField(
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        style: const TextStyle(
                          color: Color(0xff2504ca),
                          fontSize: 14,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          suffixIconConstraints: BoxConstraints(
                            maxHeight: 20,
                            maxWidth: UtilSize.width(60, context),
                          ),
                          filled: false,
                          suffixIcon: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: GestureDetector(
                                  child: const AutoSizeText(
                                    "Pegar",
                                    style: TextStyle(
                                      color: Color(0xff2504CA),
                                      fontSize: 14,
                                      fontFamily: "Archivo",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  onTap: () {
                                    FlutterClipboard.paste().then((value) {
                                      setState(() {
                                        otpController.text = value;
                                      });
                                    });
                                  }),
                            ),
                          ),
                          labelStyle: TextStyle(
                            color: const Color(0xff9B99A3),
                            fontSize: UtilSize.width(14, context),
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onChanged: (value) {
                          print("OTP");
                          print(value);
                          setState(() {
                            if (value.isNotEmpty) {}
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            setState(() {
                              errorValidation =
                                  'Por favor,  debes completar el código otp para continuar';
                            });

                            return '';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              ///=> Creación del botón de Enviar
              Padding(
                padding: EdgeInsets.only(
                  top: UtilSize.height(59, context),
                  left: UtilSize.width(15, context),
                  right: UtilSize.width(15, context),
                ),
                child: ButtonPrimary(
                  width: size.width,
                  title: "Enviar",
                  onPressed: () {
                    if (otpController.text.isNotEmpty &&
                        otpController.text.length == 6) {
                      Navigator.pushNamed(
                          context, InputQuantityScreen.routeName);
                    } else {
                      customModalBottomAlert(
                          context,
                          size,
                          'Por favor,  debes completar el código otp para continuar',
                          isLoading,
                          '', () {
                        Navigator.pop(context);
                      });
                    }
                  },
                  load: loading,
                  disabled: loading,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
