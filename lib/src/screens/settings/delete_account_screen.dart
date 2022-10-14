import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/custom_appbar_pop_question.dart';
import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatefulWidget {
  static const String routeName = 'DeleteAccountScreen';
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  bool load = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0738916256157636,
                left: size.width * 0.064,
                right: size.width * 0.0426666666666667),
            child: const CustomAppbarWithPopAndQuestion(
              text: "Eliminar cuenta",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.0467980295566502,
            ),
            child: const AutoSizeText(
              "Antes de eliminar tu cuenta confirma lo siguiente:",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0233990147783251,
                left: size.width * 0.04,
                right: size.width * 0.04),
            child: Container(
              width: size.width,
              height: size.height * 0.172413793103448,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xfff9f9fa),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.0233990147783251,
                    left: size.width * 0.04,
                    right: size.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.0307881773399015,
                        left: size.width * 0.04,
                        right: size.width * 0.04,
                      ),
                      child: const AutoSizeText(
                        "1. La cuenta no se encuentra en ningún país restringido",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.04,
                        right: size.width * 0.04,
                      ),
                      child: const AutoSizeText(
                        "2. El saldo total es inferior a 0,0001 BTC",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.04,
                        right: size.width * 0.04,
                      ),
                      child: const AutoSizeText(
                        "3. No tienes préstamos",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.0147783251231527,
              left: size.width * 0.04,
            ),
            child: SizedBox(
              width: size.width * 0.92,
              child: const AutoSizeText(
                "Para garantizar la seguridad de tu cuenta y proteger tus activos, Ebloqs revisará detenidamente las solicitudes de eliminación de cuentas antes de eliminarlas. Para comenzar la solicitud de eliminación de cuentas, ponte en contacto con servicio al cliente.",
                style: TextStyle(
                  color: Color(0xffeb4040),
                  fontSize: 12,
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.431034482758621,
                left: size.width * 0.064,
                right: size.width * 0.0426666666666667),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ButtonPrimary(
                  width: size.width,
                  title: 'Eliminar cuenta',
                  onPressed: () {},
                  load: load),
            ),
          )
        ],
      ),
    );
  }
}
