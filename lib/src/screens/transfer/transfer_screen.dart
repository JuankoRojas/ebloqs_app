import 'package:ebloqs_app/src/providers/qr_info_provider.dart';
import 'package:ebloqs_app/src/screens/qr/qr_view_screen.dart';
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

class _TransferScreenState extends State<TransferScreen> {
  final GlobalKey<FormState> _formKey13 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey14 = GlobalKey<FormState>();
  PageController pageController = PageController();
  bool? isLoadLogin = false;
  int _curr = 0;
  String? errorValidation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('current : $_curr');
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
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
                    const Text(
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
                padding: EdgeInsets.only(top: size.height * 0.0379403794037941),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: size.width * 0.5,
                        height: size.height * 0.0640243902439025,
                        color: const Color(0xfff6f4fd),
                        child: const Center(
                          child: Text(
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
                        if (_curr == 1) {
                          setState(() {
                            _curr = 0;
                          });
                          pageController.jumpToPage(_curr);
                        }
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: size.width * 0.5,
                        height: size.height * 0.0640243902439025,
                        color: const Color(0xfff9f9fa),
                        child: const Center(
                          child: Text(
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
                        if (_curr == 0) {
                          setState(() {
                            _curr = 1;
                          });
                          pageController.jumpToPage(_curr);
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
                child: SizedBox(
                  height: size.height * 0.800492610837438,
                  width: double.infinity,
                  child: PageView(
                    controller: pageController,
                    children: [
                      Dinero(
                        formKey13: _formKey13,
                        errorValidation: errorValidation,
                      ),
                      Tokens(
                        formKey14: _formKey14,
                        errorValidation: errorValidation,
                      )
                    ],
                  ),
                ),
              ),
              (_curr == 0)
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.0426829268292683,
                          left: size.width * 0.0364583333333334,
                          right: size.width * 0.0364583333333334,
                          bottom: size.height * 0.0569105691056911),
                      child: ButtonPrimary(
                          width: size.width,
                          title: 'Continuar',
                          onPressed: () {
                            if (_formKey13.currentState!.validate()) {
                            } else {
                              setState(() {
                                errorValidation =
                                    'Por Favor,  debes completar todos los registros para continuar';
                              });
                              customModalBottomAlert(context, size,
                                  errorValidation, isLoadLogin!, '');
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
                            child: const Text(
                              "Tiempo estimado de 1 hora",
                              style: TextStyle(
                                color: Color(0xff2504ca),
                                fontSize: 13,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.0248983739837399,
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
                                      'Se Ha Procedido a enviar ',
                                      isLoadLogin!,
                                      'assets/Vectores/Iconos/checkcircle.svg');
                                } else {
                                  setState(() {
                                    errorValidation =
                                        'Por Favor,  debes completar todos los registros para continuar';
                                  });
                                  customModalBottomAlert(context, size,
                                      errorValidation, isLoadLogin!, '');
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
    );
  }
}

class Dinero extends StatefulWidget {
  final GlobalKey<FormState> formKey13;
  String? errorValidation;
  Dinero({Key? key, required this.formKey13, required this.errorValidation})
      : super(key: key);

  @override
  State<Dinero> createState() => _DineroState();
}

class _DineroState extends State<Dinero> {
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedValue;
  String? byValue;
  String? toValue;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "USD", child: Text("USD")),
      const DropdownMenuItem(value: "EUR", child: Text("EUR")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get byItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Aldo Mora", child: Text("Aldo Mora")),
    ];
    return menuItems;
  }

  var _textFieldHints = ['Julian Usma'];
  TextEditingController _textFieldController = TextEditingController();
  @override
  void initState() {
    getAllUser();
    super.initState();
  }

  getAllUser() async {
    var allUser = await GetAllUserService().getAllUsers();
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
          const Text(
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
                          'Por Favor,  debes completar todos los registros para continuar';
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
            child: const Text(
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
              controller: quantityController,
              maxLength: 50,
              keyboardType: const TextInputType.numberWithOptions(),
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
              validator: (value) {
                if (value == null) {
                  setState(() {
                    widget.errorValidation =
                        'Por Favor,  debes completar todos los registros para continuar';
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
            child: const Text(
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
                height: size.height * 0.0640394088669951,
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
                child: Text(
                  Preferences.userName!,
                  style: const TextStyle(
                    color: Color(0xff383346),
                    fontSize: 14,
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const Text(
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
                            'Por Favor,  debes completar todos los registros para continuar';
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
                              child: const Text('clear'),
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
                              title: Text(option),
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
            child: const Text(
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
  String? errorValidation;
  Tokens({Key? key, required this.formKey14, required this.errorValidation})
      : super(key: key);

  @override
  State<Tokens> createState() => _TokensState();
}

class _TokensState extends State<Tokens> {
  final TextEditingController quantity2Controller = TextEditingController();
  final TextEditingController walletToController = TextEditingController();
  final TextEditingController description2Controller = TextEditingController();
  String? selectedValue2;

  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "EBL", child: Text("EBL")),
      // const DropdownMenuItem(value: "EBL2", child: Text("EBL2")),
      // const DropdownMenuItem(value: "EBL3", child: Text("EBL3")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (Provider.of<QrInfoProvider>(context).getQr() != null) {
      walletToController.text = Provider.of<QrInfoProvider>(context).getQr()!;
    }
    return Form(
      key: widget.formKey14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
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
                          'Por Favor,  debes completar todos los registros para continuar';
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
            child: const Text(
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
              controller: quantity2Controller,
              maxLength: 50,
              keyboardType: const TextInputType.numberWithOptions(),
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
              validator: (value) {
                if (value == null) {
                  setState(() {
                    widget.errorValidation =
                        'Por Favor,  debes completar todos los registros para continuar';
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
            child: const Text(
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
              height: size.height * 0.0616531165311653,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.0388888888888889),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color(0xffcdccd1),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    Preferences.id_wallet!,
                    style: const TextStyle(
                      color: Color(0xff383346),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.018970189701897,
            ),
            child: const Text(
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
              controller: walletToController,
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
                  suffixIcon: Padding(
                    padding:
                        EdgeInsets.only(right: size.width * 0.0426666666666667),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        'assets/Vectores/Iconos/qr2.svg',
                        width: 20,
                        color: const Color(0xff4A0086),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QrViewScreen()));
                      },
                    ),
                  )),
              validator: (value) {
                if (value == null) {
                  setState(() {
                    widget.errorValidation =
                        'Por Favor,  debes completar todos los registros para continuar';
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
            child: const Text(
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
                  hintText: "Ubique descripción opcional"),
            ),
          )
        ],
      ),
    );
  }
}
