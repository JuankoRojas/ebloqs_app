import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/widgets/custom_appbar_pop_question.dart';
import 'package:ebloqs_app/src/widgets/custom_modal_bottom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCardAcreen extends StatefulWidget {
  static const String routeName = 'AddCardAcreen';
  const AddCardAcreen({super.key});

  @override
  State<AddCardAcreen> createState() => _AddCardAcreenState();
}

class _AddCardAcreenState extends State<AddCardAcreen> {
  final GlobalKey<FormState> formKeyAddCard = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  String? errorValidation;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0738916256157636,
                left: size.width * 0.064,
                right: size.width * 0.0426666666666667),
            child: const CustomAppbarWithPopAndQuestion(
              text: 'Agregar Tarjeta',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.0344827586206897),
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
                top: size.height * 0.0394088669950739,
                left: size.width * 0.04,
                right: size.width * 0.04),
            child: Form(
              key: formKeyAddCard,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: size.height * 0.0257142857142857),
                    child: const AutoSizeText(
                      "Nombre en Tarjeta",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 13,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: size.height * 0.00985221674876847),
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      maxLength: 50,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
                      ],
                      decoration: InputDecoration(
                        counterText: '',
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
                          setState(() {
                            errorValidation =
                                'Por favor,  debes completar todos los registros para continuar';
                          });

                          return '';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: size.height * 0.0197044334975369),
                    child: const AutoSizeText(
                      "Número de la tarjeta",
                      style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 13,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: size.height * 0.00985221674876847),
                    child: TextFormField(
                      controller: bankNameController,
                      keyboardType: TextInputType.number,
                      maxLength: 50,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                      ],
                      decoration: InputDecoration(
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
                          setState(() {
                            errorValidation =
                                'Por favor,  debes completar todos los registros para continuar';
                          });

                          return '';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: size.height * 0.0197044334975369),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.4,
                          height: size.height * 0.125615763546798,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AutoSizeText(
                                "F. Vencimiento",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.00985221674876847),
                                child: TextFormField(
                                  controller: expirationDateController,
                                  keyboardType: TextInputType.text,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9/]"))
                                  ],
                                  decoration: InputDecoration(
                                    hintText: "MM/AA",
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
                                      setState(() {
                                        errorValidation =
                                            'Por favor,  debes completar todos los registros para continuar';
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
                        SizedBox(
                          width: size.width * 0.4,
                          height: size.height * 0.125615763546798,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AutoSizeText(
                                "CVV",
                                style: TextStyle(
                                  color: Color(0xff170658),
                                  fontSize: 13,
                                  fontFamily: "Archivo",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.00985221674876847),
                                child: TextFormField(
                                  controller: cvvController,
                                  maxLength: 3,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    hintText: 'XXX',
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
                                      setState(() {
                                        errorValidation =
                                            'Por favor,  debes completar todos los registros para continuar';
                                      });

                                      return '';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
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
              top: size.height * 0.357142857142857,
              left: size.width * 0.04,
              right: size.width * 0.04,
            ),
            child: GestureDetector(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: size.height * 0.0640394088669951,
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
                    child: AutoSizeText(
                      "Agregar Tarjeta",
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
                if (formKeyAddCard.currentState!.validate()) {
                } else {
                  setState(() {
                    errorValidation =
                        'Por favor,  debes completar todos los registros para continuar';
                  });
                  customModalBottomAlert(
                      context, size, errorValidation, isLoading, '', () {
                    Navigator.pop(context);
                  });
                }
              },
            ),
          ),
        ],
      )),
    );
  }
}
