import 'package:after_layout/after_layout.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:ebloqs_app/src/providers/locations_provider.dart';
import 'package:ebloqs_app/src/screens/indentity/address_screen.dart';
import 'package:ebloqs_app/src/services/auth_user_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/custom_modal_bottom_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class PersonalInformation extends StatefulWidget {
  static const routeName = 'PersonalInformation';
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation>
    with AfterLayoutMixin<PersonalInformation> {
  DateTime _selectedDate = DateTime.now();
  bool? isLoadLogin = false;
  final GlobalKey<FormState> _formKey11 = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  String? phoneNumber;
  String? errorValidation;
  bool isLoading = false;
  bool isCompleted = true;

  @override
  void afterFirstLayout(BuildContext context) {
    useLocation();
  }

  void useLocation() async {
    var locationProvider =
        Provider.of<LocationsProvider>(context, listen: false);
    if (locationProvider.requestPermisionLocation() !=
            LocationPermission.whileInUse ||
        locationProvider.requestPermisionLocation() !=
            LocationPermission.always) {
      await locationProvider.requestPermisionLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var dateParse = DateTime.parse(_selectedDate.toString());

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    String locationValue =
        Provider.of<LocationsProvider>(context).countryCode.text;
    if (locationValue.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    print('accesstoken: ${Preferences.token!}');
    return Scaffold(
      appBar: AppBar(
        leadingWidth: size.width * 0.139720558882236,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemBarDark,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.0359342915811089),
            child: SvgPicture.asset(
              'assets/Vectores/Iconos/Arrow left.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: const Text(
          "Información personal ",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff170658),
            fontSize: 17,
            fontFamily: "Archivo",
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.0291569476841053,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.0359342915811089),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/Vectores/Iconos/id.svg'),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        "Información general",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 13,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.0314162234042553,
                    left: size.width * 0.0359342915811089,
                    right: size.width * 0.0359342915811089),
                child: Container(
                  width: size.width,
                  height: 4,
                  padding: EdgeInsets.only(right: size.width * 0.67),
                  decoration: const BoxDecoration(
                      color: Color(0xffeae4fc),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 94,
                    ),
                    child: Container(
                        width: size.width * 0.217376940865544,
                        height: size.width * 0.217376940865544,
                        padding: EdgeInsets.only(
                            right: size.width * 0.577770470240053),
                        decoration: const BoxDecoration(
                            color: Color(0xff170658),
                            borderRadius:
                                BorderRadius.all(Radius.circular(3)))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.028023352793995),
                child: Form(
                  key: _formKey11,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.0359342915811089),
                        child: const Text(
                          "Nacionalidad",
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
                            top: size.height * 0.00946265630280501,
                            left: size.width * 0.0194444444444445,
                            right: size.width * 0.0194444444444445),
                        child: SizedBox(
                          child: CountryListPick(
                              appBar: AppBar(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                title: const Text(
                                  'Selecciona tu país',
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 17,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                centerTitle: true,
                                leadingWidth: size.width * (44 / size.width),
                                leading: Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * (16 / size.width)),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/Arrow left.svg',
                                    ),
                                  ),
                                ),
                              ),
                              pickerBuilder:
                                  (context, CountryCode? countryCode) {
                                return Container(
                                  height: size.height * 0.0655050016134237,
                                  width: size.width,
                                  padding: EdgeInsets.only(
                                    top: size.height * (11 / size.height),
                                    right: size.width * (6 / size.width),
                                    bottom: size.height * (10 / size.height),
                                    left: size.width * (7 / size.width),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: const Color(0xffcdccd1),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        countryCode!.name!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontFamily: "Archivo",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width *
                                                0.0194444444444445),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(0, 3),
                                                blurRadius: 6,
                                              ),
                                            ],
                                          ),
                                          child: Image.asset(
                                            countryCode.flagUri!,
                                            package: 'country_list_pick',
                                            width:
                                                size.width * (24 / size.width),
                                            height: size.height *
                                                (24 / size.height),
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      SvgPicture.asset(
                                          'assets/Vectores/Iconos/dwon chevron.svg',
                                          width: 24),
                                    ],
                                  ),
                                );
                              },
                              theme: CountryTheme(
                                  isShowFlag: true,
                                  isShowTitle: false,
                                  isShowCode: false,
                                  isDownIcon: true,
                                  showEnglishName: false,
                                  labelColor: const Color(0xff170658),
                                  searchText: 'Buscar',
                                  searchHintText: 'Buscar país',
                                  lastPickText: 'Ultima selección'),
                              // Set default value
                              initialSelection: locationValue,
                              // or
                              // initialSelection: 'US'
                              onChanged: (CountryCode? countryCode) {
                                print(countryCode.toString());
                                setState(() {
                                  locationValue = countryCode!.name!;
                                });
                              },
                              // Whether to allow the widget to set a custom UI overlay
                              useUiOverlay: true,
                              // Whether the country list should be wrapped in a SafeArea
                              useSafeArea: false),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.0187699011228423,
                            left: size.width * 0.0359342915811089),
                        child: const Text(
                          "Nombres",
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
                            top: size.height * 0.00946265630280501,
                            left: size.width * 0.0359342915811089,
                            right: size.width * 0.0359342915811089),
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z ]')),
                          ],
                          maxLength: 50,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                errorValidation =
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
                          top: size.height * 0.0187699011228423,
                          left: size.width * 0.0359342915811089,
                        ),
                        child: const Text(
                          "Apellidos",
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
                            top: size.height * 0.00946265630280501,
                            left: size.width * 0.0359342915811089,
                            right: size.width * 0.0359342915811089),
                        child: TextFormField(
                          controller: lastNameController,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z ]')),
                          ],
                          maxLength: 50,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              setState(() {
                                errorValidation =
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
                          top: 16,
                          left: size.width * 0.0359342915811089,
                        ),
                        child: const Text(
                          "Fecha de nacimiento",
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
                            top: size.height * 0.00946265630280501,
                            left: size.width * 0.0359342915811089,
                            right: size.width * 0.0359342915811089),
                        child: GestureDetector(
                          child: Container(
                            width: size.width,
                            height: size.height * 0.0655050016134237,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xffCDCCD1),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                    color: Color(0xff383346),
                                    fontSize: 14,
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                SvgPicture.asset(
                                  'assets/Vectores/Iconos/dwon chevron.svg',
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              useRootNavigator: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    content: StatefulBuilder(
                                      builder: (context, setState) {
                                        return Container(
                                          width: 400.0,
                                          height: 200.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: ScrollDatePicker(
                                            selectedDate: _selectedDate,
                                            options: const DatePickerOptions(
                                                isLoop: false),
                                            locale: const Locale('es'),
                                            minimumDate: DateTime(1950),
                                            maximumDate: DateTime(2004),
                                            onDateTimeChanged:
                                                (DateTime value) {
                                              setState(() {
                                                _selectedDate = value;
                                              });
                                            },
                                          ),
                                        );
                                      },
                                    ));
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.0187699011228423,
                          left: size.width * 0.0359342915811089,
                        ),
                        child: const Text(
                          "Número documento identidad",
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
                            top: size.height * 0.00946265630280501,
                            left: size.width * 0.0359342915811089,
                            right: size.width * 0.0359342915811089),
                        child: TextFormField(
                          controller: idNumberController,
                          keyboardType: TextInputType.number,
                          maxLength: 50,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xffCDCCD1)),
                              borderRadius: BorderRadius.circular(4),
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
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.0187699011228423,
                          left: size.width * 0.0359342915811089,
                        ),
                        child: const Text(
                          "Número de teléfono",
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
                              top: size.height * 0.00946265630280501,
                              left: size.width * 0.0359342915811089,
                              right: size.width * 0.0359342915811089),
                          child: IntlPhoneField(
                            flagsButtonPadding: EdgeInsets.only(
                                left: size.width * 0.0359342915811089,
                                right: size.width * 0.0359342915811089),
                            keyboardType: TextInputType.phone,
                            showDropdownIcon: false,
                            invalidNumberMessage: '',
                            disableLengthCheck: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              counterText: '',
                              suffixIconConstraints:
                                  const BoxConstraints(maxWidth: 44),
                              suffixIcon: Padding(
                                padding: EdgeInsetsDirectional.only(
                                    end: size.width * 0.0359342915811089),
                                child: SvgPicture.asset(
                                  'assets/Vectores/Iconos/dwon chevron.svg',
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: isCompleted
                                        ? const Color(0xffCDCCD1)
                                        : Colors.red),
                              ),
                            ),
                            initialCountryCode: locationValue,
                            validator: (PhoneNumber? value) {
                              print('value: $value');
                              if (value!.number.isEmpty) {
                                setState(() {
                                  errorValidation =
                                      'Por Favor,  debes completar todos los registros para continuar';
                                });

                                return '';
                              }
                              return null;
                            },
                            onChanged: (phone) {
                              setState(() {
                                phoneNumber = phone.completeNumber;
                              });
                            },
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.046166529266282,
                            left: size.width * 0.0359342915811089,
                            right: size.width * 0.0359342915811089,
                            bottom: 34),
                        child: ButtonPrimary(
                            width: size.width,
                            title: 'Continuar',
                            onPressed: () async {
                              if (_formKey11.currentState!.validate() &&
                                  phoneNumber != null &&
                                  phoneNumber!.isNotEmpty) {
                                isCompleted = true;
                                final response = await AuthUserService()
                                    .personalData(
                                        accesstoken: Preferences.token!,
                                        nationality: locationValue,
                                        name: nameController.text,
                                        lastname: lastNameController.text,
                                        birthdayDate: formattedDate,
                                        phoneNumber: phoneNumber!,
                                        dniNumber: idNumberController.text);
                                if (response.runtimeType != String &&
                                    response['name'] != null) {
                                  Preferences.userName =
                                      '${response['name']} ${response['lastname']}';
                                  Future.delayed(Duration.zero).then((value) =>
                                      Navigator.pushNamed(
                                          context, AddressScreen.routeName));
                                }
                              } else {
                                setState(() {
                                  isCompleted = false;
                                  errorValidation =
                                      'Por Favor,  debes completar todos los registros para continuar';
                                });
                                customModalBottomAlert(context, size,
                                    errorValidation, isLoading, '', () {
                                  Navigator.pop(context);
                                });
                              }
                            },
                            load: isLoadLogin!,
                            disabled: isLoadLogin!),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
