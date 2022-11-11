import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';

import 'package:ebloqs_app/src/providers/transfer_current_provider.dart';
import 'package:ebloqs_app/src/screens/wallet/wallet_screen.dart';
import 'package:ebloqs_app/src/services/get_all_user_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/custom_modal_bottom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TransferScreen extends StatefulWidget {
  static const String routeName = 'TransferScreen';
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen>
    with AfterLayoutMixin<TransferScreen> {
  final GlobalKey<FormState> _formKey13 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey14 = GlobalKey<FormState>();
  final TextEditingController quantity2Controller = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController walletToController = TextEditingController();
  PageController pageController = PageController();
  bool? isLoadLogin = false;

  String? errorValidation;
  int current = 0;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    setState(() {
      current = Provider.of<TransferCurrentProvider>(context, listen: false)
          .getCurrent();
      if (current == 1) {
        pageController.jumpToPage(current);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // walletToController.text = Provider.of<QrInfoProvider>(context).getQr();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: size.height * 0.073509485094851),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.0729166666666667,
                      right: size.width * 0.0461805555555556),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset(
                            'assets/Vectores/Iconos/Arrow left.svg'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(child: Container()),
                      const AutoSizeText(
                        "Transferir",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 17,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                          child: SvgPicture.asset(
                              'assets/Vectores/Iconos/Question.svg')),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: size.height * 0.0379403794037941),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          width: size.width * 0.5,
                          height: size.height * 0.0640243902439025,
                          color: (current == 0)
                              ? const Color(0xfff6f4fd)
                              : const Color(0xfff9f9fa),
                          child: const Center(
                            child: AutoSizeText(
                              "Dinero",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 15,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (current == 1) {
                            setState(() {
                              current = 0;
                              Provider.of<TransferCurrentProvider>(context,
                                      listen: false)
                                  .setCurrent(0);
                            });
                            pageController.jumpToPage(
                                Provider.of<TransferCurrentProvider>(context,
                                        listen: false)
                                    .getCurrent());
                          }
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          width: size.width * 0.5,
                          height: size.height * 0.0640243902439025,
                          color: (current == 1)
                              ? const Color(0xfff6f4fd)
                              : const Color(0xfff9f9fa),
                          child: const Center(
                            child: AutoSizeText(
                              "Tokens",
                              style: TextStyle(
                                color: Color(0xff170658),
                                fontSize: 15,
                                fontFamily: "Archivo",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (current == 0) {
                            setState(() {
                              current = 1;
                              Provider.of<TransferCurrentProvider>(context,
                                      listen: false)
                                  .setCurrent(1);
                            });
                            pageController.jumpToPage(
                                Provider.of<TransferCurrentProvider>(context,
                                        listen: false)
                                    .getCurrent());
                          }
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.0260840108401084,
                    left: size.width * 0.0413194444444445,
                    right: size.width * 0.0413194444444445,
                  ),
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: 650, minHeight: 375),
                    child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Dinero(
                          formKey13: _formKey13,
                          quantityController: quantityController,
                          errorValidation: errorValidation,
                        ),
                        Tokens(
                          formKey14: _formKey14,
                          fromController: fromController,
                          toController: walletToController,
                          quantity2Controller: quantity2Controller,
                          errorValidation: errorValidation,
                        )
                      ],
                    ),
                  ),
                ),
                (current == 0)
                    ? Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.0364583333333334,
                            right: size.width * 0.0364583333333334,
                            bottom: size.height * 0.0569105691056911),
                        child: ButtonPrimary(
                            width: size.width,
                            title: 'Continuar',
                            onPressed: () {
                              if (_formKey13.currentState != null &&
                                      _formKey13.currentState!.validate() ||
                                  _formKey14.currentState != null &&
                                      _formKey14.currentState!.validate()) {
                                customModalBottomAlert(
                                    context,
                                    size,
                                    'Se ha procedido a enviar ${quantityController.text}  USD',
                                    isLoadLogin!,
                                    'assets/Vectores/Iconos/checkcircle.svg',
                                    () {
                                  Navigator.pushNamed(
                                      context, WalletScreen.routeName);
                                });
                              } else {
                                customModalBottomAlert(
                                    context,
                                    size,
                                    'Por favor,  debes completar todos los registros para continuar',
                                    isLoadLogin!,
                                    '', () {
                                  Navigator.pop(context);
                                });
                              }
                            },
                            load: isLoadLogin!,
                            disabled: isLoadLogin!),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.0130420054200542,
                                left: size.width * 0.0413194444444445,
                                right: size.width * 0.0413194444444445,
                              ),
                              child: const AutoSizeText(
                                "Tiempo estimado de 1 hora",
                                style: TextStyle(
                                  color: Color(0xff2504ca),
                                  fontSize: 13,
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.0413194444444445,
                                right: size.width * 0.0413194444444445,
                                bottom: size.height * 0.0569105691056911),
                            child: ButtonPrimary(
                                width: size.width,
                                title: 'Continuar',
                                onPressed: () {
                                  if (_formKey14.currentState!.validate()) {
                                    customModalBottomAlert(
                                        context,
                                        size,
                                        'Se ha procedido a enviar ${quantity2Controller.text} EBL',
                                        isLoadLogin!,
                                        'assets/Vectores/Iconos/checkcircle.svg',
                                        () {
                                      Navigator.pushNamed(
                                          context, WalletScreen.routeName);
                                    });
                                  } else {
                                    setState(() {
                                      errorValidation =
                                          'Por favor,  debes completar todos los registros para continuar';
                                    });
                                    customModalBottomAlert(context, size,
                                        errorValidation, isLoadLogin!, '', () {
                                      Navigator.pop(context);
                                    });
                                  }
                                },
                                load: isLoadLogin!,
                                disabled: isLoadLogin!),
                          )
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Dinero extends StatefulWidget {
  final GlobalKey<FormState> formKey13;
  final TextEditingController quantityController;
  String? errorValidation;
  Dinero(
      {Key? key,
      required this.formKey13,
      required this.errorValidation,
      required this.quantityController})
      : super(key: key);

  @override
  State<Dinero> createState() => _DineroState();
}

class _DineroState extends State<Dinero> with AfterLayoutMixin<Dinero> {
  final TextEditingController descriptionController = TextEditingController();
  String? selectedValue;
  String? byValue;
  String? toValue;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "USD", child: AutoSizeText("USD")),
      const DropdownMenuItem(value: "EUR", child: AutoSizeText("EUR")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get byItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Aldo Mora", child: AutoSizeText("Aldo Mora")),
    ];
    return menuItems;
  }

  var _textFieldHints = ['Julian Usma'];
  TextEditingController _textFieldController = TextEditingController();
  @override
  void afterFirstLayout(BuildContext context) {
    getAllUser();
  }

  getAllUser() async {
    var allUser =
        await GetAllUserService().getAllUsers(accesstoken: Preferences.token!);
    if (!mounted) return null;
    setState(() {
      _textFieldHints = allUser;
    });
    return allUser;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: widget.formKey13,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const AutoSizeText(
            "Moneda",
            style: TextStyle(
              color: Color(0xff170658),
              fontSize: 13,
              fontFamily: "Archivo",
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.00948509485094851,
            ),
            child: DropdownButtonFormField(
                icon:
                    SvgPicture.asset('assets/Vectores/Iconos/dwon chevron.svg'),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: UtilSize.height(14, context),
                      bottom: UtilSize.height(14, context),
                      left: UtilSize.width(16, context),
                      right: UtilSize.width(16, context)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    setState(() {
                      widget.errorValidation =
                          'Por favor,  debes completar todos los registros para continuar';
                    });

                    return '';
                  }
                  return null;
                },
                items: dropdownItems),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const AutoSizeText(
              "Cantidad",
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
              top: size.height * 0.00948509485094851,
            ),
            child: TextFormField(
              controller: widget.quantityController,
              maxLength: 50,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                hintText: '100',
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffcdccd1), width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              validator: (value) {
                if (value == null || widget.quantityController.text.isEmpty) {
                  setState(() {
                    widget.errorValidation =
                        'Por favor,  debes completar todos los registros para continuar';
                  });

                  return '';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const AutoSizeText(
              "De:",
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
                top: size.height * 0.00948509485094851,
              ),
              child: Container(
                width: size.width,
                padding: EdgeInsets.only(
                    left: size.width * 0.0426666666666667,
                    top: size.height * 0.0197044334975369,
                    bottom: size.height * 0.0197044334975369),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: const Color(0xffcdccd1),
                    width: 1,
                  ),
                  color: Colors.white,
                ),
                child: AutoSizeText(
                  Preferences.userName!,
                  style: const TextStyle(
                    color: Color(0xff383346),
                    fontSize: 16,
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const AutoSizeText(
              "Para:",
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
              top: size.height * 0.00948509485094851,
            ),
            child: RawAutocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return _textFieldHints.where((String option) {
                  return option
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                debugPrint('$selection selected');
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                _textFieldController = textEditingController;
                return TextFormField(
                  controller: _textFieldController,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    hintText: 'Buscar persona que recibe',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffcdccd1), width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xffcdccd1), width: 0.0),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onFieldSubmitted: (String value) {
                    onFieldSubmitted();
                  },
                  validator: (value) {
                    if (value == null) {
                      setState(() {
                        widget.errorValidation =
                            'Por favor,  debes completar todos los registros para continuar';
                      });

                      return '';
                    }
                    return null;
                  },
                );
              },
              optionsViewBuilder: (BuildContext context,
                  AutocompleteOnSelected<String> onSelected,
                  Iterable<String> options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    child: SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: options.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index >= options.length) {
                            return TextButton(
                              child: const AutoSizeText('clear'),
                              onPressed: () {
                                _textFieldController.clear();
                              },
                            );
                          }
                          final String option = options.elementAt(index);
                          return GestureDetector(
                            onTap: () {
                              onSelected(option);
                            },
                            child: ListTile(
                              title: AutoSizeText(option),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const AutoSizeText(
              "Descripción",
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
              top: size.height * 0.00948509485094851,
            ),
            child: TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              maxLength: 50,
              maxLines: 5,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  hintText: "Ubique descripción opcional"),
            ),
          )
        ],
      ),
    );
  }
}

class Tokens extends StatefulWidget {
  final GlobalKey<FormState> formKey14;
  final TextEditingController quantity2Controller;
  final TextEditingController fromController;
  final TextEditingController toController;

  String? errorValidation;
  Tokens(
      {Key? key,
      required this.formKey14,
      required this.errorValidation,
      required this.quantity2Controller,
      required this.fromController,
      required this.toController})
      : super(key: key);

  @override
  State<Tokens> createState() => _TokensState();
}

class _TokensState extends State<Tokens> {
  final TextEditingController walletToController = TextEditingController();

  final TextEditingController description2Controller = TextEditingController();
  String? selectedValue2;

  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "EBL", child: AutoSizeText("EBL")),
      // const DropdownMenuItem(value: "EBL2", child: AutoSizeText("EBL2")),
      // const DropdownMenuItem(value: "EBL3", child: AutoSizeText("EBL3")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      key: widget.formKey14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const AutoSizeText(
            "Tokens",
            style: TextStyle(
              color: Color(0xff170658),
              fontSize: 13,
              fontFamily: "Archivo",
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.00948509485094851,
            ),
            child: DropdownButtonFormField(
                icon:
                    SvgPicture.asset('assets/Vectores/Iconos/dwon chevron.svg'),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                value: selectedValue2,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue2 = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    setState(() {
                      widget.errorValidation =
                          'Por favor,  debes completar todos los registros para continuar';
                    });

                    return '';
                  }
                  return null;
                },
                items: dropdownItems2),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const AutoSizeText(
              "Cantidad",
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
              top: size.height * 0.00948509485094851,
            ),
            child: TextFormField(
              controller: widget.quantity2Controller,
              maxLength: 50,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                hintText: '100',
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffcdccd1), width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              validator: (value) {
                if (value == null) {
                  setState(() {
                    widget.errorValidation =
                        'Por favor,  debes completar todos los registros para continuar';
                  });

                  return '';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const AutoSizeText(
              "De:",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 13,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.00948509485094851),
            child: Container(
              width: size.width,
              height: UtilSize.height(52, context),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.0388888888888889),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color(0xffcdccd1),
                  width: 1,
                ),
              ),
              child: TextFormField(
                controller: widget.fromController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Ingresa tu frase secreta",
                ),
                validator: (value) {
                  if (value == null) {
                    setState(() {
                      widget.errorValidation =
                          'Por favor,  debes completar todos los registros para continuar';
                    });

                    return '';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const AutoSizeText(
              "Para:",
              style: TextStyle(
                color: Color(0xff170658),
                fontSize: 13,
                fontFamily: "Archivo",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.00948509485094851),
            child: TextFormField(
              controller: widget.toController,
              decoration: InputDecoration(
                hintText: 'Ingresa la llave criptográfica pública',
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffcdccd1), width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                  borderRadius: BorderRadius.circular(4),
                ),
                // suffixIcon: Padding(
                //   padding:
                //       EdgeInsets.only(right: size.width * 0.0426666666666667),
                //   child: GestureDetector(
                //     child: SvgPicture.asset(
                //       'assets/Vectores/Iconos/qr2.svg',
                //       width: 20,
                //       color: const Color(0xff4A0086),
                //     ),
                //     onTap: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const QrViewScreen()));
                //     },
                //   ),
                // )
              ),
              validator: (value) {
                if (value == null) {
                  setState(() {
                    widget.errorValidation =
                        'Por favor, debes completar todos los registros para continuar';
                  });

                  return '';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const AutoSizeText(
              "Descripción",
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
              top: size.height * 0.00948509485094851,
            ),
            child: TextFormField(
              controller: description2Controller,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffcdccd1), width: 0.0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  hintText: "Ingrese descripción opcional"),
            ),
          )
        ],
      ),
    );
  }
}
