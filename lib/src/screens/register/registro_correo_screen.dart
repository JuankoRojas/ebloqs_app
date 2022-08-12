import 'package:ebloqs_app/src/providers/user_info_provider.dart';
import 'package:ebloqs_app/src/screens/register/registro_link_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 130),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/Vectores/Ilustraciones/Group1825.svg',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 93.0, bottom: 5),
                child: Text(
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
                padding: const EdgeInsets.only(top: 30),
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
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
                    // final register = await AuthUserService().registerUser(
                    //     email: emailController.text,
                    //     deviceID: uuid.v4(),
                    //     type_acount: 'email');

                    // if (register["access_token"] != null) {
                    //   setState(() {
                    //     Preferences.token = register['access_token'];
                    Provider.of<UserInfoProvider>(context, listen: false)
                        .emailset(emailController.text);
                    //   });

                    Future.delayed(Duration.zero).then(
                      (_) => Navigator.pushNamedAndRemoveUntil(context,
                          RegistroLinkScreen.routeName, (route) => false),
                    );
                    // } else {
                    //   print(register);
                    // }
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
