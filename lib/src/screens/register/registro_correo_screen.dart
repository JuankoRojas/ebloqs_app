import 'package:ebloqs_app/src/providers/user_info_provider.dart';
import 'package:ebloqs_app/src/screens/register/registro_link_screen.dart';
import 'package:ebloqs_app/src/services/auth_user_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class RegistroCorreoScreen extends StatefulWidget {
  static const routeName = 'RegistroCorreoScreen';
  const RegistroCorreoScreen({Key? key}) : super(key: key);

  @override
  State<RegistroCorreoScreen> createState() => _RegistroCorreoScreenState();
}

class _RegistroCorreoScreenState extends State<RegistroCorreoScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final uuid = const Uuid();

  bool validarEstructuraEmail(String value) {
    String patron =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(patron);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height * 0.16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/Vectores/Ilustraciones/Group1825.svg',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.115, bottom: size.height * 0.007),
                child: const Text(
                  'Regístrate',
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 17,
                    fontFamily: "Archivo",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Text(
                'Inicia sesión en ebloqs con tu correo',
                style: TextStyle(
                  color: Color(0xff170658),
                  fontSize: 13,
                  fontFamily: "Archivo",
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.038),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                        color: Color(0xff9B99A3),
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor ingresa un email';
                      } else if (!validarEstructuraEmail(value)) {
                        return 'Por favor ingresa un email válido';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.02),
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
                          "Enviar",
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
                    final register = await AuthUserService().registerUser(
                        email: emailController.text,
                        name: emailController.text.split('@').first,
                        deviceID: uuid.v4(),
                        type_acount: 'email');

                    if (register["access_token"] != null) {
                      setState(() {
                        Preferences.token = register['access_token'];
                        Provider.of<UserInfoProvider>(context, listen: false)
                            .emailset(emailController.text);
                      });

                      Future.delayed(Duration.zero).then(
                        (_) => Navigator.pushNamed(
                          context,
                          RegistroLinkScreen.routeName,
                        ),
                      );
                    } else {
                      print(register);
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
